let rec last = function
	| [] -> None
	| [ x ] -> Some x
	| _ :: t -> last t

let () =
  match last ["a"; "b"; "c"; "d"] with
  | Some x -> print_endline x
  | None -> print_endline "Empty list"