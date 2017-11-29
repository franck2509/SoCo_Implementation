note
	description: "Summary description for {IMAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"


class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local -- Chose and add content with the corresponding local variables.

			homepage, page: 	PAGE -- creates homepage (+URL) and subpages (+sub-URL) plus their titles
			I_heading: 			HEADING
			I_paragraph: 		PARAGRAPH
			I_image: 			IMAGE
			I_snippet: 			SNIPPET
			I_table_header: 	TABLE_HEADER
			I_table_row: 		TABLE_ROW
			I_ordered_list: 	LIST_ORDERED
			I_unordered_list: 	LIST_UNORDERED
		--	I_internal_link: 	LINK_INTERNAL
			I_external_link: 	LINK_EXTERNAL
			I_table_start: 		TABLE_START
			I_table_end: 		TABLE_END
			I_anchor: 			ANCHOR
			I_anchor_link: 		ANCHOR_LINK
			I_anchor_tag_gen:	ANCHOR_TAG_GEN

			anchor_tag1:		ANCHOR_TAG_GEN

			get_htmlcode: 		HTML_VISITOR
			my_array: 			ARRAYED_LIST [STRING]
			--table_list: LINKED_LIST [PAIR [G]]

--Order:
--1. Create a homepage and type in your URL.
--2. Create an additional page (optional) and add_entry to homepage.
--3. Create any other component and add it to either homepage or your latest created page.
--4. Repeat 2. + 3. for each new page.
--5. Once you finish creating the pages: create the chosen visitor to get the desired string.


		do

			create homepage.make ("www.homepage.com") -- creates a list that can add component-objects
			create page.make ("Page 1") -- creates second list, besides homepage
			homepage.add_entry (page) -- add page-object to homepage-list

			io.put_string ("Thanks for working with our HTML Generator.%NThis is a string of all your subpages, followed by the homepage: %N%N")


------------------------ anchors don't work yet------------
			create anchor_tag1.make
			create I_anchor_tag_gen.make
			create I_anchor_link.make (anchor_tag1,"anchor 1", homepage)
			create I_anchor_link.make (I_anchor_tag_gen,"anchor 2", homepage)

------------------------
			------------------------------------

			-- Create components and push to a page
			create I_heading.make ("Homepage Heading", 1, homepage)
			create I_paragraph.make ("This is the first HOME paragraph", homepage)
			create I_paragraph.make ("This is the second HOMEPAGE paragraph", homepage)
			create I_image.make ("https://i.imgur.com/7PlPaTg.jpg", homepage)
			create I_external_link.make ("https://www.sbb.ch", "sbb site", homepage)

			create I_heading.make ("Heading for SUBPAGE", 2, page)
			create I_paragraph.make ("This is the first SUBPAGE paragraph", page)
			create I_paragraph.make ("This is the second SUBPAGE paragraph", page)
			create I_snippet.make ("<p><a href=%"html_images.asp%">HTML Images</a> is a link to a page on this website.</p>", page)


			create my_array.make (0) -- create an array that can be used as a row or a list
			my_array.extend("one") -- to skip one point, insert an empty string
			my_array.extend("two")
			my_array.extend("three")

			create I_table_start.make (homepage)
			create I_table_header.make (my_array, homepage) -- adds your latest created list as a table header to the homepage
			create I_table_row.make (my_array, homepage) -- adds your latest created list as a table row to the homepage
			create I_table_end.make (homepage)


				---------------------------------------
			-- TEST: 2. SUBPAGE
			create page.make ("Page 2")
			homepage.add_entry (page)

			create I_heading.make ("Heading for 2. SUBPAGE", 2, page)
			create I_paragraph.make ("This is the first SUBPAGE TWO paragraph", page)
			create I_ordered_list.make (my_array, page)
			create I_unordered_list.make (my_array, page)

			---------------------------------------

			-- Create html_visitor
			create get_htmlcode.make (homepage) -- loops through the homepage list with all pages & elements and prints the html code

		end

end
