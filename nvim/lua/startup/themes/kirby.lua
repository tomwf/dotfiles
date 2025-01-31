local kirby = {
	"                                    ",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣴⠶⠶⠶⠶⢦⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⢀⣴⠟⠛⠛⠻⢶⣄⣠⡴⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⣾⠁⠀⠀⠀⠀⠀⠝⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⣦⡀⠀⠀⠀⠀⠀⠀",
	"⠰⣏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡎⠱⡀⠀⠀⠀⡎⠱⡀⠀⠀⠀⠀⠀⠈⢳⣄⠀⠀⠀⠀⠀",
	"⠀⢿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣇⣰⡇⠀⠀⢸⣇⣰⡇⠀⠀⠀⠀⠀⠀⠀⢹⡄⠀⠀⠀⠀",
	"⠀⠈⢷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⣷⡀⠀⠀⠀",
	"⠀⠀⠀⠙⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⠟⠁⣀⣀⠀⠻⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣦⠀⠀",
	"⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡛⢛⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡆⠀",
	"⠀⠀⠀⠀⢻⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡟⠀",
	"⠀⠀⠀⠀⠈⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⣀⡼⠃⠀",
	"⠀⠀⠀⠀⣀⣼⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣛⠉⠀⠀⠀",
	"⠀⠀⣠⡾⠿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⣿⣿⠿⢿⣦⡀⠀",
	"⠀⣼⣿⣆⣠⣿⣿⣿⣿⣿⣷⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣾⣿⣿⣿⣿⣿⣤⣀⣿⣷⡀",
	"⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⡶⢶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃",
	"⠀⠀⠈⠙⠛⠛⠿⠿⠿⠿⠿⠟⠛⠛⠋⠉⠀⠀⠀⠀⠉⠙⠛⠛⠛⠿⠿⠿⠿⠿⠟⠛⠋⠉⠀⠀",
}

local quote = require("startup.functions").quote()
while true do
	if require("startup.utils").longest_line(quote) <= vim.o.columns - 15 then
		break
	end
	quote = require("startup.functions").quote()
end
local length = require("startup.utils").longest_line(quote) + 4

local complete = {}

table.insert(quote, 1, "")
quote[#quote + 1] = ""

table.insert(complete, "▛" .. string.rep("▀", length - 2) .. "▜")
local function spaces(amount)
	return string.rep(" ", amount)
end
for _, line in ipairs(quote) do
	table.insert(complete, "▌" .. " " .. line .. spaces(length - 3 - #line) .. "▐")
end
table.insert(complete, "▙" .. string.rep("▄", length - 2) .. "▟")

for _, line in ipairs(kirby) do
	complete[#complete + 1] = line
end

local settings = {
	header = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Header",
		margin = 5,
		content = complete,
		highlight = "ErrorMsg",
		oldfiles_amount = 0,
	},
	body = {
		type = "oldfiles",
		oldfiles_directory = true,
		align = "center",
		fold_section = false,
		title = "",
		margin = 5,
		content = "",
		highlight = "Title",
		oldfiles_amount = 10,
	},
	options = {
		after = function()
			require("startup.utils").oldfiles_mappings()
		end,
		mapping_keys = false,
		cursor_column = 0.25,
		empty_line_between_mappings = false,
		disable_statuslines = true,
		paddings = { 1, 1, 1, 1 },
	},
	mappings = {
		open_file = "o",
		open_file_split = "<c-o>",
		open_help = "?",
	},
	parts = { "header", "body" },
}

return settings
