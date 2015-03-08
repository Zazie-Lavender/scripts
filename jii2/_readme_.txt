
===================================
HELP FILE FOR THE ip2country SCRIPT
      02 / Nov / 2011
===================================

This is a mIRC Addon Script for mIRC 6.01+
It quickly (less than 0.01 sec) gives a country name from an IP

DOWNLOAD FILE NAME: ip2country.ver.1.06.zip

IF YOU ARE [*** UPGRADING ***] - PLEASE read the section titled [*** UPGRADING ***] - please read this carefully, specially the last item.
For "What's new" scroll to the bottom and read: Changes from Version 1.05 to 1.06 (Released 02 Nov 2011)

[*** NEW INSTALL ***]

1) Unzip the file: ip2country.ver.1.06.zip
   3 Files are needed for the script to run:
     --> ip2country.ver.1.06.mrc
     --> ip2country.txt
     --> ip2country.lookup.ini
 
     * See note 7) below if a 4th file is needed (versions of mIRC < 7

2) Preferably unzip the files to the same folder that has MIRC.EXE
   UNLESS you are on VISTA or Windows7

   In VISTA or Windows7 unzip to the same folder as MIRC.INI
   You can open this folder by typing this line in your status window:
   //run $+(",$nofile($mircini),")

   When unzipping, a new subfolder folder will be created : ip2country
   and there will be 5 files in that ip2country sub folder:
   1: _readme_.txt
   2: ip2country.lookup.ini
   3: ip2country.txt
   4: ip2country.ver.1.06.mrc
   5: ip2c.bmp

   If you are having trouble locating the folder where MIRC.EXE is located, paste this line into your status window:  
   //run $+(",$nofile($mircexe),")
   Then press the enter key, and the folder will open up.

3) LOADING THE SCRIPT - read all No. 3) before doing this.

   Please do ensure REMOTES are on.
   You can check this by typing /remote
   If remotes are off, type /remote on

   a) To Load the script, type this in mIRC (the Status Window is fine):
 
      //load -rs1 $+(",$nofile($mircexe),ip2country\ip2country.ver.1.06.mrc,")

      For VISTA & Windows7 - if in step 2) above you unzipped to the same location where MIRC.INI is located then type:

      //load -rs1 $+(",$nofile($mircini),ip2country\ip2country.ver.1.06.mrc,")

   b) And Click YES to allowing the Initialization Commands.
   c) IMPORTANT NOTE: If you do not click "YES" the script will run but in a terribly limited fashion.
   d) If Remotes are off, you will not see the Initialization Commands request box.

4) SCRIPT NAME:      ip2country
   SCRIPT - FILE NAME: ip2country.ver.1.06.mrc
   Main DATABASE - FILE NAME: ip2country.txt
   Secondary DATABASE - FILE NAME: ip2country.lookup.ini


5) SETUP OPTIONS
   Please check the DEFAULT RECOMENDED settings by
   right clicking in the Status Window, or a Channel, or a Message Window - and choose:

      ip2c / Settings & Options

      BE AWARE THAT - not everything is turned on. 
      It is meant to be this way.
      Only recommended functions are enabed
      Feel free to explore all the options available.

6) IAL (mIRC's Internal Address List)
   If your IAL is off ( check by typing /IAL ) some features won't work.
   What won't work is:
                      a) seeing all the country information of a channel
                      b) right clicking a nick in a channel and seeing their country

7) Note:- The file ip2c.bmp is a small icon file for preloading in the Options & Settings dialog.
   It is included as versions of mIRC 6.35 and lower have a small bug.
   This bug is overcome by already having the icon in place rather than it being auto made by the script. 

8) Any problems, look for Free` or Free`` on Undernet #mIRC
   or use the ip2c Forum: http://ip2c.much.net/


[*** UPGRADING ***] Only
========================
If you are upgrading - this is how to do it.
1) Right click in a Status window and in the popup select: ip2c >> Utilities >> Unload script
2) Confirm that you want to unload the script by clicking: Yes
3) You should see something similar to the following 4 lines:

    ip2c: Thank you for having used ip2country.ver.1.05.mrc
    ip2c: To reload the script, paste in the following line:
    /load -rs1 "D:\mIRC\ip2country\ip2country.ver.1.05.mrc"
    -
    * Unloaded script 'D:\mWin\ip2country\ip2country.ver.1.05.mrc' 

4) Unzip the downloaded file ( ip2country.ver.1.06.zip ) to the same directory you see in those lines, in the case shown above it is D:\mIRC\ip2country\ - Let it OVERWRITE any files already there.

5) Load the new script by changing the (in this case) 1.05 to 1.06 - so from the above example:
   /load -rs1 "D:\mIRC\ip2country\ip2country.ver.1.06.mrc"
   (Remember to use YOUR folder path - the above is an example)

6) Update the new 2nd Level Domains: Rebuilding is done by right clicking and in the menu popup: 
   ip2c >> Settings & Options >> Update Domains >> Rebuild Domains Button
   (2nd level Domains have to be manually updated this way because of the facility of your being able to add your own known 2nd Level Domains (that are stored in the file: ip2country.lookup.personal.ini). Click the help button on that tab for more info on completing this update. 

(END)

;################ INTRODUCTION - ip2country.mrc ###########################################
;#                                                                                        #
;#  This Script is known as: ip2country ( AKA ip2c )                                      #
;#  This script must have 2 additional database files.                                    #
;#  ip2country.txt & ip2country.lookup.ini                                                #
;#                                                                                        #
;#  Version: ver.1.06  -  released on 02 Nov 2011                                         #
;#  (First BETA was v 0.590 released 11 Feb 2005)                                         #
;#  This is an mIRC addon for v6.01+                                                      #
;#                                                                                        #
;#  Written by Free` (#mirc Undernet) starting on 29 Nov 2004                             #
;#  Was written for myself, just for fun, then elaborated on so others could use it.      #
;#                                                                                        #
;#  Email: Free < free@much.net >                                                         #
;#                                                                                        #
;#  WHAT DOES THIS ADDON basically DO?                                                    #
;#  ==================================                                                    #
;#                                                                                        #
;#  ** Returns a COUNTRY name from an IP wherever possible                                #
;#                                                                                        #
;#  ** Example: /ip 222.222.222.222                                                       #
;#     will return -                                                                      #
;#     IP: 222.222.222.222 is from China (CN)                                             #
;#                                                                                        #
;#  The fun part of this script is enabling showing                                       #
;#  the COUNTRY name in the Join & Part message.                                          #
;#                                                                                        #
;#  ================================                                                      #
;#  LOADING THIS FILE INTO mIRC v6.01+                                                    #
;#  ================================                                                      #
;#                                                                                        #
;#  Load this file into your Remotes and ACCEPT the initialization messge                 #
;#                                                                                        #
;#  If you have UNZIPPED the files from a zip file into your mIRC folder (the ideal way   #
;#  to install this script), then loading is as simple as typing (copying and pasting)    #
;#  this line in your Status Window:                                                      #
;#                                                                                        #
;# //load -rs1 $+(",$nofile($mircexe),ip2country\ip2country.ver.1.06.mrc,")               #
;#                                                                                        #
;#  Windows Vista & Windows7 - install in the same directory where mirc.ini is            #
;#  and use this line:                                                                    #
;#                                                                                        #
;# //load -rs1 $+(",$nofile($mircini),ip2country\ip2country.ver.1.06.mrc,")               #
;#                                                                                        #
;#  Otherwise, open the Remote Script Area ( Tools | Script Editor) and                   #
;#  click on File | Load, and find the file ip2country.ver.1.06.mrc                       #
;#                                                                                        #
;#  To work, this script needs TWO (2) other files : ip2country.txt &                     #
;#  ip2country.lookup.ini in the same directory as this script.                           #
;#  The script can be installed anywhere, but it is suggested that                        #
;#  the subdirectory (ip2country) under the mIRC directory be used                        #
;#                                                                                        #
;#  IMPORTANT: If you want to see country names in the JOIN/PART/QUIT messages, and       #
;#             others to be able to get IP to Country information from you by using !ip   #
;#    REMOTES: These have to be ON for all this to work                                   #
;#             To check if your remotes are ON, type this: /remote                        #
;#             If your remotes are OFF, enable them by typing: /remote on                 #
;#                                                                                        #
;#  ESSENTIAL THINGS                                                                      #
;#  ================                                                                      #
;#                                                                                        #
;#  Your Remotes must be ON                                                               #
;#  To check this,      type --> /remote                                                  #
;#  If Remotes are off, type --> /remote on                                               #
;#                                                                                        #
;#  Your Internal Address List (IAL) should be ON                                         #
;#  To check this,      type --> /ial                                                     #
;#  If the IAL is off,  type --> /ial on                                                  #
;#                                                                                        #
;#                                                                                        #
;#  HIGHLIGHTS                                                                            #
;#  ==========                                                                            #
;#                                                                                        #
;#  Shows the:- JOIN / PART messages with the Ccountry name included.                     #
;#            - Country name shown when Query & Chat windows opens up.                    #
;#            - QUIT message with the common channels included.                           #
;#            - WHOIS / WHO / DNS Shows country names                                     #
;#            - Tries as hard as possible to follow user settings in the mirc.ini         #
;#              on how and where the messages are shown.                                  #
;#                                                                                        #
;#  GENERAL FEATURES                                                                      #
;#  ================                                                                      #
;#                                                                                        #
;#  Give a numerical IP - receive back the Country name                                   #
;#  /ip 194.170.1.1 will give the reply in your status window                             #
;#  /ip aaa.bbb.cc will return the Country for cc                                         #
;#                                                                                        #
;#  Allows others to query you by typing !ip 194.170.1.1                                  #
;#  Response place: If in a Query/Chat window will reply them there                       #
;#                  If asked by /notice will reply by notice                              #
;#                  If in a channel will reply in the channel                             #
;#                                                                                        #
;#  Includes: !country XX (Alpha 2 Country codes response)                                #
;#            EX: !country FR = France                                                    #
;#            Right Click Popup quickly shows the Country name                            #
;#            of the Nickname clicked on.                                                 #
;#                                                                                        #
;#  CONFIGURATION                                                                         #
;#  =============                                                                         #
;#  Has a DIALOG that allows to you change most ever key setting                          #
;#  switching ON or OFF what is wanted                                                    #
;#  Has a right Click POPUP menu to set & use some of the features                        #
;#                                                                                        #
;#  Allows the colours of the messages to be changed                                      #
;#  Allows where the /echo messages are displayed to be changed                           #
;#                                                                                        #
;#                                                                                        #
;#  ADVANCED FEATURES                                                                     #
;#  =================                                                                     #
;#  Can be used as an identifier to read the Database only by using                       #
;#  the 2nd Parameter "result" as follows:                                                #
;#           Use --> $ip2c(NUMERIC-IP result)                                             #
;#  Receive back --> $result == N1,N2,CC,Country                                          #
;#  where N1 = $longip(NETBLOCK-START)                                                    #
;#        N2 = $longip(NETBLOCK-END)                                                      #
;#        CC = 2 Letter Country Code                                                      #
;#   Country = Full Country Name                                                          #
;#  Example:       //echo 2 -gs $ip2c(20.1.1.1 result)                                    #
;#  Will return:   332132128,355993887,US,UNITED STATES                                   #
;#                                                                                        #
;#  $ip2c(NON-numeric-IP result) receives back echo of the CC & Full Country Name         #
;#                                                                                        #
;#  $ip2c(IP).properties are:                                                             #
;#           .cc        returns 2 digit country code                                      #
;#           .country   returns Full Country Name                                         #
;#           .cccountry returns CC Country Name                                           #
;#           .netblock returns $longip start-block,finish-block                           #
;#           .result   returns the same as $ip2c(NUMERIC-IP result)                       #
;#                                                                                        #
;#           This last one is useful as it avoids any multiple lookups                    #
;#           $gettok($ip2c(%ip).result,3,44) = CC                                         #
;#           $gettok($ip2c(%ip).result,4-,44) = Full Country Name                         #
;#           $gettok($ip2c(%ip).result,1-2,44) = start-block,end-block                    #
;#                                                                                        #
;#                                                                                        #
;#  - Database Integrity Check routines are available                                     #
;#  - Any IP that is looked for and is not in the database can be                         #
;#    logged to the file: ip2c.ip.not.found.txt (disabled by default)                     #
;#                                                                                        #
;#  PROTECTION FEATURES                                                                   #
;#  ===================                                                                   #
;#                                                                                        #
;#  Be aware there are no flood protection features in this script                        #
;#  Simply use the right click menu to turn OFF                                           #
;#  the auto reply !ip functions                                                          #
;#                                                                                        #
;#  GENERAL INOFRMATION                                                                   #
;#  ===================                                                                   #
;#                                                                                        #
;#  Be aware that the country is not necessarily the place the person using               #
;#  that IP is has come from. It is from where the IP is registered.                      #
;#                                                                                        #
;#  Be aware that the IP Data File - ip2country.txt                                       #
;#  CAN NEVER BE COMPLETELY UP TO DATE.                                                   #
;#                                                                                        #
;#  ---=== HAVE FUN ===---                                                                #
;#                                                                                        #
;#  CREDITS                                                                               #
;#  =======                                                                               #
;#                                                                                        #
;#  This script includes a modified GeoIP database created by MaxMind.                    #
;#  The original database is available from http://maxmind.com/                           #
;#                                                                                        #
;#  To annoying liner (Undernet #mirc) for fantastically speeding the                     #
;#  the search algorithm by an amazing 3x, and for the host2ip alias.                     #
;#  To Mike` (Undernet #mirc) for his always invaluable help.                             #
;#  To Gleb Suhatski http://www.gleb.zerobrains.com/apps.html                             #
;#  for the initial idea of using the database of IPs to Countries.                       #
;#  To Iczelion (UnitedUsers #ebooks) for his patient discussion                          #
;#  on an even faster search algorithm.                                                   #
;#  To Merlin of mirc-support.de for the mirc.ini unleashed file.                         #
;#  To Dutch of #mIRC and www.mirchelp.net for ideas and testing.                         #
;#  To the "helpers" on #mIRCscripting Undernet, speacially jaytea.                       #
;#  To magic in advance for allowing the release of this on mirc.net                      #
;#                                                                                        #
;#  To that one person who continually encouraged me to finish this!                      #
;#                                                                                        #
;#  And last, and most of all, to the person who was the inspiration                      #
;#  to actually refine and "finish" this "releasable" version!                            #
;#                                                                                        #
;##########################################################################################




Version 1.0 Released 18 September 2010


Changes from Version 1.0 to 1.01 (Released 19 September 2010)

1. Updated ALIAS ip2c.verify.ip.hidden - to include some other Network hidden IP strings
2. Added ALIAS ip2c.IPv4.IPv6 to check if an IP is ipv4 or ipv6
3. Updated ALIAS ip2c.channel.info to ensure first line written in the Display all nicks country details custom window is the channel name - 
   so that popups can find the channel name easily when the IAL is not full.
4. Fixed popup in Display all nicks country details custom window popup not removing @ + % tags when doing /whois & similar.
5. Updated ip2country.lookup.ini with more 2nd Level Domains. To use these, you will have to delete your ip2country.lookup.personal.ini file.


Changes from Version 1.01 to 1.02 (Released 20 Sept 2010)

1. Fixed the TAB stops difference in versions 6.35 and below for Display all nicks country details in the custom window: @ip2c.#*
2. Reworked  ALIAS ip2c.ial.check to properly catch BOTS with different USER@ but the same @HOST for use in Display all nicks country details 
3. Modified ALIAS ip2c.lookup.LOOKUP.hash to allow A1 and A2 country codes for Anonymous Proxy & Satellite Provider respectively.
4. Cosmetic change in the * Join: & Part: channel display where the colon was getting a space before it due to unexpected $+ parsing by mIRC
5. Added XXX does not match any country - echo message - to the /country Alias - as it was better than giving no response at all.


Changes from Version 1.02 to 1.03 (Released 26 Sept 2010)

1. Added option to /ip a nickname (at a suggestion received on hawkee.com)
2. Fixed ip2c.ip.not.found.txt not being written to $scriptdir when an IP was NOT-FOUND and the option to log was enabled.
3. Fixed the case of a fresh installation of mIRC not having an [events] section in mirc.ini - thus all default Join/Part/Quit messages are in Channel Only
   For this, changed Aliases for /ip2c.read.mirc.ini.where.channel.join /ip2c.read.mirc.ini.where.channel.part /ip2c.read.mirc.ini.quit
   and added the Alias /ip2c.read.mirc.ini.where.channel.JPQ
4. Fixed the PART - /part # Text Message - As it was not showing the "Text Message"
5. Updated ip2country.lookup.ini with more 2nd Level Domains. To use these, you will have to delete your ip2country.lookup.personal.ini file.


Changes from Version 1.03 to 1.04 (Released 02 Oct 2010)

1. Added /whois & /who to show country name if Whois/Who group enabled 
2. Cosmetic change in Update Database & Utilities Tab of the Settings & Options Dialog - displaying info now in "read, rich" instead of "disabled"
3. Fixed an incorrect 2nd Level Domain in ip2country.lookup.ini as quality.net=KW should actually be qualitynet.net=KW
4. Fixed ALIAS ip2c.lookup.heart - when "Echo Not Found Message" is enabled, and the Not Found IP is lower than the lowest entry in the database - 
   reaching line 0 instead of line 1 - thus was giving this unwanted reply: 
   IP: 0.0.0.1 has NOT been found. The IP range closest to this is in the NET-RANGE - and is from () - 
   ( It took 0.016 seconds and 18 tries to get to line 0 of 132355 )
5. Fixed the entry in ip2country.lookup.ini where country code [GB] entry was country=Great Britain(UK). Removed the (UK)
6. Fixed On Load item (.timer 1 0 .reload -rs1 $+(",$script,") ) where long file names with spaces being incorrectly handled by older versions of mIRC
7. Fixed missing "=" while setting a variable in the Dialog under - if ($did = 313) (affecting older versions of mIRC)
   var %ff $findfile($did(%d,616,1),*.csv,%nf,3) - Added the var %ff = 
8. Modified ALIAS Database.convert.GeoIP.to.ip2c %in & %out to handle long file names with spaces that was troubling mIRC versions below 6.35 and 
   quietened the .rename when backing up the database file.
9. Slightly Modified layout of Update Database dialog, and increased the field length of  "Location of new CSV file" to better accomodate long file names. 
10. Modified the help text for "Update Database" for downloading, converting, and loading the new database - to be step wise friendly and easier to follow.
11. Updated ip2country.lookup.ini with more 2nd Level Domains. To use these, you will have to delete your ip2country.lookup.personal.ini file.


Changes from Version 1.04 to 1.05 (Released 10 Oct 2010)

1. In Alias ip2c.verify.ip.hidden - added hidden IP for the freenode irc network
2. Added /whowas giving the country name - Note: put it in the same On/Off group as /whois
3. Added !ip Nickname - to work in #,?,=
4. Tweaked # All Nick's Details display window to show hidden IPs Country in red making it easier to notice.
5. Added a button on the Update Domains tab to Rebuild the 2nd Level Domains from each new database.
6. Fixed line for Deleting a 2nd Level Domain referencing id box 531 instead of the correct hidden id box 533
7. Updated ip2country.lookup.ini with more 2nd Level Domains. To use these, you will have to Rebuild (the 2nd Level) Domains.


Changes from Version 1.05 to 1.06 (Released 02 Nov 2011)

1. Added BANS & UNBANS to show the country code(s) of the countries caught in a ban, & updated the Options Dialog to include "Bans/Unbans shows cc" - for switching on and off showing Ban country codes. This is OFF by default. 
   This was a complicated procedure (400+ lines of scripting) - and very complex ban masks might be ignored, yet hopefully every common and many not so common ban masks should resolve properly. Be aware that some ban masks can encompass many countries; the list may be longer than your liking. Example: //echo $ip2c.ban.check(212.*)  returns the 2 digit country code (very long?) string of: BN UZ GA PK CD CG ZA TJ PH HK TZ GH QA VA OM LV AX KR HN AN UY VE GU VI ID NZ AU CN MY TW ZW CU EC SG PR DO GT CO BO PA PE MX CA BY BH MA RE BR LI TH GM GE RS MT FO GR BF KW BA AZ RO AM JP JO CY IS GG LB IL CL AR GI BI SC SZ UG SL SM KN NP SO KE ET MR AF MM CM CI MZ NG FI HR PS SI KZ MK EG LT AS SY SA DK AT JE LU IN EE NE AE IQ A2 SK BG CZ CH NO BE IT HU SE KG TR IE PL IR UA US NL MD SD FR PT GB ES RU EU DE
2. 
3. Added new top level domains: xxx ( http://data.iana.org/TLD/tlds-alpha-by-domain.txt )
4. Fixed a typo in ALIAS ip2c.IPv4.IPv6 : changed: {return ipv6) to: { return ipv6 }
5. Updated to website forum URL to go directly to the right section: Use the Forum:run http://www.much.net/forums/viewforum.php?f=45
6. Added a Help button for the Who/Whois option
7. Updated the /ip2c help info to display clearer
8. Updated ip2country.lookup.ini with more 2nd Level Domains. To use these, you will have to Rebuild (the 2nd Level) Domains.
   Rebuilding is done by right clicking and in the menu popup: ip2c >> Settings & Options >> Update Domains >> Rebuild Domains Button


