-- Neon Green Neovim config — palette shared with kitty / waybar / starship / btop / wofi / rofi
-- The colourscheme is defined inline so the palette stays byte-identical to the other
-- dotfiles; nothing to install, so vim.pack has no plugins to add.

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

local c = {
	bg = "#0A0F0A",
	bg_alt = "#0F1710",
	sel = "#17261A",
	dim = "#2F4A35",
	subtle = "#6FA87A",
	fg = "#C6F5CE",
	fg_hi = "#DDFFE3",
	white = "#F2FFF4",
	neon = "#39FF14", -- primary neon green
	lime = "#76FF3C",
	chart = "#A8FF00", -- chartreuse
	acid = "#D7FF1A",
	aqua = "#00FFC8",
	spring = "#00FF85",
	jade = "#00E5A0",
	deep = "#0ABF53",
	red = "#FF2D55",
	amber = "#FFB31A",
}

-- transparent background: kitty already supplies background_opacity 0.85
local transparent = true
local bg = transparent and "NONE" or c.bg
local bg_alt = transparent and "NONE" or c.bg_alt

vim.cmd("highlight clear")
vim.g.colors_name = "neon-green"
vim.o.background = "dark"

local hl = vim.api.nvim_set_hl
local groups = {
	-- editor chrome
	Normal = { fg = c.fg, bg = bg },
	NormalNC = { fg = c.fg, bg = bg },
	NormalFloat = { fg = c.fg, bg = bg_alt },
	FloatBorder = { fg = c.neon, bg = bg_alt },
	FloatTitle = { fg = c.neon, bg = bg_alt, bold = true },
	WinSeparator = { fg = c.deep },
	ColorColumn = { bg = c.bg_alt },
	Conceal = { fg = c.dim },
	Cursor = { fg = c.bg, bg = c.neon },
	lCursor = { fg = c.bg, bg = c.neon },
	CursorIM = { fg = c.bg, bg = c.neon },
	CursorLine = { bg = c.bg_alt },
	CursorColumn = { bg = c.bg_alt },
	CursorLineNr = { fg = c.neon, bold = true },
	LineNr = { fg = c.dim },
	SignColumn = { fg = c.dim, bg = bg },
	FoldColumn = { fg = c.dim, bg = bg },
	Folded = { fg = c.subtle, bg = c.bg_alt },
	MatchParen = { fg = c.acid, bold = true, underline = true },
	Visual = { bg = c.sel },
	VisualNOS = { bg = c.sel },
	Search = { fg = c.bg, bg = c.lime },
	IncSearch = { fg = c.bg, bg = c.neon, bold = true },
	CurSearch = { fg = c.bg, bg = c.neon, bold = true },
	Substitute = { fg = c.bg, bg = c.amber },
	QuickFixLine = { bg = c.sel, bold = true },
	Directory = { fg = c.neon, bold = true },
	Title = { fg = c.neon, bold = true },
	EndOfBuffer = { fg = c.bg_alt },
	NonText = { fg = c.dim },
	SpecialKey = { fg = c.dim },
	Whitespace = { fg = c.dim },
	Question = { fg = c.spring },
	ModeMsg = { fg = c.neon, bold = true },
	MoreMsg = { fg = c.spring },
	MsgArea = { fg = c.fg },
	ErrorMsg = { fg = c.red, bold = true },
	WarningMsg = { fg = c.amber, bold = true },

	-- statusline / tabline / popups
	StatusLine = { fg = c.fg_hi, bg = c.bg_alt },
	StatusLineNC = { fg = c.dim, bg = c.bg_alt },
	TabLine = { fg = c.subtle, bg = c.bg_alt },
	TabLineFill = { bg = c.bg },
	TabLineSel = { fg = c.bg, bg = c.neon, bold = true },
	WinBar = { fg = c.fg_hi, bold = true },
	WinBarNC = { fg = c.subtle },
	Pmenu = { fg = c.fg, bg = c.bg_alt },
	PmenuSel = { fg = c.white, bg = c.sel, bold = true },
	PmenuSbar = { bg = c.bg_alt },
	PmenuThumb = { bg = c.dim },
	PmenuKind = { fg = c.aqua, bg = c.bg_alt },
	PmenuExtra = { fg = c.subtle, bg = c.bg_alt },
	WildMenu = { fg = c.bg, bg = c.neon },

	-- syntax
	Comment = { fg = c.subtle, italic = true },
	Constant = { fg = c.aqua },
	String = { fg = c.lime },
	Character = { fg = c.lime },
	Number = { fg = c.chart },
	Boolean = { fg = c.chart, bold = true },
	Float = { fg = c.chart },
	Identifier = { fg = c.fg },
	Function = { fg = c.neon, bold = true },
	Statement = { fg = c.spring },
	Conditional = { fg = c.spring },
	Repeat = { fg = c.spring },
	Label = { fg = c.spring },
	Operator = { fg = c.jade },
	Keyword = { fg = c.spring, italic = true },
	Exception = { fg = c.red },
	PreProc = { fg = c.aqua },
	Include = { fg = c.aqua },
	Define = { fg = c.aqua },
	Macro = { fg = c.aqua },
	PreCondit = { fg = c.aqua },
	Type = { fg = c.acid },
	StorageClass = { fg = c.acid },
	Structure = { fg = c.acid },
	Typedef = { fg = c.acid },
	Special = { fg = c.jade },
	SpecialChar = { fg = c.amber },
	Tag = { fg = c.neon },
	Delimiter = { fg = c.subtle },
	SpecialComment = { fg = c.subtle, italic = true, bold = true },
	Debug = { fg = c.amber },
	Underlined = { underline = true },
	Ignore = { fg = c.dim },
	Error = { fg = c.red, bold = true },
	Todo = { fg = c.bg, bg = c.acid, bold = true },

	-- spelling
	SpellBad = { sp = c.red, undercurl = true },
	SpellCap = { sp = c.acid, undercurl = true },
	SpellLocal = { sp = c.aqua, undercurl = true },
	SpellRare = { sp = c.chart, undercurl = true },

	-- diff
	DiffAdd = { fg = c.spring, bg = "#10210F" },
	DiffChange = { fg = c.acid, bg = "#1A1F0A" },
	DiffDelete = { fg = c.red, bg = "#230B10" },
	DiffText = { fg = c.bg, bg = c.acid },
	Added = { fg = c.spring },
	Changed = { fg = c.acid },
	Removed = { fg = c.red },

	-- diagnostics
	DiagnosticError = { fg = c.red },
	DiagnosticWarn = { fg = c.amber },
	DiagnosticInfo = { fg = c.aqua },
	DiagnosticHint = { fg = c.neon },
	DiagnosticOk = { fg = c.spring },
	DiagnosticUnderlineError = { sp = c.red, undercurl = true },
	DiagnosticUnderlineWarn = { sp = c.amber, undercurl = true },
	DiagnosticUnderlineInfo = { sp = c.aqua, undercurl = true },
	DiagnosticUnderlineHint = { sp = c.neon, undercurl = true },
	DiagnosticUnderlineOk = { sp = c.spring, undercurl = true },

	-- lsp
	LspReferenceText = { bg = c.sel },
	LspReferenceRead = { bg = c.sel },
	LspReferenceWrite = { bg = c.sel, bold = true },
	LspInlayHint = { fg = c.dim, italic = true },
	LspSignatureActiveParameter = { fg = c.neon, bold = true },
	LspCodeLens = { fg = c.dim, italic = true },

	-- treesitter
	["@comment"] = { link = "Comment" },
	["@variable"] = { fg = c.fg },
	["@variable.builtin"] = { fg = c.jade, italic = true },
	["@variable.parameter"] = { fg = c.fg_hi },
	["@variable.member"] = { fg = c.aqua },
	["@constant"] = { fg = c.aqua },
	["@constant.builtin"] = { fg = c.chart, bold = true },
	["@module"] = { fg = c.acid },
	["@string"] = { link = "String" },
	["@string.escape"] = { fg = c.amber, bold = true },
	["@string.special.url"] = { fg = c.aqua, underline = true },
	["@function"] = { link = "Function" },
	["@function.builtin"] = { fg = c.neon },
	["@function.method"] = { fg = c.neon },
	["@constructor"] = { fg = c.acid, bold = true },
	["@keyword"] = { link = "Keyword" },
	["@operator"] = { link = "Operator" },
	["@punctuation.delimiter"] = { fg = c.subtle },
	["@punctuation.bracket"] = { fg = c.subtle },
	["@punctuation.special"] = { fg = c.jade },
	["@type"] = { link = "Type" },
	["@type.builtin"] = { fg = c.acid, italic = true },
	["@attribute"] = { fg = c.chart },
	["@property"] = { fg = c.aqua },
	["@tag"] = { fg = c.spring },
	["@tag.attribute"] = { fg = c.chart },
	["@tag.delimiter"] = { fg = c.subtle },
	["@markup.heading"] = { fg = c.neon, bold = true },
	["@markup.strong"] = { bold = true },
	["@markup.italic"] = { italic = true },
	["@markup.strikethrough"] = { strikethrough = true },
	["@markup.link"] = { fg = c.aqua, underline = true },
	["@markup.raw"] = { fg = c.lime },
	["@markup.list"] = { fg = c.spring },
	["@diff.plus"] = { fg = c.spring },
	["@diff.minus"] = { fg = c.red },
	["@diff.delta"] = { fg = c.acid },
}

for group, spec in pairs(groups) do
	hl(0, group, spec)
end

-- terminal colours inside :terminal, same order as kitty's color0..15
vim.g.terminal_color_0 = c.sel
vim.g.terminal_color_8 = c.dim
vim.g.terminal_color_1 = c.red
vim.g.terminal_color_9 = "#FF5C7A"
vim.g.terminal_color_2 = c.neon
vim.g.terminal_color_10 = c.lime
vim.g.terminal_color_3 = c.acid
vim.g.terminal_color_11 = "#E8FF5C"
vim.g.terminal_color_4 = "#00B36B"
vim.g.terminal_color_12 = "#00E58A"
vim.g.terminal_color_5 = c.chart
vim.g.terminal_color_13 = "#C6FF4D"
vim.g.terminal_color_6 = c.aqua
vim.g.terminal_color_14 = "#5CFFD9"
vim.g.terminal_color_7 = c.fg
vim.g.terminal_color_15 = c.white
