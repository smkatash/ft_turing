val log_machine_name : string -> unit
val log_machine_alphabet : char list -> unit
val log_machine_states : string list -> unit
val log_machine_initial : string -> unit
val log_machine_finals : string list -> unit
val log_machine_head : Types.machine_parameters -> unit
val log_state_transition : string -> Types.state_transition_operation -> unit
val log_machine_transitions :
  Types.state_transition_operation list Types.StringMap.t -> unit
val log_machine_footer : unit -> unit
val log_tape_transition :
  Types.tape_state -> Types.state_transition_operation -> unit
