note
	description: "Summary description for {LINK_EXTERNAL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LINK_EXTERNAL

inherit
	WEBSITE_COMPONENT

create
	make

feature
	text: STRING

	make (a_external_link: STRING; a_linked_text: STRING; a_page: PAGE)
		require
			a_external_link.is_empty = FALSE
			a_linked_text.is_empty = FALSE
		do
			content := a_external_link
			text := a_linked_text
			a_page.add_entry (Current)

		ensure
			content.is_empty = FALSE
			text.is_empty = FALSE
			content = a_external_link
			text = a_linked_text
		end


	accept (a_visitor: VISITOR)
		do
			content := a_visitor.visit_link_external (Current)
			text := a_visitor.visit_link_external (Current)
		end

	invariant
		content.is_empty = FALSE
		text.is_empty = FALSE

end
