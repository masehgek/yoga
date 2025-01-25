pkg update -y
pkg upgrade -y
termux-wake-lock
pkg install libjansson nano git
git clone https://github.com/zikyu7/ccminer
cd ccminer
clear
chmod +x ccminer start.sh
rm -rf config.json
cat > config.json << EOF
{
        "pools":[
        {
                "name": "luckpool.net",
        "url": "stratum+tcp://ap.luckpool.net:3956",
                "timeout": 150,
                "disabled": 0
        },
        {
                "name": "luckpool.net 60",
        "url": "stratum+tcp://ap.luckpool.net:3960",
                "timeout": 60,
                "time-limit": 600,
                "disabled": 0
        }],

        "user": "RMVTm5z1S5eBLn5fYKB7QxpiEY1C5Xaub6",
        "algo": "verus",
        "threads": 8,
        "cpu-priority": 1,
        "retry-pause": 5,
        "api-allow": "192.168.0.0/16",
        "api-bind": "0.0.0.0:4068"
}
EOF
clear
./start.sh >> ~/miner.log 2>&1
