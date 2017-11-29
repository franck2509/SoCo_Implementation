class
	URL_HOME	-- NEW

inherit
	WEBSITE_COMPONENT

create
	make

feature

	make (a_content: STRING; a_page: PAGE)
		do
			content := a_content
			a_page.add_entry (Current)
		end

	accept (a_visitor: VISITOR)
		do

			content := ""--a_visitor.visit_url_home (Current)
		end

end
