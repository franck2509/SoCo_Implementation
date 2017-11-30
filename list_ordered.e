class
	LIST_ORDERED

inherit
	WEBSITE_COMPONENT

create
	make

feature

	content_arr: ARRAYED_LIST [STRING]

	make (a_ordered_list: ARRAYED_LIST [STRING]; a_page: PAGE)
		require
			a_ordered_list.is_empty = False
		do
			content := ""
			content_arr := a_ordered_list
			a_page.add_entry (Current)
		ensure
			content_arr = a_ordered_list
		end

	accept (a_visitor: VISITOR)
		do
			content := a_visitor.visit_list_ordered (Current)

		end
		
	invariant
		content.is_empty = False
end
