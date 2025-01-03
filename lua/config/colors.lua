---------------------------------
--- @file colors.lua
--- @brief Color Codes for colorized strings.
--- Includes:
--- - Color Codes
--- - Getter to colorize a string (supports formatting)
---------------------------------

---------------------------------------------
---- Color Codes
---------------------------------------------
local M = {}

local mod = {}

--- Table with color codes
local colorCode = {
	black = "0;30",
	dgrey = "1;30",
	red = "0;31",
	bred = "1;31",
	green = "0;32",
	bgreen = "1;32",
	brown = "0;33",
	yellow = "1;33",
	blue = "0;34",
	bblue = "1;34",
	dblue = "2;34",
	dpurple = "0;35",
	bpurple = "1;35",
	dcyan = "0;36",
	cyan = "1;36",
	bgrey = "0;37",
	white = "1;37",
	none = "0",
}

mod.colorPallet = { "blue", "bgreen", "dpurple", "bred", "brown", "cyan", "green", "yellow", "red" }

local getColorCode = function(color)
	if type(color) == "number" then
		color = colorCode[mod.colorPallet[((color - 1) % #mod.colorPallet) + 1]]
	else
		color = colorCode[color] or colorCode["none"]
	end
	return "\027[" .. color .. "m"
end

--- Colorizes a string. No formatting supported.
--- @param str string: the string to be colorized.
--- @param color string: the color to be used.
--- @return string
M.getColorizedString = function(str, color)
	return getColorCode(color) .. str .. getColorCode()
end

--- Colorize a string red.
--- @param str string: the string to be colorized.
--- @return string
M.red = function(str, ...)
	return M.getColorizedString(str:format(...), "red")
end

--- Colorize a string bright red.
M.bred = function(str, ...)
	return M.getColorizedString(str:format(...), "bred")
end

--- Colorize a string yellow.
--- @param str string: the string to be colorized.
--- @return string
M.yellow = function(str, ...)
	return M.getColorizedString(str:format(...), "yellow")
end

return M
