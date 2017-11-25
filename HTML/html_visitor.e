class
	HTML_VISITOR


inherit
	VISITOR
		--redefine
		--		make
		--end

create
	--default_create -- make_title, make_paragraph --, make_page

--feature {NONE}
	--html_string: STRING
	--pageText: STRING -- contains the added components (including html-code)
	--htmlPageText: STRING -- final page text with html-codes

	make

feature

--------!!!!!!!!!!!Teste mal ob man attribut titleText: STRING adden kann wenn mans in visit_file benutzt - default create (Achtung zwei mal PAGE)
	name: STRING

	make
		do
			name := ""
		end

	visit_title (a_title: TITLE): STRING -- all the make  classes will be called through make_page (accept)
		do
			Result := ("<head>%N <title>" + a_title.name + "</title>%N</head>%N%N")
		end

	visit_paragraph (a_paragraph: PARAGRAPH): STRING -- all the make classes will be called through make_page (accept)
		do
			Result := ("<p>" + a_paragraph.name + "</p>%N")
		end

	visit_page (a_page: PAGE)
		do
			--name := "" -- not needed
			name := ("<!DOCTYPE html>%N<html>%N%N" + pageText (a_page) + "%N</html>%N%N-------------------------------------------------------%N%N")
			io.put_string (name)
		end

	pageText (a_page: PAGE): STRING
		do
			Result := ""
			from
				a_page.entries.start
			until
				a_page.entries.off
			loop
				a_page.entries.item.accept (Current)
				Result := Result + a_page.entries.item.name
				a_page.entries.forth
			end
		end


---------------------------------------



	--visit_page (a_page: PAGE) -- Goes through the list of Elements in the page and makes them use their make_ funktion
	--	do
	--		from
	--			a_page.entries.start
	--		until
	--			a_page.entries.off
	--		loop
	--			a_page.entries.item.accept (Current)
	--			a_page.entries.forth
	--		end
	--	end

	--WIRD NICHT IM VISITOR GEPRINTET, SONDERN IN PAGE
	--print_String: STRING
	--	do
	--		Result := ("<!DOCTYPE html>%N<html>%N%N" + pageText + "</html>%N%N%N")
	--	end

end
