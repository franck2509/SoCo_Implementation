class
	HTML_VISITOR


inherit
	VISITOR

create

	make

feature {NONE}


	document: STRING -- move this line to visitor class (?)
	array2string: STRING
	iter: INTEGER
	url: STRING
	sub_url: STRING

	make (a_page: PAGE)
		do
			document := ""
			array2string := ""
			url := ""
			sub_url := ""
			a_page.accept (Current)
		end

	visit_title (a_page: PAGE): STRING -- all the make classes will be called through make_page (accept)
		do
			Result := ("<head>%N  <title>" + a_page.title + "</title>%N" + "  <base href=" + url_gen (a_page) + "/>%N</head>%N%N")
		end

	url_gen (a_page: PAGE): STRING
		do
			if url.is_equal ("")
				then url := a_page.title
					Result := url
				else sub_url := url + "/" + a_page.title
					sub_url.replace_substring_all (" ", "_")
					Result := sub_url
			end
		end

	visit_heading (a_heading: HEADING): STRING
		do
			Result := (" <h" + a_heading.size.out + ">" + a_heading.content + "</h" + a_heading.size.out + ">%N")
		end	-- 2) wieder wie vorane .out zum us em size en string z'mache und du hesch vergesse .name und .size z'mache. das sind die beide faktore wo de visitor brucht zum d'objekt überneh


	visit_paragraph (a_paragraph: PARAGRAPH): STRING -- all the make classes will be called through make_page (accept)
		do
			Result := ("  <p>" + a_paragraph.content + "</p>%N")
		end

	visit_image (a_image: IMAGE): STRING -- NEW _FH
		do
			Result := ("  <img src=%"" + a_image.content + "%">%N")
		end

	visit_snippet (a_snippet: SNIPPET): STRING -- same as in markdown
		do
			Result := ("  " + a_snippet.content + "%N")
		end

	visit_table_row (a_table_row: TABLE_ROW): STRING
		do
			array2string := "  <tr>%N"

			from
				iter := 1
			until
				iter > a_table_row.content_arr.count
			loop
				array2string.append ("   <td>" + a_table_row.content_arr [iter] + "</td>%N")
				iter := iter + 1
			end

			array2string.append ("  </tr>%N")

			Result := array2string

		end

	visit_table_header (a_table_header: TABLE_HEADER): STRING
		do
			array2string := "  <tr>%N"

			from
				iter := 1
			until
				iter > a_table_header.content_arr.count
			loop
				array2string.append ("   <th>" + a_table_header.content_arr [iter] + "</th>%N")
				iter := iter + 1
			end

			array2string.append ("  </tr>%N")

			Result := array2string
		end

	visit_list_ordered (a_ordered_list: LIST_ORDERED): STRING
		do
			array2string := "  <ol>%N"

			from
				iter := 1
			until
				iter > a_ordered_list.content_arr.count
			loop
				array2string.append ("   <li>" + a_ordered_list.content_arr [iter] + "</li>%N")
				iter := iter + 1
			end

			array2string.append ("  </ol>%N")

			Result := array2string
		end

	visit_list_unordered (a_unordered_list: LIST_UNORDERED): STRING
		do
			array2string := "  <ul>%N"

			from
				iter := 1
			until
				iter > a_unordered_list.content_arr.count
			loop
				array2string.append ("   <li>" + a_unordered_list.content_arr [iter] + "</li>%N")
				iter := iter + 1
			end

			array2string.append ("  </ul>%N")

			Result := array2string
		end

	visit_page (a_page: PAGE)
		do
			--document := "" -- not needed
			document := ("<!DOCTYPE html>%N<html>%N%N" + a_page.title + "%N<body>%N" + pageText (a_page) + "</body>%N%N</html>%N%N-------------------------------------------------------%N%N")
			io.put_string (document)
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
				Result := Result + a_page.entries.item.content
				a_page.entries.forth
			end
		end

end
