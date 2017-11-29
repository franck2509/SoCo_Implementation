deferred class
	VISITOR

feature



	visit_page (a_page: PAGE)
		deferred
		end

	visit_title (a_page: PAGE): STRING
		deferred
		end

	visit_paragraph (a_paragraph: PARAGRAPH): STRING
		deferred
		end

	visit_image (a_image: IMAGE): STRING
		deferred
		end

	visit_snippet (a_snippet: SNIPPET): STRING
		deferred
		end

	visit_heading (a_heading: HEADING): STRING
		deferred
		end

	visit_table_row (a_table_row: TABLE_ROW): STRING
		deferred
		end

	visit_table_header (a_table_header: TABLE_HEADER): STRING
		deferred
		end

	visit_table_start (a_table_start: TABLE_START): STRING
		deferred
		end

	visit_table_end (a_table_end: TABLE_END): STRING
		deferred
		end

	visit_list_ordered (a_ordered_list: LIST_ORDERED): STRING
		deferred
		end

	visit_list_unordered (a_unordered_list: LIST_UNORDERED): STRING
		deferred
		end

	visit_link_external (a_external_link: LINK_EXTERNAL): STRING
		deferred
		end

--	visit_link_internal



end
