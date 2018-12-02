PID="0"

function exhibit_handler(){
#  echo "exhibit_handler [$@]!"
#  ps f
  if [[ "$PID" != 0 ]]; then
    kill -- "${PID}" >/dev/null 2>&1
    PID="0"
  fi

  trap - SIGTERM
##  kill -- -$BASHPID >/dev/null 2>&1
##  kill -- -$$ >/dev/null 2>&1
##  kill 0 >/dev/null 2>&1
#  ps f
#  echo "....exhibit_handler!"
#  exit
}

for sig in INT TERM QUIT EXIT; do
  eval "trap 'exhibit_handler ${sig}' $sig"
done

#trap "trap - SIGTERM && kill -- -$$ >/dev/null 2>&1" SIGINT SIGTERM EXIT
