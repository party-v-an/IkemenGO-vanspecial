# Raw ass lobbies
## Setup instructions
* Grab the updater from the sidebar on the right
* Extract it to an empty folder
* Run the .bat (on Windows) or .sh (on Linux) file

## Playing online
* Set up a VPN account at https://madhammer.club/povertyvpn/ (unless you wanna forward ports on your router and give out your IP address to people)
* Once you've downloaded the software and got it running open a command prompt, type "ipconfig" and hit enter. Look for the adapter called "nebula1" and write down the IP address somewhere; this won't change unless you create a new config.
  * If you're on Linux do the same thing except instead of "ipconfig" type "ip a". You don't need the /24 part, just the IP address.
* Start the game and go into the Network menu. One player must be the host and the other joins them. **You need to do it in that order**, if you get stuck have the joining player try again.
* Once the connection has been established you should be able to start a game with the other player.
## A note about settings
Ikemen requires both players have the exact same installation or else the game will desync. Most settings in the option menu can be changed without issue (e.g. input or audio settings), so here's a list of things that can't be changed without causing desyncs:
* Anything under the game or engine settings
* Setting the video resolution to a non-4:3 aspect ratio
* Anything involving the motif (character select, lifebars, etc)
* Pretty much anything in config.ini you can't change via the in-game settings (e.g. framerate)
If you changed something and are now desyncing every match, use reset.bat to restore your installation back to default.