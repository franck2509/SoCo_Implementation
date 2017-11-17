note
	description: "Summary description for {ORDERED_LIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ORDERED_LIST

inherit
	COMPONENT
	
feature	-- Settings

	make (new_ordered_list: ARRAY[STRING])
		require
			new_ordered_list.is_empty = FALSE
		do
			element := new_ordered_list
		end
		
	accept (a_visitor: VISITOR)
		do
			a_visitor.visit_OrderedList (Current)
		end

end
