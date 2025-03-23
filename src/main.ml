


let read_text_from_file filename =
  try
    In_channel.with_open_text
      filename
      In_channel.input_all
  with Sys_error msg ->
    failwith ("Failed to read from file: " ^ msg)
