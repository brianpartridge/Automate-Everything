#!/bin/bash
# This script boots a VM to the the specified snapshot, opens a URL, and takes a screenshot before shutting down the VM. The resulting screenshot is then opened in Preview.
# Supplying proper guest OS credentials is required to perform any operations against the guest OS.
# Setting HEADLESS to 1 will run without displaying the VM screen in a window.
# NOTE: Waiting for the guest OS to boot is a bit of a hack.  Here, the VM is preconfigured to open Safari as a Login Item.  The script polls the VM until it sees that Safari is running before performing other actions.

# Config
FUSION_PATH="/Applications/VMware Fusion.app"
VMPATH="/Users/brian/Downloads/Mac OS X 10.7 64-bit.vmwarevm"
TARGET_SNAPSHOT="Setup For Testing"
OUTPUT_PATH="/Users/brian/Desktop/Screenshots/screenshot.png"
GUEST_TARGET_PROCESS="Safari"
GUEST_USER="brian"
GUEST_PASS="brian"
HEADLESS=false

#####################

export PATH="$PATH:$FUSION_PATH/Contents/Library"

echo "Scripting OSX VM:"

GUEST_AUTH="-gu $GUEST_USER -gp $GUEST_PASS"

open $FUSION_PATH

# Boot into desired VM state
FOUND_SNAPSHOT=`vmrun listSnapshots "$VMPATH" | grep "$TARGET_SNAPSHOT"`
if [ ! $"FOUND_SNAPSHOT" ]; then
  echo "Error: Desired snapshot '$TARGET_SNAPSHOT' not found."
  exit 1
fi

echo " - Reverting VM to '$TARGET_SNAPSHOT'"
vmrun revertToSnapshot "$VMPATH" "$TARGET_SNAPSHOT"
echo " - Starting VM"
GUI_OPTION=""
if $HEADLESS ; then
  GUI_OPTION="nogui"
fi
vmrun $GUEST_AUTH start "$VMPATH" $GUI_OPTION

echo " - Waiting for guest OS to boot..."
FOUND_GUEST_PROCESS=`vmrun $GUEST_AUTH listProcessesInGuest "$VMPATH" | grep "$GUEST_TARGET_PROCESS"`
until [ "$FOUND_GUEST_PROCESS" ]; do
  sleep 2
  FOUND_GUEST_PROCESS=`vmrun $GUEST_AUTH listProcessesInGuest "$VMPATH" | grep "$GUEST_TARGET_PROCESS"`
done
echo " - Successfully booted"

# Perform actions
echo " - Performing actions"
vmrun $GUEST_AUTH runScriptInGuest "$VMPATH" "/bin/bash" "open http://360idev.com"
sleep 20  # Wait for page to load
vmrun $GUEST_AUTH captureScreen "$VMPATH" "$OUTPUT_PATH"

# Clean up
echo " - Cleaning up"
vmrun $GUEST_AUTH stop "$VMPATH" hard
vmrun revertToSnapshot "$VMPATH" "$TARGET_SNAPSHOT"

# Display results
open "$OUTPUT_PATH"

echo "Done"