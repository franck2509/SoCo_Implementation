class
	IMAGE

inherit
	WEBSITE_COMPONENT

create
	make



feature
	format_check: STRING
	char1: STRING
	charn: STRING

	make (a_image: STRING; a_page:PAGE)
		require
			a_image.is_empty = False
		do
			content := a_image
			format_check := a_image
			format_check := format_check.substring ((format_check.count -3), format_check.count)
			char1 := a_image.substring (1,1)
			charn := a_image.substring (a_image.count, a_image.count)
			a_page.add_entry (Current)

		ensure
            format_check.is_equal (".jpg") or format_check.is_equal (".gif")
            content = a_image
		end



	accept (a_visitor: VISITOR)
		do
			content := a_visitor.visit_image (Current)
		end

	invariant
		content.is_empty = FALSE
end
