open Parser
open Types
open Utils
open Machine

let initial_tape: tape_state = {
  left = [];
  head = '1';
  right = ['1'; '1'; '-'; '1'; '1'; '='];
  state = "scanright";
}

let () =
  let machine_parameters = parse_input_to_machine_params () in
  log_machine_head machine_parameters;
  log_machine_transitions machine_parameters.transitions;
  log_machine_footer ();
  run_machine initial_tape machine_parameters