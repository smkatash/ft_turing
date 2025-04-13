open Parser
open Types
open Utils
open Machine


let () =
  let (initial_tape_state, machine_parameters) = parse_input_to_machine_params () in
  log_machine_head machine_parameters;
  log_machine_transitions machine_parameters.transitions;
  log_machine_footer ();
  run_machine initial_tape_state machine_parameters