let rev list =
	let rec aux acc = function
		| [] -> acc
		| x::xs -> aux (x::acc) xs
	in
	aux [] list

let rec print_list = function 
	| [] -> ()
	| x::xs ->
			print_string x;
			print_string " ";
			print_list xs

let () =
	let rev_list = rev ["a"; "b"; "c"] in
	print_list rev_list