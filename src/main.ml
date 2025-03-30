open Parser
open Types
open Utils

let () =
  let machine_parameters = parse_input_to_machine_params () in
  log_machine_head machine_parameters;
  log_machine_transitions machine_parameters.transitions;
  log_machine_footer ()