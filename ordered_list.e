note
	description: "Summary description for {ORDERED_LIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ORDERED_LIST

inherit
	COMPONENT
	
feature	-- Settings

	base_capacity: INTEGER	-- Number of elements in the list
	base_index: INTEGER	-- Index where the list starts
	ordered_list_array : ARRAY[STRING]	-- Array that contains elements in each index
	counter: INTEGER	-- For ordered list, to assign numbers to elements

feature -- Status

	set_counter	-- list starts with counter 1 (stands for index also)
		do
			counter := 1
		end

	set_capacity (c: INTEGER)	-- setting the number of elements, the list will contain
		do
			capacity := c
		end

	set_base_index (i: INTEGER)	-- same as in settings
		do
			base_index := i
		end

	create_array	-- the array gets created specifically, with the capacity and index
		do
			create ordered_list_array.with_capacity(base_capacity, base_index)
		end

	add_element (element: STRING)	--adding an element in the array
		require
			element.is_empty = FALSE	-- element for adding cant be empty
		do
			ordered_list_array[counter]:= counter + ": " +element
			counter:= counter + 1
		end


end
