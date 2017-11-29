class
	HEADING

inherit
	WEBSITE_COMPONENT

create
	make


feature

	size: STRING -- initialize variable size as STRING

    make (a_heading: STRING; a_size: INTEGER; a_page: PAGE)
		require					-- precondition: heading must not be empty, must have a size from 1 to 6
			a_heading.is_empty = FALSE	
			0 < a_size
			7 > a_size
		do					-- sets content for heading, sets size for heading and converts a_size to STRING
			content := a_heading
			size := a_size.out 		-- .out for converting a_size to STRING
			a_page.add_entry (Current)	
		ensure					-- postcondition: no bugs happened; every parameter is equal as it was set to
			content = a_heading
			a_size = old a_size
		end

	accept (a_visitor: VISITOR)		-- accepts the VISITOR
		do
			content := a_visitor.visit_heading (Current)	-- visitor can "visit" and read everything set in heading
			size := a_visitor.visit_heading (Current) 
		end
	invariant
		content.is_empty = FALSE	-- invariant: heading must not be empty
end
