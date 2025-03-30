val usage_msg : string
val error_msg : string
val parse_input_args : unit -> Types.turing_arguments
val get_valid_json_format_data_from_file :
  Types.turing_arguments -> Yojson.Basic.t
val extract_json_data : Yojson.Basic.t -> Types.machine_parameters
val check_for_duplicate_values : Yojson.Basic.t -> unit
val parse_machine_parameters :
  Types.turing_arguments -> Types.machine_parameters
val print_transition : Types.state_transition_operation -> unit
val print_transitions :
  Types.state_transition_operation list Types.StringMap.t -> unit
val print_machine_parameters : Types.machine_parameters -> unit
val parse_input_to_machine_params : unit -> Types.machine_parameters
