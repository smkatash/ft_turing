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

let move_right tape =
  match tape.right with
  | head :: tail -> {
      left = tape.head :: tape.left;
      head = head;
      right = tail;
      state = tape.state;
      }
  | [] -> {
    left = tape.head :: tape.left;
    head = '.';
    right = [];
    state = tape.state;
  }

let move_left tape  =
  match tape.left with
  | head :: tail -> {
      left = tail;
      head = head;
      right = tape.head :: tape.right;
      state = tape.state
      }
  | [] -> {
    left = tape.head :: tape.left;
    head = '.';
    right = [];
    state = tape.state;
  }

let apply_transition tape transition =
  let updated_tape = { tape with head = transition.write; state = transition.to_state } in
  match transition.action with
  | RIGHT -> move_right updated_tape
  | LEFT -> move_left updated_tape

let is_halting_state current_state finals =
  List.mem current_state finals

let print_tape_state tape =
  let left_str = String.concat "" (List.map (String.make 1) (List.rev tape.left)) in
  let right_str = String.concat "" (List.map (String.make 1) tape.right) in
  Printf.printf "State: %s\n" tape.state;
  Printf.printf "Tape: %s[%c]%s\n" left_str tape.head right_str

let rec run_machine tape machine_parameters =
  (* Check if an accepting or rejecting state is reached *)
  if is_halting_state tape.state machine_parameters.finals then
     exit 0
  else
    (* Get the next transition for the current symbol *)
    let next_transition = get_next_transition tape machine_parameters.transitions in
    log_tape_transition tape next_transition;
    (* Apply the transition and move the machine *)
    let updated_tape = apply_transition tape next_transition in
    run_machine updated_tape machine_parameters