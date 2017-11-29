class
	SNIPPET

inherit
	WEBSITE_COMPONENT

create
	make

feature {NONE}

	make (a_snippet: STRING; a_page: PAGE)
		require
			a_snippet.is_empty = FALSE
		do
			content := a_snippet
			a_page.add_entry (Current)
		ensure
			content = a_snippet
		end


	accept (a_visitor: VISITOR)
		do
			content := a_visitor.visit_snippet (Current)
		end

	invariant
		content.is_empty = FALSE
end
