declare -a listDevices
let i=0

while read line; do 
    if [[ $line != *"List of devices attached"* ]]; then
    echo "$i - $line"
        listDevices[i]="$line"
        let i=$i+1
    fi
done < <(adb devices)

read -p "Choose a device: " position

device=${listDevices[position]}
device="${device/device/""}" #remove device in string
echo $device

adb -s ${device} logcat | grep "ReactNative"