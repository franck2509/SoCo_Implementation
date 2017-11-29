class
	PARAGRAPH

inherit
	WEBSITE_COMPONENT

create
	make

feature

	make (a_paragraph: STRING; a_page: PAGE)
		require
			a_paragraph.is_empty = FALSE
		do
			content := a_paragraph
			a_page.add_entry (Current)
		ensure
			content.is_empty = FALSE
			content = a_paragraph
		end


	accept (a_visitor: VISITOR)
		do
			content := a_visitor.visit_paragraph (Current)
		end

	invariant
		content.is_empty = FALSE

end
