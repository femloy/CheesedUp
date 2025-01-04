function scr_load_bank(filename)
{
	if !file_exists(filename)
		return $"FMOD bank \"{filename}\" doesn't exist. Certain sounds will be muted";
	
	var bank = fmod_bank_load(filename);
	if bank == FMOD_INVALID_BANK
		return $"FMOD bank \"{filename}\" is invalid; {fmod_last_result()}";
	
	if !(fmod_bank_load_sample_data(bank))
	{
		var r = fmod_last_result();
		fmod_bank_unload(bank);
		return $"Couldn't load sample data for FMOD bank \"{filename}\", {r}";
	}
	
	trace("Loaded Bank \"", filename, "\" with id ", bank);
	return bank;
}
