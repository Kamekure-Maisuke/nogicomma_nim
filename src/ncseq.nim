import parseopt,os
from strutils import parseint

proc usage() =
  echo """
  ncseq 1.0.0
  Option:
  -h | --help     : show help
  -v | --version  : show version
  [number]        : specify number
  """
  quit(0)

proc version() =
  echo "ncseq 1.0.0"
  quit(0)

proc opt_error() =
  echo "Error option"
  quit(1)

proc main*() =
  if paramCount() == 0:
    usage()

  var s: string

  # parse option
  for kind, key, val in getopt():
    case kind
    of cmdArgument:
      s = key
    of cmdLongOption, cmdShortOption:
      case key
      of "help", "h":
        usage()
      of "version", "v":
        version()
      else:
        opt_error()
    else:
      discard

  # error
  defer: quit(0)

  # loop
  let res = parseint(s)
  for i in 1 .. res:
    echo "\e[35m◢\e[0m"

when isMainModule:
  main()
