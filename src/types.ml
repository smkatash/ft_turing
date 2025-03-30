type turing_arguments = { jsonfile: string; input: string }

type action_direction = 
  | RIGHT
  | LEFT

type state_transition_operation = {
  read: string;
  to_state: string;
  write: string;  
  action: action_direction
}

module StringMap = Map.Make(String)

type machine_parameters = {
  name: string;
  alphabet: string list;
  blank: string;
  states: string list;
  initial: string;
  finals: string list;
  transitions: state_transition_operation list StringMap.t; 
}

exception InvalidInputSchema of string

