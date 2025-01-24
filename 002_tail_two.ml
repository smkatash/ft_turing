let rec last_two = function
	| [] -> None
	| [ x; y ] -> Some (x, y)
	| _ :: t -> last_two t

let () =
  match last_two ["a"; "b"; "c"; "d"] with
  | Some (x, y) -> Printf.printf "%s, %s\n" x y
  | None -> print_endline "Empty list"