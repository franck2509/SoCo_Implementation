class
	TITLE

inherit
	WEBSITE_COMPONENT

create
	make

feature

	make (a_name: STRING)
		do
			name := a_name
		end


	accept (a_visitor: VISITOR)
		do
			--io.put_string (a_visitor.visit_title (Current))
			name := a_visitor.visit_title (Current)
		end



	--name: STRING

	--size: INTEGER
	--	do
	--	end

end
