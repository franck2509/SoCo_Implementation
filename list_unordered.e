class
	LIST_UNORDERED

inherit
	WEBSITE_COMPONENT

create
	make

feature

	content_arr: ARRAYED_LIST [STRING]

	make (a_unordered_list: ARRAYED_LIST [STRING]; a_page: PAGE)
		do
			content := ""
			content_arr := a_unordered_list
			a_page.add_entry (Current)
		end

	accept (a_visitor: VISITOR)
		do
			content := a_visitor.visit_list_unordered (Current)

		end
end
