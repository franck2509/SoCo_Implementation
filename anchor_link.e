note
	description: "Summary description for {ANCHOR_LINK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ANCHOR_LINK

inherit
	WEBSITE_COMPONENT

create
	make

feature
	text: STRING

	make (a_anchor_link: STRING; a_linked_text: STRING; a_page: PAGE)
		require
			a_anchor_link.is_empty = FALSE
			a_linked_text.is_empty = FALSE
		do
			content := a_anchor_link
			text := a_linked_text
			a_page.add_entry (Current)

		ensure
			content.is_empty = FALSE
			text.is_empty = FALSE
			content = a_anchor_link
			text = a_linked_text
		end


	accept (a_visitor: VISITOR)
		do
			content := a_visitor.visit_anchor_link (Current)
			text := a_visitor.visit_anchor_link (Current)
		end

	invariant
		content.is_empty = FALSE
		text.is_empty = FALSE

end
