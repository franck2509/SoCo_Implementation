note
	description: "Summary description for {HTML_VISITOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTML_VISITOR

inherit
	VISITOR

create
	make

feature			-- all visitors with html formatting

	visit_newPage		-- creation of new page (correct way of creating new page?)
		deferred
		end

	visit_ExternalLink
		deferred
		end

	visit_Heading
		deferred
		end

	visit_Image
		deferred
		end

	visit_InternalLink
		deferred
		end

	visit_OrderedList
		deferred
		end

	visit_Paragraph
		deferred
		end

	visit_Snippet
		deferred
		end

	visit_TableBody
		deferred
		end

	visit_TableHeader
		deferred
		end

	visit_Title
		deferred
		end

	visit_UnorderedList
		deferred
		end
end
