note
	description: "Summary description for {PARAGRAPH}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	PARAGRAPH

inherit
	COMPONENT

feature
	-- return paragraph as string
	-- include pre- & postcondition
	-- include accept visitor

	make (new_paragraph: STRING)
		require
			new_paragraph.is_empty = FALSE
		do
			element := new_paragraph
		ensure
			-- no ideas yet		
		end

	accept (a_visitor: VISITOR)
		do
			a_visitor.visit_Paragraph (Current)
		end
end
