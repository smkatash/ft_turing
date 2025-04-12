type turing_arguments = { jsonfile: string; input: string }

type action_direction = 
  | RIGHT
  | LEFT

type state_transition_operation = {
  read: char;
  to_state: string;
  write: char;  
  action: action_direction
}

module StringMap = Map.Make(String)

type machine_parameters = {
  name: string;
  alphabet:char list;
  blank: string;
  states: string list;
  initial: string;
  finals: string list;
  transitions: state_transition_operation list StringMap.t; 
}

type tape_state = {
  left : char list;
  head : char;
  right : char list;
  state : string
}

exception InvalidInputSchema of string

