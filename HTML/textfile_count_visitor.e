class
	TEXTFILE_COUNT_VISITOR

inherit
	VISITOR

create
	default_create

feature

	visit_page (a_page: PAGE) -- durchforstet alle elemente im ordner
		do
			from
				a_page.entries.start
			until
				a_page.entries.off
			loop
				a_page.entries.item.accept (Current)
				a_page.entries.forth
			end
			--titleText := a_page.name
		end

	visit_title (a_title: TITLE): STRING
		do
			--titleText := a_title.name
			Result := ""
		end

	visit_paragraph (a_paragraph: PARAGRAPH): STRING
		do
			Result := ""
		end

	--visit_title (a_title: TITLE)
	--	do
	--	end



	textfile_count: INTEGER
	textfile_count2: INTEGER
	is_it: BOOLEAN
	--titleText: STRING
	--text_html: STRING

end
