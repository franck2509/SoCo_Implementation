note
	description: "HTMLGEN application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	HTMLGEN

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			print ("Hello Eiffel World!%N")
		end

end
