let rev list =
	let rec aux acc = function
		| [] -> acc
		| x::xs -> aux (x::acc) xs
	in
	aux [] list

let is_palindrome list =
  list = rev list

let () =
  let result1 = is_palindrome ["x"; "a"; "m"; "a"; "x"] in
  print_endline (string_of_bool result1);

  let result2 = not (is_palindrome ["a"; "b"]) in
  print_endline (string_of_bool result2)

  