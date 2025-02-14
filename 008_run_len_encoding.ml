type 'a rle =
  | One of 'a
  | Many of int * 'a

let encode list =
  let create_tuple count element =
    if count = 1 then One element
    else Many (count, element) in
  let rec aux count acc = function
    | [] -> acc
    | [x] -> 
        Printf.printf "List has one element (%d, %s) left\n" (count + 1) x; 
        print_newline ();
        create_tuple (count + 1) x :: acc
    | a :: (b :: _ as tail) -> 
        Printf.printf "Current: %s, Next: %s, Count: %d\n" a b count;
        if a = b then 
          aux (count + 1) acc tail 
        else 
          begin
            Printf.printf "New sequence starts, storing (%d, %s)\n" (count + 1) a;
            print_newline ();
            aux 0 (create_tuple (count + 1) a :: acc) tail
          end
  in
  List.rev (aux 0 [] list)


let () =
  let result = encode ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"] in
  List.iter (fun rle ->
    match rle with
    | One elem -> Printf.printf "One %s\n" elem
    | Many (count, elem) -> Printf.printf "Many (%d, %s)\n" count elem
  ) result
