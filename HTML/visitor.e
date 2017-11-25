deferred class
	VISITOR

feature



	visit_page (a_page: PAGE)
		deferred
		end

	visit_title (a_title: TITLE): STRING
		deferred
		end

	visit_paragraph (a_paragraph: PARAGRAPH): STRING
		deferred
		end


	--make_title (a_title: TITLE)
	--	deferred
	--	end

	--titleText := "" <- do NOT instanciate here

end
