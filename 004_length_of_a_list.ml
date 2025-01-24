let length list =
    let rec aux n = function
        | [] -> n
        | _::xs -> aux (n + 1) xs
    in
    aux 0 list

let () =
	let x = length ["a"; "b"; "c"] in
    print_endline (string_of_int x)
