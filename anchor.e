note
	description: "Summary description for {ANCHOR_TAG}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ANCHOR

inherit
	WEBSITE_COMPONENT

create
	make

feature

	make (a_anchor: STRING; a_page: PAGE)
		require
			a_anchor.is_empty = FALSE
		do
			content := a_anchor
			a_page.add_entry (Current)
		ensure
			content.is_empty = FALSE
			content = a_anchor
		end


	accept (a_visitor: VISITOR)
		do
			content := a_visitor.visit_anchor (Current)
		end

	invariant
		content.is_empty = FALSE

end
