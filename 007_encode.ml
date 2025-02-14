let encode list =
  let rec aux count acc = function
    | [] -> acc
    | [x] -> 
        Printf.printf "List has one element (%d, %s) left\n" (count + 1) x; 
        print_newline ();
        (count + 1, x) :: acc
    | a :: (b :: _ as tail) -> 
        Printf.printf "Current: %s, Next: %s, Count: %d\n" a b count;
        if a = b then 
          aux (count + 1) acc tail 
        else 
          begin
            Printf.printf "New sequence starts, storing (%d, %s)\n" (count + 1) a;
            print_newline ();
            aux 0 ((count + 1, a) :: acc) tail
          end
  in
  List.rev (aux 0 [] list)


let () =
  let result = encode ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"] in
  List.iter (fun (count, elem) -> Printf.printf "(%d, %s) " count elem) result
