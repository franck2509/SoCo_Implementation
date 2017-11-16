note
	description: "Summary description for {TABLE_BODY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	TABLE_BODY

inherit
	COMPONENT

feature
	-- return row of body as a list
	-- include pre- & postcondition
	-- include accept visitor

	make (new_bodyRow: ARRAY[STRING])
		require
			new_bodyRow.is_empty = FALSE 	-- array isn't empty


			-- how to handle subarrays?
			-- Jürgen said we can assume that the user will be
			-- consistent in the number of items he puts in
			-- I intentionally allow an empty string _FH
		do
			element := new_bodyRow
		ensure

		end

	accept (a_visitor: VISITOR)
		do
			a_visitor.visit_TableBody (Current)
		end
end
