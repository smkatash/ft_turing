open Types
open Utils
open Parser

let get_transition_list_for_current_state current_state transitions_map =
  match StringMap.find_opt current_state transitions_map with
  | Some transition_list -> transition_list
  | None -> failwith ("State not found in transition map: " ^ current_state)


let get_transition_for_head head transition_list =
  match List.find_opt(fun transition -> transition.read = head) transition_list with
  | Some state_transition -> state_transition
  | None -> failwith ("No transition found for symbol: " ^ (String.make 1 head))

let get_next_transition tape transitions_map = 
  let current_state: string = tape.state in
  let transition_list = get_transition_list_for_current_state current_state transitions_map in
  let current_head: char = tape.head in
  get_transition_for_head current_head transition_list

let move_right tape blank =
  match tape.right with
  | head :: tail -> {
      left = tape.head :: tape.left;
      head = head;
      right = tail;
      state = tape.state;
      }
  | [] -> {
    left = tape.head :: tape.left;
    head = blank;
    right = [];
    state = tape.state;
  }

let move_left tape blank =
  match tape.left with
  | head :: tail -> {
      left = tail;
      head = head;
      right = tape.head :: tape.right;
      state = tape.state
      }
  | [] -> {
    left = tape.head :: tape.left;
    head = blank;
    right = [];
    state = tape.state;
  }

let apply_transition tape transition blank =
  let updated_tape = { tape with head = transition.write; state = transition.to_state } in
  match transition.action with
  | RIGHT -> move_right updated_tape blank
  | LEFT -> move_left updated_tape blank

let is_halting_state current_state finals =
  List.mem current_state finals

let is_palindrome input =
 if input = List.rev input then 'y' else 'n'

let is_0n1n input = 
  let rec count_zeros acc = function 
    | '0' :: tail -> count_zeros (acc + 1) tail
    | tail -> (acc, tail)
  in
  let (n, tail) = count_zeros 0 input in
  let rec compare_zeros_with_count_ones n = function
    | [] -> if n = 0 then 'y' else 'n'
    | '1' :: tail -> if n > 0 then compare_zeros_with_count_ones (n - 1) tail else 'n'
    | _ -> 'n'
  in
  compare_zeros_with_count_ones n tail

let is_02n input = 
  let rec check_zero_counts_modulo_two count = function
    | [] ->  if count mod 2 = 0 then 'y' else 'n'
    | '0' :: tail -> check_zero_counts_modulo_two (count + 1) tail
    | _ -> 'n'
  in
  check_zero_counts_modulo_two 0 input


let rec run_machine tape machine_parameters =
  let next_transition = get_next_transition tape machine_parameters.transitions in
  (* Apply the transition and move the machine *)
  let updated_tape = apply_transition tape next_transition machine_parameters.blank in
  (* Check if an accepting or rejecting state is reached *)
    if is_halting_state updated_tape.state machine_parameters.finals then
      let full_tape = List.rev (updated_tape.left) @ [updated_tape.head] @ updated_tape.right in
      let is_palindrome_char = is_palindrome full_tape in
      let is_0n1n_char = is_0n1n full_tape in
      let is_02n_char = is_02n full_tape in
      let updated_tape_with_description = { tape with right = tape.right @ [is_palindrome_char] @ [is_0n1n_char] @ [is_02n_char] } in
      log_tape_transition updated_tape_with_description next_transition;
      exit 0
  else
    log_tape_transition tape next_transition;
    run_machine updated_tape machine_parameters