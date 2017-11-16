note
	description: "Summary description for {IMAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	IMAGE

inherit
	COMPONENT

feature
	-- return image file path or url as string
	-- include pre- & postcondition
	-- include accept visitor
	format_check: STRING

	make (new_image: STRING)
		require
			-- string not empty; better minimum length of 4 (easy way of doing it?) _FH
			-- string ends in .jpeg or .gif
			new_image.is_empty = FALSE
			format_check := new_image.keep_tail (n: 4)
			format_check = ".jpg" or ".gif"
		do
			element := new_image
		ensure
			-- no ideas yet _FH	
		end

	accept (a_visitor: VISITOR)
		do
			a_visitor.visit_Image (Current)
		end
end
