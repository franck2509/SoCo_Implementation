class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local

			homepage, page: PAGE -- creates Homepage (homepage) and Subpages (page)
			I_title: TITLE ------ we could integrate TITLE into "homepage/page" ???
			I_paragraph: PARAGRAPH

			get_htmlcode: HTML_VISITOR

--Order:
--1. Set a URL first
--2. Create a homepage
--3. Create a title and add it to homepage
--4. Create any other component and add it to homepage

--5. Create a title and add it to page
--6. Create any other component and add it to page
--7. Create the chosen visitor and call it with homepage.accept

--8. Repeat 5. - 7. for each new page

		do
			create homepage.make ("Homepage") -- macht eine Liste (von component-elementen), mit diesem Namen

			create page.make ("Page 1") -- zweite Liste
			homepage.add_entry (page) -- pusht page in homepage

			io.put_string ("Thanks for working with our HTML Generator.%NThis is a string of all your subpages, followed by the homepage: %N%N")



			-- Creates components and pushes to a page
			create I_title.make ("Super Title") -- Title Objekt erhält name
			homepage.add_entry (I_title)

			create I_title.make ("Title for first SUBPAGE")
			page.add_entry (I_title)


			create I_paragraph.make ("This is the first HOME paragraph")
			homepage.add_entry (I_paragraph)

			create I_paragraph.make ("This is the first SUBPAGE paragraph")
			page.add_entry (I_paragraph)

			create I_paragraph.make ("This is the second HOMEPAGE paragraph")
			homepage.add_entry (I_paragraph)

			create I_paragraph.make ("This is the second SUBPAGE paragraph")
			page.add_entry (I_paragraph)

			---------------------------------------
			-- TEST: 2. SUBPAGE
			create page.make ("Page 2")
			homepage.add_entry (page)
			create I_paragraph.make ("This is the first SUBPAGE TWO paragraph")
			page.add_entry (I_paragraph)

			create I_paragraph.make ("Will this be overridden?") -- won't be added, since add_entry is skipped
			create I_paragraph.make ("Will this OVERRIDE the string above? - edit: yes, it does")
			page.add_entry (I_paragraph)
			--page.add_entry (I_title)

			---------------------------------------
		--	io.put_string (page.print_string) -- OUTPUTS first subpage "!DOCTYPE"

			-- Create html_visitor
			create get_htmlcode.make -- creates the visitor object, that instanciates a string, that will be overridden and put out later
			homepage.accept (get_htmlcode) -- GOAL:loop through the homepage list with all pages & elements

			--io.put_string ("The homepage document starts here:%N%N" + get_htmlcode.name)
			--page.accept (get_htmlcode) -- this WILL add unnecessary html to the string
			--io.put_string ("The html document starts here:%N%N" + get_htmlcode.name)

		end

end
				--create article.make ("article.txt", 100, True)
			--page2.add_entry (article)
			--create report.make ("report.pdf", 50, False)
			--page2.add_entry (report)		--io.put_string ("Size of page: " + page.size.out + "%N")
				-- Test:
			--page.printit (page2) <- we print it with pageText (PAGE)
			--I_title.accept (get_htmlcode)
			--create count_visitor
			--page.accept (count_visitor)
			--io.put_string ("Number of text files in Page: " + count_visitor.textfile_count.out + "%N")

			--create count_visitor
			--article.accept (count_visitor)
			--io.put_string ("Number of text files in article: " + count_visitor.textfile_count.out + "%N")
-------------------------------------------
			--create get_htmlcode.make
			--article.accept (get_htmlcode)
			--io.put_string (get_htmlcode.text_html + "%N")

			--create get_htmlcode.visit_title (email_list.namecopy)
			--title.accept (get_htmlcode)
			--io.put_string (get_htmlcode.title + "%N")

