note
	description: "Summary description for {UNORDERED_LIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	UNORDERED_LIST

inherit
	COMPONENT

feature	-- Settings

	make (new_unordered_list: ARRAY[STRING])
		require
			new_unordered_list.is_empty = FALSE
		do
			element := new_unordered_list
		end
		
	accept (a_visitor: VISITOR)
		do
			a_visitor.visit_UnorderedList (Current)
		end

end
