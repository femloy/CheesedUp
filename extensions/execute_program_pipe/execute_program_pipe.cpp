/// @author YellowAfterlife

#include "stdafx.h"
#include <stdio.h>
#include <stdlib.h>

#if defined(WIN32)
#define dllx extern "C" __declspec(dllexport)
#elif defined(GNUC)
#define dllx extern "C" __attribute__ ((visibility("default"))) 
#else
#define dllx extern "C"
#endif

#define trace(...) { printf("[execute_program_pipe:%d] ", __LINE__); printf(__VA_ARGS__); printf("\n"); fflush(stdout); }

template<typename T> struct dllx_buf {
private:
	size_t capacity = 0;
public:
	T* arr = 0;
	dllx_buf() {}
	bool prepare(size_t nsize, const char* intent) {
		if (capacity < nsize) {
			if (capacity * 2 > nsize) nsize = capacity * 2;
			auto b = realloc(arr, nsize * sizeof(T));
			if (b) {
				arr = (T*)b;
				capacity = nsize;
			} else {
				trace("Failed to realloc %d bytes for %s", nsize * sizeof(T), intent);
				return false;
			}
		}
		return true;
	}
	bool set(const T* val, size_t size, const char* intent) {
		if (prepare(size, intent)) {
			memcpy(arr, val, sizeof(T) * size);
			return true;
		} else return false;
	}
	bool cat(const T* val, size_t size, size_t pos, const char* intent) {
		if (prepare(pos + size, intent)) {
			memcpy(arr + pos, val, size);
			return true;
		} else return false;
	}
};
struct dllx_widen {
	dllx_buf<WCHAR> buf;
	LPCWSTR proc(const char* val, const char* intent) {
		auto want = MultiByteToWideChar(CP_UTF8, 0, val, -1, buf.arr, 0);
		if (!buf.prepare(want, intent)) return 0;
		MultiByteToWideChar(CP_UTF8, 0, val, -1, buf.arr, want);
		return buf.arr;
	}
};
const char* dllx_get_last_error(char* context, int* out_error) {
	auto e = GetLastError();
	if (out_error) *out_error = e;
	LPVOID buf;
	FormatMessageA(
		FORMAT_MESSAGE_ALLOCATE_BUFFER|FORMAT_MESSAGE_FROM_SYSTEM|FORMAT_MESSAGE_IGNORE_INSERTS,
		NULL, e, MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
		(LPSTR)&buf, 0, NULL
	);
	auto buflen = lstrlenA((LPSTR)buf);
	//
	static char tmp[sizeof " failed (#-2147483648): "];
	sprintf(tmp, " failed (#%d): ", e);
	auto tmplen = strlen(tmp);
	//
	dllx_buf<char> r;
	size_t pos = strlen(context);
	r.set(context, pos + 1, "dllx_get_last_error:context");
	r.cat(tmp, tmplen + 1, pos, "dllx_get_last_error:middle");
	pos += tmplen;
	r.cat((LPSTR)buf, buflen + 1, pos, "dllx_get_last_error:error");
	//trace("%s failed (%d): %s", context, e, buf);
	LocalFree(buf);
	return r.arr;
}
///
enum class program_pipe_flags {
	hide_window = 1,
	capture_stdout = 2,
	capture_stderr = 4,
};

DWORD WaitForProcessExit(HANDLE hProcess) {
	DWORD exitCode = STILL_ACTIVE;
	GetExitCodeProcess(hProcess, &exitCode);
	while (exitCode == STILL_ACTIVE) {
		Sleep(25);
		MSG m;
		if (PeekMessage(&m, NULL, 0, 0, PM_REMOVE) && m.message != WM_SIZE) {
			TranslateMessage(&m);
			DispatchMessage(&m);
			bool _break = false;
			switch (m.message) {
				case WM_QUIT: case WM_CLOSE: case WM_DESTROY: case WM_NCDESTROY:
					_break = true;
					exitCode = 0;
					break;
			}
			if (_break) break;
		}
		GetExitCodeProcess(hProcess, &exitCode);
	}
	return exitCode;
}

//
dllx const char* execute_program_pipe_raw(const char* command, int* meta) {
	dllx_buf<char> buf;
	dllx_widen widen;
	auto wcommand = widen.proc(command, "execute_program_pipe");
	auto flags = meta[0];
	meta[0] = NO_ERROR;
	meta[1] = 1;
	//
	#define tryw(ex, ctx) if (!(ex)) return dllx_get_last_error((ctx), meta)
	HANDLE pipeR = 0, pipeW = 0; {
		SECURITY_ATTRIBUTES saAttr;
		saAttr.nLength = sizeof(SECURITY_ATTRIBUTES);
		saAttr.bInheritHandle = TRUE;
		saAttr.lpSecurityDescriptor = NULL;
		tryw(CreatePipe(&pipeR, &pipeW, &saAttr, 0), "CreatePipe");
		tryw(SetHandleInformation(pipeR, HANDLE_FLAG_INHERIT, 0), "SetHandleInformation");
	};
	#undef tryw
	//
	const char* result;
	do {
		STARTUPINFO sip; ZeroMemory(&sip, sizeof(STARTUPINFO));
		sip.cb = sizeof(STARTUPINFO);
		if (flags & ((int)program_pipe_flags::capture_stderr | (int)program_pipe_flags::capture_stdout)) {
			sip.dwFlags |= STARTF_USESTDHANDLES;
			if (flags & (int)program_pipe_flags::capture_stderr) sip.hStdError = pipeW;
			if (flags & (int)program_pipe_flags::capture_stdout) sip.hStdOutput = pipeW;
		}
		if (flags & (int)program_pipe_flags::hide_window) {
			sip.dwFlags |= STARTF_USESHOWWINDOW;
			sip.wShowWindow = SW_HIDE;
		}

		PROCESS_INFORMATION pic; ZeroMemory(&pic, sizeof(PROCESS_INFORMATION));
		if (CreateProcess(NULL, widen.buf.arr,
			NULL, NULL,   // security attributes
			TRUE,         // handles are inherited 
			CREATE_NO_WINDOW, // creation flags 
			NULL, NULL,   // use parent's environment and cwd
			&sip, &pic
		)) {
			CloseHandle(pipeW); pipeW = 0;
			CloseHandle(pic.hThread);
		} else {
			result = dllx_get_last_error("CreateProcess", meta);
			break;
		}
		//
		char readBuf[4096];
		auto pos = 0u;
		for (;;) {
			DWORD readNum;
			BOOL ok = ReadFile(pipeR, readBuf, sizeof readBuf, &readNum, NULL);
			if (!ok || readNum == 0) break;
			if (!buf.cat(readBuf, readNum, pos, "concat in execute_program_pipe")) break;
			pos += readNum;
		}
		if (buf.cat("", 1, pos, "terminating byte in execute_program_pipe")) {
			buf.arr[pos] = 0;
		} else if (pos > 0) buf.arr[pos - 1] = 0;
		result = buf.arr;
		//
		meta[1] = WaitForProcessExit(pic.hProcess);
		CloseHandle(pic.hProcess);
	} while (false);
	//
	if (pipeR) CloseHandle(pipeR);
	if (pipeW) CloseHandle(pipeW);
	return result;
	//
	#if 0
	auto pipe = _wpopen(wcommand, L"rt");
	if (!pipe) {
		meta[0] = 0;
		return "";
	}
	char slice[256];
	size_t pos = 0;
	while (!feof(pipe)) {
		auto found = fread(slice, 1, sizeof slice, pipe);
		auto next = pos + found;
		buf.prepare(next + 1, "reading in execute_program_pipe");
		memcpy(buf.arr + pos, slice, found);
		pos = next;
		if (found < sizeof buf) break;
	}
	buf.arr[pos] = 0;
	meta[0] = ferror(pipe) ? -1 : 1;
	_pclose(pipe);
	#endif
}