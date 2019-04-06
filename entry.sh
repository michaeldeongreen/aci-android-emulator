#/bin/bash

# output docker supervisord logs and use tail to view logs for troubleshooting
/usr/bin/supervisord > /tmp/svd.log 2>&1 &
# tail /tmp/svd.log

# make .android directory and create repositories.cfg file to suppress file not exist warning
mkdir -p /root/.android
touch /root/.android/repositories.cfg

# install android emulator platform tools
sdkmanager "platform-tools" "platforms;android-24" "emulator"
# install android emulator system images
sdkmanager "system-images;android-24;default;armeabi-v7a"
# use android virtual device manager to create test virtual device
echo no | avdmanager create avd -n emuTest -k "system-images;android-24;default;armeabi-v7a"

# echo progress
echo Launching the emulator
# launch android emulator
emulator -avd emuTest -noaudio -no-boot-anim -gpu off

