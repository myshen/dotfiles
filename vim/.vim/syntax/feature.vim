" Cucumber feature syntax file
if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword featureKeyword Feature Scenario Outline Scenarios
syn keyword featureHoareTag Given When Then And But
syn keyword featureTodo TODO FIXME NOTE XXX contained
syn match featureTableHeader display contained "\(<\w\+>\)"
syn match featureComment "#.*" contains=featureTodo
syn match featureTag "@.*"
syn region featureString start="\"" end="\"" skip="\\\\\|\\\"" contains=@featureTableHeader
"syn region featureDataTable start="|" end="|\s\*\($|#\)"

if version < 508
  command -nargs=+ HiLink hi link <args>
else
  command -nargs=+ HiLink hi def link <args>
endif

HiLink featureKeyword     Define
HiLink featureHoareTag    Type
HiLink featureTodo        Todo
HiLink featureTableHeader Special
HiLink featureComment     Comment
"HiLink featureDataTable   String
HiLink featureString      String
HiLink featureTag         Tag


delcommand HiLink
let b:current_syntax = "feature"
