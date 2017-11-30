class
	LIST_UNORDERED

inherit
	WEBSITE_COMPONENT

create
	make

feature

	content_arr: ARRAYED_LIST [STRING]

	make (a_unordered_list: ARRAYED_LIST [STRING]; a_page: PAGE)
		require
			a_unordered_list.is_empty = False
		do
			content := ""
			content_arr := a_unordered_list
			a_page.add_entry (Current)
		ensure
			content_arr = a_unordered_list
		end

	accept (a_visitor: VISITOR)
		do
			content := a_visitor.visit_list_unordered (Current)

		end
		
	invariant
		content.is_empty = False
end
