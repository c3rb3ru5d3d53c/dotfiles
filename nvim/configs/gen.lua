require("gen").setup({
  model = "mistral:latest",
  display_mode = "float",
  show_prompt = false,
  show_model = false,
  no_auto_close = false,
  init = nil,
  command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
  list_models = "<function>",
  debug = false,
})

require("gen").prompts["Display_Response"] = {
  prompt = "$input",
  replace = false,
}

require("gen").prompts["Display_Response_Selection"] = {
  prompt = "$input\n$text",
  replace = false,
}

require("gen").prompts["Insert_Response"] = {
  prompt = "$input",
  replace = true,
}

require("gen").prompts["Insert_Response_Selection"] = {
  prompt = "$input:\n$text",
  replace = true,
}

require("gen").prompts["Insert_Response_Code_Selection"] = {
  prompt = "$input. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
  replace = true,
  extract = "```$filetype\n(.-)```"
}

