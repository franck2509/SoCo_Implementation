class
	PAGE

inherit
	WEBSITE_COMPONENT

create
	make

feature

	make (a_name: STRING)
		do
			name := a_name
			name := "" -- ACHTUNG RAUSNEHMEN - wurde nur gemacht um nicht im final string zu sein
			create {LINKED_LIST [WEBSITE_COMPONENT]} entries.make -- LISTE für Visitor
		end


	size: INTEGER
		do
			Result := 0
			--from
			--	entries.start
			--until
			--	entries.off
			--loop
			--	Result := Result + entries.item.size -- RESULTAT bleibt hier (fertiger String)
			--	entries.forth
			--end
		end

	--pageText: STRING -- The whole site consists of multiple pages that add components with add_component

	add_entry (wc: WEBSITE_COMPONENT)
		do
			--pageText := pageText + wc.name -- wc.name ist a Component, thats already added it's html-code
			entries.extend (wc)
		end

	--print_String (a_visitor: Visitor): STRING  -------WICHTIG! SO WIRD DAS PROGRAMM NUR EIN DOCTYPE AUSGEBEN
	--	do
	--		Result := ("<!DOCTYPE html>%N<html>%N%N" + pageText (a_visitor) + "%N%N</html>%N%N%N")
	--	end

	--pageText (a_visitor: Visitor): STRING
	--	do
	--		Result := ""
	--		from
	--			entries.start
	--		until
	--			entries.off
	--		loop
	--			entries.item.accept (a_visitor)
	--			Result := Result + entries.item.name
	--			entries.forth
	--		end
	--	end

	--printIt (fc: WEBSITE_COMPONENT) -- <- müssen durch alle Elemente durchloopen
	--	do
	--		print ("<!DOCTYPE html>%N<html>%N" + fc.name + "%N</html>%N%N%N")
	--	end

	accept (a_visitor: VISITOR)
		do
			a_visitor.visit_page (Current)
		end



	--name: STRING

feature {VISITOR}

	entries: LIST [WEBSITE_COMPONENT] -- HIERDURCH KANN MAN VISITOR-FUNKTIONEN AUFRUFEN

end
