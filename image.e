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

	make (new_image: STRING)
		require
			-- string not empty
			-- string ends in .jpeg or .gif
		do
			element := new_image
		ensure
			-- no ideas yet		
		end

	accept (a_visitor: VISITOR)
		do
			a_visitor.visit_Image (Current)
		end
end
