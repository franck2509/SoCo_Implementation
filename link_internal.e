class
	LINK_INTERNAL

inherit
	WEBSITE_COMPONENT

create
	make

feature

	anchor: STRING

	make (a_url: STRING; a_anchor: STRING; a_page:PAGE)
		require
			a_url.is_empty = False
		do
			content := a_url
			a_page.add_entry (Current)

		ensure
            content = a_url
		end



	accept (a_visitor: VISITOR)
		do
			content := a_visitor.visit_internal_link (Current)
		end

	invariant
		content.is_empty = FALSE
end
