val get_transition_list_for_current_state :
  Types.StringMap.key -> 'a Types.StringMap.t -> 'a
val get_transition_for_head :
  char ->
  Types.state_transition_operation list -> Types.state_transition_operation
val get_next_transition :
  Types.tape_state ->
  Types.state_transition_operation list Types.StringMap.t ->
  Types.state_transition_operation
val move_right : Types.tape_state -> char -> Types.tape_state
val move_left : Types.tape_state -> char -> Types.tape_state
val apply_transition :
  Types.tape_state ->
  Types.state_transition_operation -> char -> Types.tape_state
val is_halting_state : 'a -> 'a list -> bool
val is_palindrome : 'a list -> char
val is_0n1n : char list -> char
val is_02n : char list -> char
val run_machine : Types.tape_state -> Types.machine_parameters -> 'a
