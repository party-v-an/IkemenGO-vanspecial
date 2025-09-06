# Raw ass lobbies
## Setup instructions
### The easy way
* Click the big green Code button and download ZIP
* Extract it wherever
* Note that you'll have to re-download the entire thing whenever an update happens so you might want to consider...
### The hard way
* Download [Git for Windows](https://git-scm.com/downloads/win) and install it, you'll need this to be able to update. Keep most of the options set to default except the bahavior of "git pull", change that to "Only ever fast-forward".
** Linux users probably have this installed already, but if not use your distro's package manager (apt-get, pacman, etc.)
* Open a command line somewhere and type "git clone https://github.com/party-v-an/IkemenGO-vanspecial.git" to download everything
* Once it's downloaded you can use the update.bat file to download updates. If something goes wrong use reset.bat to reset the game to its default state.

## Playing online
**DO NOT MAKE ANY CHANGES TO THE SETTINGS!** Both players must have the _exact same installation_ to play against each other. The only things you can safely change are the audio and input settings.
If you start desyncing every match, reset your installation to default.
* Set up a VPN account at https://madhammer.club/povertyvpn/ (unless you wanna forward ports on your router and give out your IP address to people)
* Once you've downloaded the software and got it running open a command prompt, type "ipconfig" and hit enter. Look for the adapter called "nebula1" and write down the IP address somewhere; this won't change unless you create a new config.
** If you're on Linux do the same thing except instead of "ipconfig" type "ip a". You don't need the /24 part, just the IP address.
* Start the game and go into the Network menu. One player must be the host and the other joins them. **You need to do it in that order**, if you get stuck have the joining player try again.
* Once the connection has been established you should be able to start a game with the other player.
