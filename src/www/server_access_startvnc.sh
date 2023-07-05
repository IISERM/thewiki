if [ -z "$1" ] || [ "$1" -lt 5905 ]
then
    echo "usage: source startvnc.sh port"
    echo "port must be > 5905"
    echo "example: source startvnc.sh 5959"
    return
fi

# conda deactivate # <- uncomment this line if you are auto-activating conda

# create a reverse ssh tunnel to transit
echo "tunnel to transit. Enter transit@123 as password"
ssh -T -N -f -R localhost:$1:localhost:$1 transit@14.139.227.194

echo "Turn on the port forwarding rule from "$1" to "$1" in termius"
read -n 1 -s -r -p "Press any key once done"
echo

echo "Starting vncserver. A lot of output will occur. Dont worry. Connect using VNC Viewer"
read -n 1 -s -r -p "Press any key to continue"
echo

declare -i actual=$1-5900

~/vncserver/libexec/vncserver :$actual
