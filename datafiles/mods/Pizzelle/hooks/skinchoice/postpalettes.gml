// Replace names to have pronouns
var pro = MOD_GLOBAL.opt_pronoun;
for(var i = 0, n = array_length(palettes); i < n; ++i)
{
    var this = palettes[i];
    this.description = string_replace_all(this.description, "PRONOUN_1", lang_get_value("PRONOUN_1" + pro));
    this.description = string_replace_all(this.description, "PRONOUN_2", lang_get_value("PRONOUN_2" + pro));
    this.description = string_replace_all(this.description, "PRONOUN_3", lang_get_value("PRONOUN_3" + pro));
    this.description = string_replace_all(this.description, "PRONOUN_4", lang_get_value("PRONOUN_4" + pro));
    this.description = string_replace_all(this.description, "PRONOUN_5", lang_get_value("PRONOUN_5" + pro));
}

// Patterns
// TODO
