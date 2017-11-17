note
	description: "Summary description for {DS_DOC}."
	author: "wq"



deferred class
	COMPOSITE_PAGE

inherit

	COMPONENT

feature
	content:STRING

	size:INTEGER --string length

    is_empty:BOOLEAN -- what is empty? redundant with string length? _FH

	add_entry(dc: COMPONENT)--add leaf or doc
	    require
	    	dc.parent=Void
	    	not dc.is_empty
        deferred

	    ensure
	    	updated:size=old size+dc.size
	    end




	add_link(dc:COMPONENT)--"/xxx"   delete this_wq
	    require
	    	dc.parent=Void
	    	not dc.is_empty
	    deferred
	    end



	add_anchor(dc:COMPONENT)--"#xxx"  delete this_wq
	    require
	    	dc.parent=Void
	    	not dc.is_empty

	    deferred
	    end



	output(dc:COMPONENT)  --delete this_wq
	    require
	    	dc.parent=Void
	    	not dc.is_empty
	    deferred
	    end



end
