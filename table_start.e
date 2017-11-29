note
	description: "Summary description for {TABLE_START}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TABLE_START

inherit
	WEBSITE_COMPONENT

create
	make

feature

	make (a_page: PAGE)
		do
			content := ""
			a_page.add_entry (Current)
		ensure
			content.is_empty = TRUE
		end


	accept (a_visitor: VISITOR)
		do
			content := a_visitor.visit_table_start (Current)
		end

end
