class
	TABLE_HEADER

inherit
	WEBSITE_COMPONENT

create
	make

feature

	content_arr: ARRAYED_LIST [STRING]

	make (a_table_header: ARRAYED_LIST [STRING]; a_page: PAGE)
		do
			content := ""
			content_arr := a_table_header
			a_page.add_entry (Current)
		end

	accept (a_visitor: VISITOR)
		do
			content := a_visitor.visit_table_header (Current)

		end
	invariant
		content.is_empty = False
end
