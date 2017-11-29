class
	HEADING

inherit
	WEBSITE_COMPONENT

create
	make


feature

	size: STRING -- 1) size als string initialisiert

    make (a_heading: STRING; a_size: INTEGER; a_page: PAGE)
		require
			a_heading.is_empty = FALSE
			0 < a_size
			7 > a_size
		do
			content := a_heading
			size := a_size.out -- 2) .out macht e zahl zum string
			a_page.add_entry (Current)
		ensure
			content = a_heading
			a_size = old a_size
		end

	accept (a_visitor: VISITOR)
		do
			content := a_visitor.visit_heading (Current)
			size := a_visitor.visit_heading (Current) -- 3) denn wierd da au en string zrugg geh
		end
	invariant
		content.is_empty = FALSE
end
