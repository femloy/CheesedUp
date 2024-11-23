live_auto_call;

isOpen = false;
isAutocompleteOpen = false;

shellSurface = noone;
scrollSurface = noone;
shellOriginX = 0;
shellOriginY = 0;
visibleWidth = 0;
visibleHeight = 0;

cursorPos = 1;
consoleString = "";
savedConsoleString = "";
scrollPosition = 0;
maxScrollPosition = 0;
targetScrollPosition = 0;
commandSubmitted = false; // Need to update scroll position one frame after a command is submitted
insertMode = true;

historyPos = 0;
history = [];
output = [];
outputHeight = 0;

filteredSuggestions = [];
inputArray = [];
suggestionIndex = 0;
autocompleteMaxWidth = 0;
autocompleteScrollPosition = 0;
autocompleteOriginX = 0;
autocompleteOriginY = 0;
mousePreviousX = mouse_x_gui;
mousePreviousY = device_mouse_y_to_gui(0);

shellPropertiesHash = "";

// for the bash-style "kill" copy/paste
killedString = "";
// whether we just performed a meta-action, as the keyboard_check_pressed for that key will still register on the next frame...
metaDeleted = false;
metaMovedLeft = false;
metaMovedRight = false;

// Set up queue for deferred script calls
deferredQueue = ds_queue_create();

// Variables for the saved history feature
savedHistoryFilePath = working_directory + "rt-shell-saved-history.data";
loadedSavedHistory = false;
loadedHistoryScrolled = false;

// Mouse-argument data types
enum mouseArgumentType {
	worldX,
	worldY,
	guiX,
	guiY,
	instanceId,
	objectId
}
activeMouseArgType = undefined;
activeMouseArgValue = "";

// Initialize native shell scripts
event_user(0);

// If another instance of rt-shell already exists, destroy ourself
// Must do after initializing surface and lists so our clean-up step succeeds
if (instance_number(object_index) > 1) {
	instance_destroy();
}

/// Opens the shell
open = function() {
	isOpen = true;
	keyboard_string = "";
	if (!is_undefined(openFunction)) {
		openFunction();
	}
}

/// Closes the shell
close = function() {
	isOpen = false;
	if (!is_undefined(closeFunction)) {
		closeFunction();
	}
	// Execute any deferred functions
	// This should happen after the close function, as the canonical use-case is for 
	// running scripts that must happen while the game is not paused
	while (!ds_queue_empty(deferredQueue)) {
		var args = ds_queue_dequeue(deferredQueue);
		self._execute_script(args, true);
	}
	// Save the current history to disk, if enabled
	if (saveHistory) {
		self._save_history();
	}
}

/// Closes autocomplete
_close_autocomplete = function() {
	array_resize(filteredSuggestions, 0);
}

// Create a list of shell functions in the global namespace to
// filter for autocompletion
availableFunctions = [];
allFunctions = [];
functionData = {};
var globalVariables = variable_instance_get_names(global);
// Fetch the metadata first so we can utilize it in the available function storage
for (var i = 0; i < array_length(globalVariables); i++) {
	// Only looking for variables that start with meta_
	if (string_pos("meta_", string_lower(globalVariables[i])) == 1) {
		// Strip off the meta_ when we store them in our data struct
		var name = string_delete(string_lower(globalVariables[i]), 1, 5);
		functionData[$ name] = variable_instance_get(global, globalVariables[i])();
	}
}
// Then fetch all the functions themselves
for (var i = 0; i < array_length(globalVariables); i++) {
	// Only looking for variables that start with sh_
	if (string_pos("sh_", string_lower(globalVariables[i])) == 1) {
		// Strip off the sh_ when we store them in our array
		var name = string_delete(string_lower(globalVariables[i]), 1, 3);
		// #32 : don't display hidden functions in the autocomplete
		var hidden = false;
		var metadata = functionData[$ name];
		if (!is_undefined(metadata)) {
			if (variable_struct_exists(metadata, "hidden")) {
				hidden = metadata.hidden;
			}
		}
		if (!hidden) {
			array_push(availableFunctions, name);
		}
		array_push(allFunctions, name);
	}
	// Sort available functions list alphabetically for help command
	array_sort(availableFunctions, true);
}

// Update the list of functions prefixed by the user's current input
// for use in autocompletion
_update_filtered_suggestions = function() {
	array_resize(filteredSuggestions, 0);
	autocompleteMaxWidth = 0;
	suggestionIndex = 0;
	activeMouseArgType = undefined;
	var inputString = string(consoleString);
	inputArray = self._input_string_split(inputString);
	
	// Return if we have nothing to parse
	if (string_length(inputString) == 0 or array_length(inputArray) == 0) { return; }
	
	// Set font for string_width calculation
	draw_set_font(consoleFont);
	
	// Parse through functions
	var spaceCount = array_length(inputArray) - 1;
	if (spaceCount == 0) {
		for (var i = 0; i < array_length(availableFunctions); i++) {
			if (string_pos(inputString, availableFunctions[i]) == 1 && inputString != availableFunctions[i]) {
				array_push(filteredSuggestions, availableFunctions[i]);
				autocompleteMaxWidth = max(autocompleteMaxWidth, string_width(availableFunctions[i]));
			}
		}
	} else {
		// Parse through argument suggestions
		var functionName = inputArray[0];
		var argumentIndex = spaceCount - 1;
		var dataExists = variable_struct_exists(functionData, functionName);
		var noExtraSpace = (string_char_at(inputString, string_last_pos(" ", inputString) - 1) != " ");
		if (dataExists && noExtraSpace && spaceCount <= array_length(inputArray)) {
			var suggestionData = functionData[$ inputArray[0]][$ "suggestions"];
			var argumentSuggestions = [];
			if (argumentIndex < array_length(suggestionData)) {
				if (is_array(suggestionData[argumentIndex])) {
					// Suggestion data is a static array
					argumentSuggestions = suggestionData[argumentIndex];
				} else if (is_method(suggestionData[argumentIndex])) {
					// #18: Suggestion data is a dynamic function that returns an array
					argumentSuggestions = suggestionData[argumentIndex]();
				} else if (is_int64(suggestionData[argumentIndex])) {
					// int64 is the datatype of enum values, we can hopefully assume this means
					// our argument suggestion is a mouseArgumentType
					activeMouseArgType = suggestionData[argumentIndex];
				}
				var currentArgument = inputArray[array_length(inputArray) - 1];
				for (var i = 0; i < array_length(argumentSuggestions); i++) {
					var prefixMatch = string_pos(currentArgument, argumentSuggestions[i]) == 1;
					if (string_last_pos(" ", inputString) == string_length(inputString) or prefixMatch) {
						array_push(filteredSuggestions, argumentSuggestions[i]);
						autocompleteMaxWidth = max(autocompleteMaxWidth, string_width(argumentSuggestions[i]));
					}
				}
			}
		}
	}
	autocompleteScrollPosition = 0;
	array_sort(filteredSuggestions, true);
}

// Find the prefix string that the list of suggestions has in common
// used to update the consoleString when user is tab-completing
_find_common_prefix = function() {
	if (array_length(filteredSuggestions) == 0) {
		return "";
	}
	
	var first = string(filteredSuggestions[0]);
	var last = string(filteredSuggestions[array_length(filteredSuggestions) - 1]);
	
	var result = "";
	var spaceCount = string_count(" ", consoleString);
	if (spaceCount > 0) {
		for (var i = 0; i < spaceCount; i++) {
			result += inputArray[i] + " ";
		}
	}
	// string_char_at is 1-indexed.... sigh
	for (var i = 1; i < string_length(first) + 1; i++) {
		if (string_char_at(first, i) == string_char_at(last, i)) {
			result += string_char_at(first, i);
		} else {
			break;
		}
	}
	
	return result;
}

_key_combo_pressed = function(modifier_array, key) {
	for (var i = 0; i < array_length(modifier_array); i++) {
		if (!keyboard_check(modifier_array[i])) {
			return false;
		}
	}

	if (keyboard_check_pressed(key)) {
		if (array_length(modifier_array) == 0) {
			if (keyboard_check(vk_shift) or keyboard_check(vk_control) or keyboard_check(vk_alt)) {
				return false;
			}
		}
		
		return true;
	}
}

delayFrame = 0;
delayFrames = 1;
_keyboard_check_delay = function(input) {
	if (keyboard_check_released(input)) {
		delayFrame = 0;
		delayFrames = 1;
		return false;
	} else if (!keyboard_check(input)) {
		return false;
	}
	delayFrame = (delayFrame + 1) % delayFrames;
	if (delayFrame == 0) {
		delayFrames = keyRepeatDelay;
	}
	if (keyboard_check_pressed(input)) {
		delayFrame = 0;
		delayFrames = keyRepeatInitialDelay;
		return true;
	} else {
		if (keyboard_check(input) && delayFrame == 0) {
			return true;
		}
	}
	return false;
}

// Calculates a hash of the configurable variables that would cause shell properties to 
// need recalculation if they changed
_shell_properties_hash = function() {
	return md5_string_unicode(string(width) + "~" + string(height) + "~" + string(anchorMargin) 
			+ "~" + string(consolePaddingH) + "~" + string(scrollbarWidth) + "~" + 
			string(consolePaddingV) + "~" + string(screenAnchorPointH) + "~" + string(screenAnchorPointV));
}

// Recalculates origin, mainly for changing themes and intializing
_recalculate_shell_properties = function() {
	var screenCenterX = display_get_gui_width() / 2;
	var screenCenterY = display_get_gui_height() / 2;
	draw_set_font(consoleFont);
	var emHeight = string_height("M");
	
	// Clamp size of shell to available screen dimensions
	var maxWidth = display_get_gui_width() - (anchorMargin * 2);
	var maxHeight = display_get_gui_height() - (anchorMargin * 2);
	width = clamp(width, 50, maxWidth);
	height = clamp(height, emHeight, maxHeight);
	
	var halfWidth = width / 2;
	var halfHeight = height / 2;
	switch (screenAnchorPointH) {
		case "left":
			shellOriginX = anchorMargin - 1;
			break;
		case "center":
			shellOriginX = screenCenterX - halfWidth - 1;
			break;
		case "right":
			shellOriginX = display_get_gui_width() - width - anchorMargin - 1;
			break;
	}
	
	switch (screenAnchorPointV) {
		case "top":
			shellOriginY = anchorMargin - 1;
			break;
		case "middle":
			shellOriginY = screenCenterY - halfHeight - 1;
			break;
		case "bottom":
			shellOriginY = display_get_gui_height() - height - anchorMargin - 1;
			break;
	}
	
	// Calculate the width of the visible text area, taking into account all margins
	visibleWidth = width - (2 * anchorMargin) - scrollbarWidth - (2 * consolePaddingH);
	visibleHeight = height - (2 * consolePaddingV);
	
	// Save a hash of the shell properties, so we can detect if we need to recalculate
	shellPropertiesHash = self._shell_properties_hash();
}

// Recalculates the scroll offset/position based on the suggestion index within the autocomplete list
_calculate_scroll_from_suggestion_index = function() {
	if (suggestionIndex == 0)  {
		autocompleteScrollPosition = 0;
	} else {
		if (suggestionIndex >= autocompleteScrollPosition + autocompleteMaxLines) {
			autocompleteScrollPosition = max(0, suggestionIndex - autocompleteMaxLines + 1);
		} else if (suggestionIndex < autocompleteScrollPosition) {
			autocompleteScrollPosition = autocompleteScrollPosition - suggestionIndex;
		}
	}
}

_confirm_current_suggestion = function() {
	var spaceCount = string_count(" ", consoleString);
	consoleString = "";
	for (var i = 0; i < spaceCount; i++) {
		consoleString += inputArray[i] + " ";
	}
	consoleString += filteredSuggestions[suggestionIndex] + " ";
	cursorPos = string_length(consoleString) + 1;
}

_confirm_current_mouse_argument_data = function() {
	if (activeMouseArgValue != "") {
		consoleString += string(activeMouseArgValue) + " ";
		cursorPos = string_length(consoleString) + 1;
	}
}

_execute_script = function(args, deferred = false) {
	var script = variable_global_get("sh_" + args[0]);
	if (!is_undefined(script)) {
		var response;
		try {
			response = script_execute(asset_get_index(script_get_name(script)), args);
		} catch (_exception) {
			response = "-- ERROR: see debug output for details --";
			show_debug_message("---- ERROR executing rt-shell command [" + string(args) + "] ----");
			show_debug_message(_exception.longMessage);
			show_debug_message("----------------------------");
			isOpen = true;
		}
		if (!deferred) {
			array_push(history, consoleString);
			if (response != "") { array_push(output, ">" + consoleString); }
		}
		if (is_string(response)) {
			array_push(output, response);
		}
		
		self._update_positions();
	} else {
		array_push(output, ">" + consoleString);
		array_push(output, "No such command: " + consoleString);
		array_push(history, consoleString);
		isOpen = true;
		self._update_positions();
	}
}

_update_positions = function() {
	historyPos = array_length(history);
	consoleString = "";
	savedConsoleString = "";
	cursorPos = 1;
}

_save_history = function() {
	var truncatedHistory = [];
	var truncatedOutput = [];
	
	array_copy(truncatedHistory, 0, history, max(0, array_length(history) - savedHistoryMaxSize),
		min(array_length(history), savedHistoryMaxSize));
	
	array_copy(truncatedOutput, 0, output, max(0, array_length(output) - savedHistoryMaxSize), 
		min(array_length(output), savedHistoryMaxSize));

	var toSave = {
		history: truncatedHistory,
		output: truncatedOutput
	}
	var openFile = file_text_open_write(savedHistoryFilePath);
	file_text_write_string(openFile, json_stringify(toSave, undefined, undefined));
	file_text_close(openFile);
}

_load_history = function() {
	var saveDataFile = file_find_first(savedHistoryFilePath, fa_directory);
	if (saveDataFile != "") {
		var openFile = file_text_open_read(savedHistoryFilePath);
		var tempData = json_parse(file_text_read_string(openFile), undefined, undefined);
		file_text_close(openFile);
		history = tempData.history;
		output = tempData.output;
		historyPos = array_length(history);
	}
	file_find_close();
}

/// @function _input_string_split(_input)
/// @description Splits a console input string on spaces (handling quoted arguments)
/// @param _input The input string to split
/// @returns An array containing the function name followed by each argument
_input_string_split = function(_input) {
	return string_split(_input, " ", false, infinity);
	
	var slot = 0;
	var splits = []; //array to hold all splits
	var str2 = ""; //var to hold the current split we're working on building

	var inQuotes = false;
	
	for (var i = 1; i < (string_length(_input) + 1); i++) {
	    var currStr = string_char_at(_input, i);
		// Ignore spaces as a delimiter if we are currently inside of quotes
		if (!inQuotes) {
			if (currStr == "\"") {
				inQuotes = true;
				continue;
			}
		    if (currStr == " ") {
				if (str2 != "") { // Make sure we don't include the space
			        splits[slot] = str2; //add this split to the array of all splits
			        slot++;
				}
		        str2 = "";
		    } else {
		        str2 = str2 + currStr;
		        splits[slot] = str2;
		    }
		} else {
			if (currStr == "\"") {
				inQuotes = false;
				splits[slot] = str2;
				continue;
			}
		    str2 = str2 + currStr;
		}
	}
	// If we ended on our delimiter character, include an empty string as the final split
	// If we ended without closing a quote, include what's been written in quotes so far as a complete argument
	if (str2 == "" or inQuotes) {
		splits[slot] = str2;
	}

	return splits;
}

/*
 * Returns true if the array contains any instances that match the provided element
 * otherwise returns false
 */
_array_contains = function(array, element) {
	for (var i = 0; i < array_length(array); i++) {
		if (array[i] == element) {
			return true;
		}
	}
	return false;
}

/// @param value
/// @param min_input
/// @param max_input
/// @param min_output
/// @param max_output
_remap = function(value, min_input, max_input, min_output, max_output) {
	var _t = (value - min_input) / (max_input - min_input);
	return lerp(min_output, max_output, _t);
}

// pto
selection = noone;

scr_wc_create();

draw_console_text = function(_x, _y, _string)
{
	var xx = _x, yy = _y;
	for(var i = 1; i <= string_length(_string); i++)
	{
		var char = string_char_at(_string, i);
		
		if selection != noone
		{
			if (selection[0] > i && selection[1] <= i)
			or (selection[0] <= i && selection[1] > i)
			{
				draw_set_colour(c_dkgray);
				draw_rectangle(xx, yy, xx + string_width(char), yy + string_height(char), false);
			}
		}
		
		draw_set_colour(c_white);
		draw_text(xx, yy, char);
		
		xx += string_width(char);
	}
}
