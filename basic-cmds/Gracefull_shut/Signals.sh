#bin/bash
trap UserSig1 SIGUSR1
trap Term SIGTERM
#trap Term SIGKILL
echo "testing signals"
echo $$
function UserSig1(){
  echo "Received USRSIG1"
}
function Term() {
  echo "received SIGTERM . willbe terminating "
}


while true
do
   echo "waiting for signals"
   sleep 10
done