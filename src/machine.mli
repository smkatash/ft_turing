val get_transition_list_for_current_state :
  Types.StringMap.key -> 'a Types.StringMap.t -> 'a
val get_transition_for_head :
  char ->
  Types.state_transition_operation list -> Types.state_transition_operation
val get_next_transition :
  Types.tape_state ->
  Types.state_transition_operation list Types.StringMap.t ->
  Types.state_transition_operation
val move_right : Types.tape_state -> Types.tape_state
val move_left : Types.tape_state -> Types.tape_state
val apply_transition :
  Types.tape_state -> Types.state_transition_operation -> Types.tape_state
val is_halting_state : 'a -> 'a list -> bool
val print_tape_state : Types.tape_state -> unit
val run_machine : Types.tape_state -> Types.machine_parameters -> unit
