-- nvtheme.lua - A warm, easy-on-the-eyes colorscheme
-- Custom colorscheme by Andrew Miotke

vim.cmd('highlight clear')
if vim.fn.exists('syntax_on') then
  vim.cmd('syntax reset')
end

vim.g.colors_name = 'nvtheme'

local colors = {
  -- Base colors (specified)
  bg = '#2a2a30',
  string = '#cfc6af',
  special = '#c0c0c0',

  -- Derived palette (easy on the eyes, warm tones)
  fg = '#d8d8d8',
  fg_dim = '#a0a0a0',
  comment = '#6a6a75',
  keyword = '#8a9cc7',
  func = '#d4a56a',
  type = '#7eb8a8',
  number = '#d4c8b0',
  constant = '#c49ea0',
  operator = '#b0b0b0',
  error = '#c97a7a',
  warning = '#d4a56a',
  info = '#7eb8a8',
  hint = '#8a9cc7',

  -- UI colors
  bg_dark = '#232328',
  bg_light = '#35353d',
  selection = '#3d3d47',
  line_nr = '#505058',
  cursor_line = '#32323a',
  visual = '#404050',
  search = '#4a4a3a',
  match = '#5a5a4a',
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor UI
hl('Normal', { fg = colors.fg, bg = colors.bg })
hl('NormalFloat', { fg = colors.fg, bg = colors.bg_dark })
hl('FloatBorder', { fg = colors.fg_dim, bg = colors.bg_dark })
hl('Cursor', { fg = colors.bg, bg = colors.fg })
hl('CursorLine', { bg = colors.cursor_line })
hl('CursorLineNr', { fg = colors.fg, bg = colors.cursor_line })
hl('LineNr', { fg = colors.line_nr })
hl('SignColumn', { bg = colors.bg })
hl('VertSplit', { fg = colors.bg_light })
hl('WinSeparator', { fg = colors.bg_light })
hl('StatusLine', { fg = colors.fg, bg = colors.bg_light })
hl('StatusLineNC', { fg = colors.fg_dim, bg = colors.bg_dark })
hl('Pmenu', { fg = colors.fg, bg = colors.bg_dark })
hl('PmenuSel', { fg = colors.fg, bg = colors.selection })
hl('PmenuSbar', { bg = colors.bg_light })
hl('PmenuThumb', { bg = colors.fg_dim })
hl('TabLine', { fg = colors.fg_dim, bg = colors.bg_dark })
hl('TabLineFill', { bg = colors.bg_dark })
hl('TabLineSel', { fg = colors.fg, bg = colors.bg })
hl('Visual', { bg = colors.visual })
hl('Search', { bg = colors.search })
hl('IncSearch', { fg = colors.bg, bg = colors.func })
hl('CurSearch', { fg = colors.bg, bg = colors.func })
hl('MatchParen', { bg = colors.match, bold = true })
hl('Folded', { fg = colors.comment, bg = colors.bg_dark })
hl('FoldColumn', { fg = colors.comment, bg = colors.bg })
hl('NonText', { fg = colors.line_nr })
hl('SpecialKey', { fg = colors.line_nr })
hl('Whitespace', { fg = colors.line_nr })
hl('EndOfBuffer', { fg = colors.bg })
hl('Directory', { fg = colors.keyword })
hl('Title', { fg = colors.func, bold = true })
hl('ErrorMsg', { fg = colors.error })
hl('WarningMsg', { fg = colors.warning })
hl('ModeMsg', { fg = colors.fg })
hl('MoreMsg', { fg = colors.info })
hl('Question', { fg = colors.info })

-- Syntax highlighting
hl('Comment', { fg = colors.comment, italic = true })
hl('Constant', { fg = colors.constant })
hl('String', { fg = colors.string })
hl('Character', { fg = colors.string })
hl('Number', { fg = colors.number })
hl('Boolean', { fg = colors.constant })
hl('Float', { fg = colors.number })
hl('Identifier', { fg = colors.fg })
hl('Function', { fg = colors.func })
hl('Statement', { fg = colors.keyword })
hl('Conditional', { fg = colors.keyword })
hl('Repeat', { fg = colors.keyword })
hl('Label', { fg = colors.keyword })
hl('Operator', { fg = colors.operator })
hl('Keyword', { fg = colors.keyword })
hl('Exception', { fg = colors.keyword })
hl('PreProc', { fg = colors.keyword })
hl('Include', { fg = colors.keyword })
hl('Define', { fg = colors.keyword })
hl('Macro', { fg = colors.keyword })
hl('PreCondit', { fg = colors.keyword })
hl('Type', { fg = colors.type })
hl('StorageClass', { fg = colors.keyword })
hl('Structure', { fg = colors.type })
hl('Typedef', { fg = colors.type })
hl('Special', { fg = colors.special })
hl('SpecialChar', { fg = colors.special })
hl('Tag', { fg = colors.func })
hl('Delimiter', { fg = colors.special })
hl('SpecialComment', { fg = colors.comment })
hl('Debug', { fg = colors.warning })
hl('Underlined', { underline = true })
hl('Ignore', { fg = colors.bg })
hl('Error', { fg = colors.error })
hl('Todo', { fg = colors.bg, bg = colors.warning, bold = true })

-- Treesitter
hl('@variable', { fg = colors.fg })
hl('@variable.builtin', { fg = colors.constant })
hl('@variable.parameter', { fg = colors.fg })
hl('@variable.member', { fg = colors.fg })
hl('@constant', { fg = colors.constant })
hl('@constant.builtin', { fg = colors.constant })
hl('@constant.macro', { fg = colors.constant })
hl('@module', { fg = colors.type })
hl('@label', { fg = colors.keyword })
hl('@string', { fg = colors.string })
hl('@string.escape', { fg = colors.special })
hl('@string.special', { fg = colors.special })
hl('@character', { fg = colors.string })
hl('@character.special', { fg = colors.special })
hl('@boolean', { fg = colors.constant })
hl('@number', { fg = colors.number })
hl('@number.float', { fg = colors.number })
hl('@type', { fg = colors.type })
hl('@type.builtin', { fg = colors.type })
hl('@type.definition', { fg = colors.type })
hl('@attribute', { fg = colors.func })
hl('@property', { fg = colors.fg })
hl('@function', { fg = colors.func })
hl('@function.builtin', { fg = colors.func })
hl('@function.call', { fg = colors.func })
hl('@function.macro', { fg = colors.func })
hl('@function.method', { fg = colors.func })
hl('@function.method.call', { fg = colors.func })
hl('@constructor', { fg = colors.func })
hl('@operator', { fg = colors.operator })
hl('@keyword', { fg = colors.keyword })
hl('@keyword.modifier', { fg = colors.keyword })
hl('@keyword.type', { fg = colors.keyword })
hl('@keyword.coroutine', { fg = colors.keyword })
hl('@keyword.function', { fg = colors.keyword })
hl('@keyword.operator', { fg = colors.keyword })
hl('@keyword.import', { fg = colors.keyword })
hl('@keyword.repeat', { fg = colors.keyword })
hl('@keyword.return', { fg = colors.keyword })
hl('@keyword.conditional', { fg = colors.keyword })
hl('@keyword.exception', { fg = colors.keyword })
hl('@punctuation.delimiter', { fg = colors.special })
hl('@punctuation.bracket', { fg = colors.special })
hl('@punctuation.special', { fg = colors.special })
hl('@comment', { fg = colors.comment, italic = true })
hl('@comment.error', { fg = colors.error })
hl('@comment.warning', { fg = colors.warning })
hl('@comment.todo', { fg = colors.bg, bg = colors.warning })
hl('@comment.note', { fg = colors.info })
hl('@tag', { fg = colors.func })
hl('@tag.attribute', { fg = colors.type })
hl('@tag.delimiter', { fg = colors.special })

-- Diagnostics
hl('DiagnosticError', { fg = colors.error })
hl('DiagnosticWarn', { fg = colors.warning })
hl('DiagnosticInfo', { fg = colors.info })
hl('DiagnosticHint', { fg = colors.hint })
hl('DiagnosticUnderlineError', { undercurl = true, sp = colors.error })
hl('DiagnosticUnderlineWarn', { undercurl = true, sp = colors.warning })
hl('DiagnosticUnderlineInfo', { undercurl = true, sp = colors.info })
hl('DiagnosticUnderlineHint', { undercurl = true, sp = colors.hint })

-- Git signs
hl('GitSignsAdd', { fg = colors.info })
hl('GitSignsChange', { fg = colors.warning })
hl('GitSignsDelete', { fg = colors.error })

-- Diff
hl('DiffAdd', { bg = '#2a3a2a' })
hl('DiffChange', { bg = '#3a3a2a' })
hl('DiffDelete', { bg = '#3a2a2a' })
hl('DiffText', { bg = '#4a4a3a' })

-- Telescope
hl('TelescopeBorder', { fg = colors.fg_dim })
hl('TelescopePromptBorder', { fg = colors.fg_dim })
hl('TelescopeResultsBorder', { fg = colors.fg_dim })
hl('TelescopePreviewBorder', { fg = colors.fg_dim })
hl('TelescopeSelection', { bg = colors.selection })
hl('TelescopeMatching', { fg = colors.func, bold = true })

-- NvimTree
hl('NvimTreeNormal', { fg = colors.fg, bg = colors.bg_dark })
hl('NvimTreeFolderIcon', { fg = colors.keyword })
hl('NvimTreeFolderName', { fg = colors.keyword })
hl('NvimTreeOpenedFolderName', { fg = colors.keyword })
hl('NvimTreeRootFolder', { fg = colors.func })
hl('NvimTreeSpecialFile', { fg = colors.func })
hl('NvimTreeGitDirty', { fg = colors.warning })
hl('NvimTreeGitNew', { fg = colors.info })
hl('NvimTreeGitDeleted', { fg = colors.error })
