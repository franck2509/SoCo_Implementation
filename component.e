note
	description: "Summary description for {DOCLEAF_COMPONENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	COMPONENT

inherit
	HTMLGEN

feature
    content: STRING deferred end

--    size: INTEGER deferred end		I don't think we need this _FH

--    is_empty:BOOLEAN deferred end		same as above _FH

    parent: detachable COMPONENT 	-- what does this do? _FH

feature {COMPONENT}

    set_parent(dc:COMPONENT)		-- what does this do? _FH
        do
        	parent:=dc
        end

end
