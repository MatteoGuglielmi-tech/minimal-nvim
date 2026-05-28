-- IntelliJ Darcula color scheme (built-in, reconstructed from IDE source)
local M = {}

M.palette = {
  -- backgrounds
  bg             = "#2b2b2b",
  bg_cursorline  = "#323232",
  bg_float       = "#3c3f41",
  bg_panel       = "#3c3f41",
  bg_visual      = "#214283",
  bg_search      = "#1f4b6e",
  bg_search_cur  = "#385f80",
  bg_match_brace = "#3b514d",
  bg_error       = "#593939",
  bg_write_caret = "#4e3636",
  bg_identifier  = "#3b4252",
  bg_injected    = "#313335",
  bg_doc_code    = "#37393b",

  -- foregrounds
  fg             = "#a9b7c6",
  fg_bright      = "#cdd3de",
  fg_dim         = "#777b80",
  fg_muted       = "#919194",
  fg_inlay       = "#787878",

  -- editor chrome
  linenr         = "#606366",
  linenr_active  = "#a4a3a3",
  indent         = "#3d3f41",
  indent_active  = "#505355",
  border         = "#4b4f52",
  separator      = "#4b4f52",
  cursor         = "#bbbbbb",

  -- syntax
  keyword        = "#cc7832",
  string         = "#6a8759",
  string_escape  = "#cc7832",
  number         = "#6897bb",
  func           = "#ffc66d",
  method         = "#ffc66d",
  field          = "#9876aa",
  constant       = "#9876aa",
  annotation     = "#bbb529",
  type_param     = "#20999d",
  tag            = "#e8bf6a",
  regexp         = "#6a8759",
  comment        = "#808080",
  doc_comment    = "#629755",
  doc_tag        = "#629755",
  doc_tag_val    = "#77b767",

  -- links / interactive
  link           = "#287bde",
  link_visited   = "#9876aa",
  template_var   = "#9876aa",

  -- diagnostics / special
  todo           = "#bbb529",
  error_fg       = "#cf5b56",
  error_underline = "#cf5b56",
  warn_fg        = "#e5c07b",
  info_fg        = "#6897bb",
  notification   = "#1d3e5c",

  -- git / diff
  git_add        = "#629755",
  git_change     = "#4c5a8a",
  git_delete     = "#656565",
  git_add_file   = "#629755",
  git_mod_file   = "#6897bb",
  git_del_file   = "#656565",
  git_ignored    = "#a0a0a0",

  -- terminal ANSI 0-15
  t0  = "#2b2b2b", t8  = "#555555",
  t1  = "#cf5b56", t9  = "#e05c5c",
  t2  = "#629755", t10 = "#72b065",
  t3  = "#bbb529", t11 = "#e5c07b",
  t4  = "#4c6fa5", t12 = "#6897bb",
  t5  = "#9876aa", t13 = "#c792ea",
  t6  = "#20999d", t14 = "#56b6c2",
  t7  = "#a9b7c6", t15 = "#cdd3de",
}

return M
