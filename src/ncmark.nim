import parseopt,os
from strutils import parseint

proc printf(formatstr: cstring) {.header: "<stdio.h>", importc: "printf", varargs.}

proc usage() =
  echo """
  ncmark 1.0.0
  Option:
  -h | --help           : show help
  [number]              : specify number
  """
  quit(0)

proc opt_error() =
  echo "Error option"
  quit(1)

proc main*() =
  if paramCount() == 0:
    usage()

  var s: string

  for kind, key, val in getopt():
    case kind
    of cmdArgument:
      s = key
    of cmdLongOption, cmdShortOption:
      case key
      of "help","h":
        usage()
      else:
        opt_error()
    else:
      discard

  # error
  defer: quit(0)

  # loop
  let row = parseint(s)
  if row >= 100:
    echo "Specify a number less than or equal to 100."
    quit(1)
  for i in 1 .. row:
    # space
    for j in i .. row:
      printf(" ")
    # symbol
    for j in 1 .. i:
      printf("\e[35m◢\e[0m")
    printf("\n")

when isMainModule:
  main()
