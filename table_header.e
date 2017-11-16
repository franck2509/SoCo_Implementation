note
	description: "Summary description for {TABLE_HEADER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	TABLE_HEADER

inherit
	COMPONENT

feature
	-- return row of header as a list
	-- include pre- & postcondition
	-- include accept visitor

	make (new_header: ARRAY[STRING])
		require
			new_header.is_empty = FALSE 	-- array isn't empty


			-- how to handle subarrays?
			-- Jürgen said we can assume that the user will be
			-- consistent in the number of items he puts in
			-- I intentionally allow an empty string _FH
		do
			element := new_header
		ensure

		end

	accept (a_visitor: VISITOR)
		do
			a_visitor.visit_TableHeader (Current)
		end
end
