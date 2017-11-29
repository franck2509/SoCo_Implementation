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
		local -- Choose and add content with the corresponding local variables.

			homepage, page: PAGE -- creates homepage (+URL) and subpages (+sub-URL) plus their titles
			I_heading: HEADING	-- creates heading
			I_paragraph: PARAGRAPH	-- creates paragraph
			I_image: IMAGE		-- creates image
			I_snippet: SNIPPET	-- creates snippet
			I_table_header: TABLE_HEADER	-- creates the head row for table
			I_table_row: TABLE_ROW		-- creates table row inside the table set
			I_ordered_list: LIST_ORDERED	-- creates ordered list
			I_unordered_list: LIST_UNORDERED	-- creates unordered list
		--	I_internal_link: LINK_INTERNAL
		--	I_external_link: LINK_EXTERNAL

			get_htmlcode: HTML_VISITOR	-- initialize the html visitor as an object
			my_array: ARRAYED_LIST [STRING]	-- initialize variable for array with strings
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

			------------------------------------

			-- Create components and push to a page
			create I_heading.make ("Homepage Heading", 1, homepage)		-- adds a title to homepage, in form of the greatest heading
			create I_paragraph.make ("This is the first HOME paragraph", homepage)	-- adds a paragraph to homepage
			create I_paragraph.make ("This is the second HOMEPAGE paragraph", homepage)	-- adds second paragraph to homepage
			create I_image.make ("https://i.imgur.com/7PlPaTg.jpg", homepage)	-- adds an image to homepage, with url of the image
			
			create I_heading.make ("Heading for SUBPAGE", 2, page)	-- adds heading to subpage
			create I_paragraph.make ("This is the first SUBPAGE paragraph", page)	-- adds paragraph to subpage
			create I_paragraph.make ("This is the second SUBPAGE paragraph", page)	-- adds second paragraph to subpage
			create I_snippet.make ("<p><a href=%"html_images.asp%">HTML Images</a> is a link to a page on this website.</p>", page) -- adds snippet to subpage with url of the snippet
			

			create my_array.make (0) -- create an array that can be used as a row or a list
			my_array.extend("one") -- to skip one point, insert an empty string
			my_array.extend("two")
			my_array.extend("three")

			create I_table_header.make (my_array, homepage) -- adds your latest created list as a table header to the homepage
			create I_table_row.make (my_array, homepage) -- adds your latest created list as a table row to the homepage


				---------------------------------------
			-- TEST: 2. SUBPAGE
			create page.make ("Page 2")	-- creates subpage with name "Page 2"
			homepage.add_entry (page)	-- adds creates page to homepage-list

			create I_heading.make ("Heading for 2. SUBPAGE", 2, page)	-- adds elements to the newest subpage, added to the homepage-list
			create I_paragraph.make ("This is the first SUBPAGE TWO paragraph", page)
			create I_ordered_list.make (my_array, page)
			create I_unordered_list.make (my_array, page)

			---------------------------------------

			-- Create html_visitor
			create get_htmlcode.make (homepage) -- loops through the homepage list with all pages & elements and prints the html code

		end

end
