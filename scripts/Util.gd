# utility functions for things commonly used in multiple places
# include in your scripts with `const Util = preload("res://scripts/Util.gd")`
# then call with Util.cool_helper_function()
# !!make sure new functions added are static or this will not work!!
extends Node


# returns array of GitHub contributor names for use in credits sequences (or wherever!)
static func get_contributor_names() -> Array:
	var names_array: Array

	# return placeholder names if testing in editor or running a non-web build
	if OS.has_feature("editor") or not OS.has_feature("web"):
		names_array = ["Mario Mario", "Luigi Mario", "Baby Mario"]

		for n in 10:
			names_array.append_array(names_array)
	else:
		var file = File.new()

		# this file is generated by GitHub Actions at build time - don't worry about it :)
		var credits_txt = file.open("res://credits.txt", File.READ)

		names_array = credits_txt.get_as_text().split("\n")

		file.close()

	return names_array
