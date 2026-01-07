" Vim syntax file
" Language: SYN-C
" Maintainer: Gemini
" Latest Revision: 2025

if exists("b:current_syntax")
  finish
endif

" 1. Define Keywords first (lowest priority)
syntax keyword syncConditional IF ELIF ELSE ENDIF
syntax keyword syncRepeat      WHILE ENDWHILE FOR ENDFOR
syntax keyword syncStatement   RETURN BREAK CONTINUE
syntax keyword syncStructure   STRUCT ENDSTRUCT GLOBALS ENDGLOBALS
syntax keyword syncDefine      FUNCTION END
syntax keyword syncConstant    TRUE FALSE NULL

" Built-in Functions
syntax keyword syncBuiltinFunc MALLOC MALLOC_STRUCT FREE
syntax keyword syncBuiltinFunc PRINT PRINTERR FLUSH FLUSHERR READ
syntax keyword syncBuiltinFunc ELEMENTARY_OPERATIONS
syntax keyword syncBuiltinFunc FABS COS SIN TAN SQRT EXP LN POW
syntax keyword syncBuiltinFunc CH SH TH CEIL FLOOR ROUND IABS
syntax keyword syncBuiltinFunc RAND SRAND
syntax keyword syncBuiltinFunc I2F I2S F2I F2S S2I S2F V2B

" 2. Matches for Specific Types
" Function Names (Highlight 'my_func' in 'FUNCTION my_func')
syntax match syncFuncName  "\%(FUNCTION\s\+\)\@<=[a-z][a-zA-Z0-9_]*"
" Struct Names
syntax match syncStructName "\%(STRUCT\s\+\)\@<=[a-z][a-zA-Z0-9_]*"
syntax match syncStructName "\%(MALLOC_STRUCT(\s*\)\@<=[a-z][a-zA-Z0-9_]*"

" 3. Numbers & Operators
" Integers
syntax match syncNumber    "\<\d\+\>"
" Floats
syntax match syncFloat     "\<\d\+\.\d*\>"
syntax match syncFloat     "\<\.\d\+\>"
syntax match syncFloat     "\<\d\+[eE][-+]\=\d\+\>"

" Operators
syntax match syncOperator  "[-+*/%=]"
syntax match syncOperator  "[-+*/]\."
syntax match syncOperator  "==\|!=\|<\|>\|<=\|>="
syntax match syncOperator  "[<>]=\?\."
syntax keyword syncOperator AND OR NOT
syntax match syncOperator  "&\|\$\|->"

" 4. Strings & Comments (HIGHEST PRIORITY - Define these last!)
" Characters
syntax match syncChar      "'.'"
syntax match syncChar      "'\\.'"

" Strings
syntax region syncString   start=+"+ skip=+\\"+ end=+"+

" Comments
" We use 'syntax region' for better stability. 
" By placing this last, it overrides the '/' operator match.
syntax region syncComment  start="//" end="$"
syntax region syncComment  start="/\*" end="\*/"

" --- Linking ---
highlight link syncConditional Conditional
highlight link syncRepeat      Repeat
highlight link syncStatement   Statement
highlight link syncStructure   Structure
highlight link syncDefine      Define
highlight link syncConstant    Boolean
highlight link syncBuiltinFunc Function
highlight link syncComment     Comment
highlight link syncString      String
highlight link syncChar        Character
highlight link syncNumber      Number
highlight link syncFloat       Float
highlight link syncOperator    Operator
highlight link syncFuncName    Function
highlight link syncStructName  Type

let b:current_syntax = "sync"
