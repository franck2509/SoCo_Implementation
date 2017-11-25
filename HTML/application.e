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
			--email_list:FS_FILE --, article, report: FS_FILE
			--count_visitor: TEXTFILE_COUNT_VISITOR

			homepage, page: PAGE -- create a number of pages and call them p1, p2, p3... || or we say we got a Homepage and Subpages
			I_title: TITLE
			I_paragraph: PARAGRAPH

			get_htmlcode: HTML_VISITOR

--Order:
--Set a URL first
--Create a page
--Create title
--Create other attributes
--Create next pages with one title first and then multiple attributes

		do
			create homepage.make ("Homepage") -- macht eine Liste (von component-elementen), mit diesem Namen

			create page.make ("Page 1") -- zweite Liste
			homepage.add_entry (page) -- pusht page in homepage

			io.put_string ("Thanks for working with our HTML Generator %N%N")


			-- Creates components and pushes to a page
			create I_title.make ("Super Title") -- Title Objekt erhält name
			homepage.add_entry (I_title)

			create I_title.make ("Title for first subpage")
			page.add_entry (I_title)


			create I_paragraph.make ("This is the first paragraph")
			homepage.add_entry (I_paragraph)

			create I_paragraph.make ("This is first SUBPAGE paragraph")
			page.add_entry (I_paragraph)

			create I_paragraph.make ("This is a HOMEPAGE paragraph")
			homepage.add_entry (I_paragraph)

		--	io.put_string (homepage.print_string (get_htmlcode)) -- OUTPUTS homepage "!DOCTYPE"

			create I_paragraph.make ("This is second SUBPAGE paragraph")
			page.add_entry (I_paragraph)
		--	io.put_string (page.print_string) -- OUTPUTS first subpage "!DOCTYPE"

			-- Create html_visitor
			create get_htmlcode.make
			homepage.accept (get_htmlcode) -- GOAL:loop through the homepage list with all pages & elements

			io.put_string ("The homepage document starts here:%N%N" + get_htmlcode.name)
			--page.accept (get_htmlcode) -- this WILL add unnecessary html to the string
			io.put_string ("The html document starts here:%N%N" + get_htmlcode.name)

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

