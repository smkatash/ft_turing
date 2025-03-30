open Types

let log_machine_name name = 
  let width = 80 in
  let name =
    if String.length name > width - 4 then
      String.sub name 0 (width - 4)
    else 
      name
  in
  let name_length = String.length name in
  let padding = (width - name_length - 4) / 2 in
  let spaces = String.make padding ' ' in
  let frame_line = String.make width '*' in
  let centered_name = spaces ^ name ^ spaces in
  let centered_name = if String.length centered_name < width - 4 then centered_name ^ " " else centered_name in
  let formatted_log = 
  ""^ frame_line ^ "
*                                                                              *
* " ^ centered_name ^ " *
*                                                                              *
"^ frame_line ^ ""
  in 
  print_endline formatted_log

let log_machine_alphabet alphabet = 
  let alphabet_str = 
    String.concat ", " alphabet
  in
  print_endline ("Alphabet: [ " ^ alphabet_str ^ " ]")
  
let log_machine_states states =
  let states_str = 
    String.concat ", " states
  in
  print_endline ("States: [ " ^ states_str ^ " ]")
  
let log_machine_initial initial =
  print_endline ("Initial: " ^ initial)
    
let log_machine_finals finals =
  let finals_str = 
    String.concat ", " finals
  in
  print_endline ("Finals: [" ^ finals_str ^ "]")

let log_machine_head machine_parameters =
  log_machine_name machine_parameters.name;
  log_machine_alphabet machine_parameters.alphabet;
  log_machine_states machine_parameters.states;
  log_machine_initial machine_parameters.initial;
  log_machine_finals machine_parameters.finals

(* Function to log a single state transition *)
let log_state_transition state transition =
  Printf.printf "(%s, %s) -> (%s, %s, %s)\n"
    state
    transition.read
    transition.to_state
    transition.write
    (match transition.action with
    | RIGHT -> "RIGHT"
    | LEFT -> "LEFT")

(* Function to log all transitions in the machine *)
let log_machine_transitions transitions_map =
  StringMap.iter (fun state transitions ->
    (* For each state, print its name and the corresponding transitions *)
    List.iter (fun transition ->
      log_state_transition state transition)  transitions
  ) transitions_map
  
let log_machine_footer () = 
  let width = 80 in
  let frame_line = String.make width '*' in
  print_endline frame_line
  


