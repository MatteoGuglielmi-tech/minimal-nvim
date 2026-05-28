-- Exact hex values from Islands_Dark.icls (IntelliJ 2026.1.2)
-- Inherits: parent_scheme="Darcula"

local M = {}

M.palette = {
  -- backgrounds
  bg             = "#191a1c",  -- TEXT BACKGROUND / CONSOLE_BACKGROUND_KEY
  bg_cursorline  = "#1f2024",  -- CARET_ROW_COLOR
  bg_float       = "#27282b",  -- DOCUMENTATION_COLOR / LOOKUP_COLOR
  bg_panel       = "#2b2d30",  -- DIFF_SEPARATORS_BACKGROUND / RECENT_LOCATIONS
  bg_visual      = "#214283",  -- SELECTION_BACKGROUND (inherited from Darcula)
  bg_search      = "#2d543f",  -- SEARCH_RESULT_ATTRIBUTES
  bg_search_cur  = "#114957",  -- TEXT_SEARCH_RESULT_ATTRIBUTES
  bg_match_brace = "#43454a",  -- MATCHED_BRACE_ATTRIBUTES
  bg_error       = "#402929",  -- ERROR_HINT
  bg_write_caret = "#402f33",  -- WRITE_IDENTIFIER_UNDER_CARET
  bg_identifier  = "#373b39",  -- IDENTIFIER_UNDER_CARET
  bg_injected    = "#293c40",  -- INJECTED_LANGUAGE_FRAGMENT
  bg_doc_code    = "#343539",  -- DOC_CODE_INLINE

  -- foregrounds
  fg             = "#b2b4ba",  -- TEXT FOREGROUND / DEFAULT_IDENTIFIER
  fg_bright      = "#c8cad0",  -- CARET_COLOR / ANNOTATIONS_LAST_COMMIT
  fg_dim         = "#848890",  -- WHITESPACES / NOT_USED_ELEMENT / BREADCRUMBS_INACTIVE
  fg_muted       = "#9da0a8",  -- BREADCRUMBS_DEFAULT / LIVE_TEMPLATE_INACTIVE
  fg_inlay       = "#868a91",  -- INLAY_DEFAULT fg / ANNOTATIONS_COLOR

  -- editor chrome
  linenr         = "#4b5059",  -- LINE_NUMBERS_COLOR
  linenr_active  = "#a1a3ab",  -- LINE_NUMBER_ON_CARET_ROW_COLOR
  indent         = "#323438",  -- INDENT_GUIDE
  indent_active  = "#4e5157",  -- SELECTED_INDENT_GUIDE / MATCHED_BRACES_INDENT_GUIDE
  border         = "#393b40",  -- HINT_BORDER / INLAY bg / FOLDED_TEXT_BORDER
  separator      = "#43454a",  -- METHOD_SEPARATORS_COLOR
  cursor         = "#ced0d6",  -- CARET_COLOR

  -- syntax
  keyword        = "#cf8e6d",  -- DEFAULT_KEYWORD
  string         = "#6aab73",  -- DEFAULT_STRING
  string_escape  = "#cf8e6d",  -- DEFAULT_VALID_STRING_ESCAPE
  number         = "#2aacb8",  -- DEFAULT_NUMBER
  func           = "#56a8f5",  -- DEFAULT_FUNCTION_DECLARATION / CSS.COLOR
  method         = "#57aaf7",  -- DEFAULT_INSTANCE_METHOD / DEFAULT_STATIC_METHOD
  field          = "#c77dbb",  -- DEFAULT_INSTANCE_FIELD / DEFAULT_STATIC_FIELD
  constant       = "#c77dbb",  -- DEFAULT_CONSTANT
  annotation     = "#b3ae60",  -- DEFAULT_METADATA
  type_param     = "#16baac",  -- TYPE_PARAMETER_NAME_ATTRIBUTES
  tag            = "#d5b778",  -- HTML_TAG / XML_TAG
  regexp         = "#42c3d4",  -- JS.REGEXP
  comment        = "#7a7e85",  -- DEFAULT_LINE_COMMENT / DEFAULT_BLOCK_COMMENT
  doc_comment    = "#5f826b",  -- DEFAULT_DOC_COMMENT
  doc_tag        = "#67a37c",  -- DEFAULT_DOC_COMMENT_TAG
  doc_tag_val    = "#abadb3",  -- DEFAULT_DOC_COMMENT_TAG_VALUE

  -- links / interactive
  link           = "#548af7",  -- HYPERLINK_ATTRIBUTES
  link_visited   = "#b189f5",  -- FOLLOWED_HYPERLINK_ATTRIBUTES
  template_var   = "#b189f5",  -- TEMPLATE_VARIABLE_ATTRIBUTES

  -- diagnostics / special
  todo           = "#8bb33d",  -- TODO_DEFAULT_ATTRIBUTES
  error_fg       = "#f75464",  -- BAD_CHARACTER / WRONG_REFERENCES / LOG_ERROR
  error_underline = "#fa6675", -- ERRORS_ATTRIBUTES effect
  warn_fg        = "#f2c55c",  -- WARNING_ATTRIBUTES / RUNTIME_ERROR
  info_fg        = "#857042",  -- INFO_ATTRIBUTES effect
  notification   = "#25324d",  -- NOTIFICATION_BACKGROUND

  -- git / diff
  git_add        = "#549159",  -- ADDED_LINES_COLOR
  git_change     = "#375fad",  -- MODIFIED_LINES_COLOR
  git_delete     = "#868a91",  -- DELETED_LINES_COLOR
  git_add_file   = "#73bd79",  -- FILESTATUS_ADDED
  git_mod_file   = "#70aeff",  -- FILESTATUS_MODIFIED
  git_del_file   = "#6f737a",  -- FILESTATUS_DELETED

  -- terminal ANSI 0-15
  t0  = "#1e1f22", t8  = "#3c3f41",
  t1  = "#f75464", t9  = "#fa6675",
  t2  = "#549159", t10 = "#6aab73",
  t3  = "#b3ae60", t11 = "#f2c55c",
  t4  = "#375fad", t12 = "#56a8f5",
  t5  = "#c77dbb", t13 = "#b189f5",
  t6  = "#2aacb8", t14 = "#16baac",
  t7  = "#bcbec4", t15 = "#ced0d6",
}

return M
