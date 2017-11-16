note
	description: "Summary description for {UNORDERED_LIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	UNORDERED_LIST

inherit
	COMPONENT

feature

	base_capacity: INTEGER
	base_index: INTEGER
	unordered_list_array : ARRAY[STRING]
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
			create unordered_list_array.with_capacity(base_capacity, base_index)
		end

	add_element (element: STRING)
		require
			element.is_empty = FALSE
		do
			unordered_list_array[counter]:= element
			counter:= counter + 1
		end


end
