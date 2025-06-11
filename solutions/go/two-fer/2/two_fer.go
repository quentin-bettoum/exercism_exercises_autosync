package twofer

// Returns a string with a message using the name passed in parameter or "you" as default
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return "One for " + name + ", one for me."
}
