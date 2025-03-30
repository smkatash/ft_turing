
let get_next_state machine_parameters current_state current=



let log_machine_transitions transitions_map =
  StringMap.iter (fun state transitions ->
    (* For each state, print its name and the corresponding transitions *)
    List.iter (fun transition ->
      log_state_transition state transition)  transitions
  ) transitions_map