# homebrew-autokbisw

This is a homebrew formula to install Jean Helou's autokbisw (automatic keyboard input source switcher), 
including pointing to a bottle I've compiled for M1 ARM64 macs running Big Sur. 


## installation
tap this repo:

`brew tap terileptil/autokbisw`

then install:

`brew install autokbisw`

## post installation
You may need to manually add the binary to the 'Input Monitoring' section in the Security & Privacy control panel before it will start working.
For M1 homebrew installations, this will probably be found at `/opt/homebrew/Cellar/autokbisw/1.2.0/bin/autokbisw`
