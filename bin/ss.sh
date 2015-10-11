# https://www.reddit.com/r/sysadmin/comments/356tub/handy_functions_for_your_bashrc/cr21pov
function ss() {
  # the standard 'ss' output is horrible. we can
  # make it more readable by piping to `column`
  column -t < <(ss $@)
}
