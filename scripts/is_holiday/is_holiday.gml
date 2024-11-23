enum holiday
{
	none,
	halloween,
	loy_birthday,
}

function is_holiday(holiday)
{
	var hl = global.holiday;
	if global.holidayoverride != -1
		hl = global.holidayoverride;
	
	if hl != holiday
		return false;
	return true;
	
	/*
	// on sandbox, holidays are unlocked
	if global.sandbox
		return true;
	
	// on story, you unlock them by getting a final judgement
	for (var i = 0; i < 3; i++)
	{
		if global.story_game[i].judgement != "none"
			return true;
	}
	
	// not unlocked
	return false;
	*/
}
