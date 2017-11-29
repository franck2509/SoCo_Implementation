note
	description: "Summary description for {ANCHOR_TAG_GEN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ANCHOR_TAG_GEN

inherit
	WEBSITE_COMPONENT

create
	make

feature

--	make (a_anchor_tag: STRING; a_page: PAGE)
--		require
--			a_anchor.is_empty = FALSE
--		do
--			content := a_anchor
--			a_page.add_entry (Current)
--		ensure
--			content.is_empty = FALSE
--			content = a_anchor
--		end

	make
		do
			content := ""
		end

	accept (a_visitor: VISITOR)
		do
			content := a_visitor.visit_anchor_tag_gen (Current)
		end

--	invariant
--		content.is_empty = FALSE

end
