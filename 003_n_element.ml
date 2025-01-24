let rec at index = function
	| [] -> None
	| x::xs ->
		if index = 0 then Some x
		else at (index - 1) xs

let () =
	match at 3 ["a"; "b"; "c"; "d"] with
	| Some x -> print_endline x
	| None -> print_endline "Empty list"
