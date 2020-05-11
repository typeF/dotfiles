" [onedark.vim](https://github.com/joshdick/onedark.vim/)

let s:overrides = get(g:, "onedark_color_overrides", {})

let s:colors = {
      \ "exp": get(s:overrides, "exp", { "gui": "#A987FF", "cterm": "204", "cterm16": "1" }),
      \ "black": get(s:overrides, "black", { "gui": "#282C34", "cterm": "235", "cterm16": "0" }),
      \ "blue": get(s:overrides, "blue", { "gui": "#66AFFF", "cterm": "39", "cterm16": "4" }),
      \ "brick_red": get(s:overrides, "brick_red", { "gui": "#F07178", "cterm": "204", "cterm16": "1" }),
      \ "cyan": get(s:overrides, "cyan", { "gui": "#56B6C2", "cterm": "38", "cterm16": "6" }),
      \ "dark_red": get(s:overrides, "dark_red", { "gui": "#D3593F", "cterm": "196", "cterm16": "9" }),
      \ "dark_yellow": get(s:overrides, "dark_yellow", { "gui": "#CCA051", "cterm": "173", "cterm16": "11" }),
      \ "darker_purple": get(s:overrides, "darker_purple", { "gui": "#8755FF", "cterm": "170", "cterm16": "5" }),
      \ "green": get(s:overrides, "green", { "gui": "#AEDD77", "cterm": "114", "cterm16": "2" }),
      \ "grey": get(s:overrides, "grey", { "gui": "#959DCB", "cterm": "235", "cterm16": "0" }),
      \ "grey_blue": get(s:overrides, "grey_blue", { "gui": "#B2CCD6", "cterm": "235", "cterm16": "0" }),
      \ "indigo": get(s:overrides, "indigo", { "gui": "#00416A", "cterm": "114", "cterm16": "2" }),
      \ "light_purple": get(s:overrides, "light_purple", { "gui": "#7A7CD3", "cterm": "170", "cterm16": "5" }),
      \ "mint_green": get(s:overrides, "mint_green", { "gui": "#6DB98B", "cterm": "114", "cterm16": "2" }),
      \ "orange": get(s:overrides, "orange", { "gui": "#F78C6C", "cterm": "39", "cterm16": "4" }),
      \ "pink": get(s:overrides, "pink", { "gui": "#FF5BCB", "cterm": "196", "cterm16": "9" }),
      \ "purple": get(s:overrides, "purple", { "gui": "#A27CFF", "cterm": "170", "cterm16": "5" }),
      \ "red": get(s:overrides, "red", { "gui": "#F4516F", "cterm": "204", "cterm16": "1" }),
      \ "sky_blue": get(s:overrides, "sky_blue", { "gui": "#81DBFF", "cterm": "39", "cterm16": "4" }),
      \ "watermelon": get(s:overrides, "watermelon", { "gui": "#81DBFF", "cterm": "39", "cterm16": "4" }),
      \ "white": get(s:overrides, "white", { "gui": "#E9E8EF", "cterm": "145", "cterm16": "7" }),
      \ "yellow": get(s:overrides, "yellow", { "gui": "#FFCB6B", "cterm": "180", "cterm16": "3" }),
      \ "visual_black": get(s:overrides, "visual_black", { "gui": "NONE", "cterm": "NONE", "cterm16": "0" }),
      \ "comment_grey": get(s:overrides, "comment_grey", { "gui": "#AD9C9C", "cterm": "59", "cterm16": "15" }),
      \ "gutter_fg_grey": get(s:overrides, "gutter_fg_grey", { "gui": "#4B5263", "cterm": "238", "cterm16": "15" }),
      \ "cursor_grey": get(s:overrides, "cursor_grey", { "gui": "#2C323C", "cterm": "236", "cterm16": "8" }),
      \ "visual_grey": get(s:overrides, "visual_grey", { "gui": "#5B3268", "cterm": "237", "cterm16": "15" }),
      \ "menu_grey": get(s:overrides, "menu_grey", { "gui": "#3E4452", "cterm": "237", "cterm16": "8" }),
      \ "special_grey": get(s:overrides, "special_grey", { "gui": "#3B4048", "cterm": "238", "cterm16": "15" }),
      \ "vertsplit": get(s:overrides, "vertsplit", { "gui": "#181A1F", "cterm": "59", "cterm16": "15" }),
      \ "parens": get(s:overrides, "parens", { "gui": "#959DCB", "cterm": "59", "cterm16": "15" }),
      \ "brackets": get(s:overrides, "brackets", { "gui": "#959DCB", "cterm": "59", "cterm16": "15" }),
      \ "braces": get(s:overrides, "braces", { "gui": "#72CC94", "cterm": "59", "cterm16": "15" }),
      \ "punctuation": get(s:overrides, "punctuation", { "gui": "#72CC94", "cterm": "59", "cterm16": "15" }),
      \ "numbers": get(s:overrides, "numbers", { "gui": "#F07178", "cterm": "59", "cterm16": "15" }),
      \ "operator": get(s:overrides, "operator", { "gui": "#B77DED", "cterm": "59", "cterm16": "15" }),
      \ "arguments": get(s:overrides, "arguments", { "gui": "#F07178", "cterm": "59", "cterm16": "15" }),
      \ "objkey": get(s:overrides, "objkey", { "gui": "#B1B2E6", "cterm": "59", "cterm16": "15" }),
      \ "htmlTag": get(s:overrides, "htmlTag", { "gui": "#EC7178", "cterm": "59", "cterm16": "15" }),
      \ "htmlTagDark": get(s:overrides, "htmlTagDark", { "gui": "#568FD8", "cterm": "59", "cterm16": "15" }),
      \ "htmlAccent": get(s:overrides, "htmlAccent", { "gui": "#F654DD", "cterm": "59", "cterm16": "15" }),
      \}

function! onedark#GetColors()
  return s:colors
endfunction
