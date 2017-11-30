class
	PAGE

inherit
	WEBSITE_COMPONENT

create
	make

feature

	title: STRING

	make (a_content: STRING)
		require
			a_content.is_empty = FALSE
		do
			content := "" -- gives back an empty string when the visitor.pageText - loop prints every item.name, so that the title is written in the right spot.
			title := a_content
			create {LINKED_LIST [WEBSITE_COMPONENT]} entries.make -- LISTE für Visitor
		ensure
			title = a_content
		end


	add_entry (wc: WEBSITE_COMPONENT)
		do
			entries.extend (wc)
		end


	accept (a_visitor: VISITOR)
		do
			title := a_visitor.visit_title (Current)
			a_visitor.visit_page (Current)
		end
		
	invariant
		title.is_empty = False


feature {VISITOR}	

	entries: LIST [WEBSITE_COMPONENT] -- list, that is accessible through a visitor object
	-- this is somehow a syntax error!
	

end
