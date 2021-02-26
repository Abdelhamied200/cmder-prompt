local function get_folder_name(str)
  index = str:match'^.*()\\'
  local dir = string.sub(str, index+1)
  return dir
end

function my_prompt_filter()
  fullcwd = clink.get_cwd()
  dir = get_folder_name(fullcwd)

  prompt = "\x1b[38;5;10m➜ {dir}{git}\x1b[0m".." "
  prompt = string.gsub(prompt, "{dir}", dir)

  clink.prompt.value = prompt
end

clink.prompt.register_filter(my_prompt_filter, 1)