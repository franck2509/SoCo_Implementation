note
	description: "Summary description for {ORDERED_LIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ORDERED_LIST

inherit
	COMPONENT
feature

	base_capacity: INTEGER
	base_index: INTEGER
	ordered_list_array : ARRAY[STRING]
	counter: INTEGER

feature -- Status

	set_counter
		do
			counter := 1
		end

	set_capacity (c: INTEGER)
		do
			capacity := c
		end

	set_base_index (i: INTEGER)
		do
			base_index := i
		end

	create_array
		do
			create ordered_list_array.with_capacity(base_capacity, base_index)
		end

	add_element (element: STRING)
		require
			element.is_empty = FALSE
		do
			ordered_list_array[counter]:= counter + ": " +element
			counter:= counter + 1
		end


end
