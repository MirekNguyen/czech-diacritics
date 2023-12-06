local M = {}

function M.add_diacritics()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local lines = vim.fn.getline(start_line, end_line)
  local lines_content = table.concat(lines, "\n")

  local command = string.format(
    "curl -s 'https://korektor.lingea.cz/api/addDiacritics'"
    .. " --compressed"
    .. " -X POST "
    .. " -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8'"
    .. " -H 'X-Requested-With: XMLHttpRequest'"
    .. " --data-raw 'text=%s&srcLang=cz'"
    .. " | sed -e 's/<[^>]*>//g'",
    lines_content
  )

  local file = io.popen(command)
  local output = file:read("*a")
  file:close()

  local output_table = {}
  for line in output:gmatch("[^\r\n]+") do
    table.insert(output_table, line)
  end
  for line_num = start_line, end_line do
    if output_table[line_num] then
      vim.fn.setline(line_num, output_table[line_num])
    else
      vim.fn.setline(line_num, "")
    end
  end
end

function M.setup()
end

return M

