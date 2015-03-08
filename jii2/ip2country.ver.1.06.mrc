;################ INTRODUCTION - ip2country.mrc ###########################################
;#                                                                                        #
;#  This Script is known as: ip2country ( AKA ip2c )                                      #
;#  This script must have 2 additional database files.                                    #
;#  ip2country.txt & ip2country.lookup.ini                                                #
;#                                                                                        #
;#  Version: ver.1.06  -  released on 05 Nov 2011                                         #
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
;#  Shows the:- JOIN / PART messages with the Country name included.                      #
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
;#  Can show the country code(s) of the countries caught in a ban                         #
;#            This is OFF by default and can be enabled in the Settings & Options         #
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
;#  Check other aliases/identifiers in the help section                                   #
;#           /ipdns /ipdnsL $ip2c.ban.check(212.*)                                        #
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

ALIAS ip2c.version { 
  var %version = 1.06
  if (!$isid) { set %ip2c.Version %version }  
  else { return %version }
}

;###
;### You can change this Alias name /ip below to whatever you want.
;### Receives - $1 = IP & $prop
;###

ALIAS ip {
  if ($group(#ip2c.check.remote.status) == off) { ip2c.check.remote.status }
  tokenize 32 $1- | ip2c $1- | return $result
}

;######################### ON LOAD #####################################
;#                                                                     #
;# On first LOADING the script it checks to see                        #
;# if you are using a compatible verison of mIRC                       #
;# which would be v6.01 or higher.                                     #
;#                                                                     #
;#######################################################################

on *:LOAD: { ip2c.activate }

ALIAS ip2c.activate {
  var %v = 6.01
  if ($version < %v) {
    ip2c.echo.msg $ip2c.g 4VERSION PROBLEM - You are using mIRC version: $version - Please use mIRC %v or later.
    ip2c.echo.msg $ip2c.g Download the latest version of mIRC at http://www.mirc.com/
    ip2c.unload
  }
  else { ip2c.activate.2 }
}

ALIAS ip2c.unload unload -rs $+(",$script,")

ALIAS ip2c.activate.2 {
  ip2c.default.echo.colour
  ip2c.echo.msg -
  ip2c.echo.msg $ip2c.g !ip /ip2c script for converting an IP to a country name - has been loaded. 
  ip2c.echo.msg -
  ; Check if all the files are in place
  verify.ip2c.files.exist
  if ($result) { 
    ip2c.echo.msg $ip2c.g The Following $result - This script needs the file(s) to look up an IP. They are 4not in your $scriptdir directory where they should be. You can download them from http://ip2country.much.net/
    var %unload = $input(This script needs two additional files to work: $crlf $+ 1. ip2country.txt $crlf $+ 2. ip2country.lookup.ini $crlf $+ $crlf $+ One or both of them are missing. $crlf $+ Press YES to allow the script to unload. $crlf $+ $crlf $+ Press NO if you are sure you want to leave the script loaded $crlf $+ even though it won't work.,y,ip2c: - $strip($result))
    if (%unload) { ip2c.unload | return }
  }
  ; Check if Default variable settings exist - if not then set them
  ip.m.switch.ON.recommended | ip2c.default.channels | ip2c.default.webpage | ip2c.version | ip2c.small.bmp.icon
  ip2c.echo.msg -
  ip2c.echo.msg $ip2c.g To see the default configurations or change settings, right click and choose ip2c / Settings & Options

  ; ip.m.show.all.settings | linesep -s
  if (!$ial) { 
    ip2c.echo.NotFound WARNING - your Internal Address List is switched OFF ! 
    ip2c.echo.NotFound WARNING - Many functions of this Addon will not work with IAL off
    ip2c.echo.NotFound WARNING - To switch it on type --> /ial on 
    linesep -s
    ip2c.echo.msg $ip2c.g Please right click in the Status Window and use the $bold(ip2c) option to make your settings. 
    linesep -s

  }
  .timer 1 0 .reload -rs1 $+(",$script,")
}

on *:UNLOAD: { 
  ip2c.hash free
  ip2c.LOOKUP.hash free
  if ($dialog(ip2cConfig)) { dialog -c ip2cConfig }
  linesep -s
  ip2c.echo.msg $ip2c.g Thank you for having used $nopath($script)
  ip2c.echo.msg $ip2c.g To reload the script, paste in the following line:
  ip2c.echo.msg /load -rs1 $+(",$script,")
  .timer -ip2c* off 
  .unset -s %ip2c.* 
}

;### GROUP START #ip2c.check.remote.status
#ip2c.check.remote.status off
#ip2c.check.remote.status END
;### END START #ip2c.check.remote.status

ALIAS ip2c.check.remote.status {
  if (($remote = 3) || ($remote == 7)) { var %remote On }
  elseif ($remote = 0) { var %remote Off }
  else { var %remote Not Properly On }
  if ((%remote == Off) || (%remote = Not Properly On)) {
    ip2c.echo.NotFound $ip2c.g WARNING: Your Remotes are %remote
    ip2c.echo.NotFound $ip2c.g To switch on remotes and activate this script type /ip2c.activate
    ip2c.echo.NotFound $ip2c.g If you do not do this, this script will have very limited functions.
    ip2c.echo.msg -
    ip2c.echo.msg $ip2c.g To turn off this message, right click, select: ip2c / Display Settings / Disable Check if Remote in On Message - Switch this On
    ip2c.echo.msg $ip2c.g You will not be able to change any Options in the ip2c / Settings & Options - should remotes be off.
    ip2c.echo.msg $ip2c.g To manually switch on remotes, type this in the status window: /remote on
  }
}

;### Receives IP or $address and an optional additional parameter "result"
;### This section takes about 40% of the lookup time and needs to be optimized
;### Any Beta Tester who reads this, help on speeding it up would be greatly appreciated

ALIAS ip2c  {
  if ($prop) { var %ip2c.tokenize = $1 result }
  else { var %ip2c.tokenize = $1- }
  tokenize 32 $strip(%ip2c.tokenize)
  if (@ isin $1) { tokenize 32 $gettok($1,$gettok($1,0,64),64) $2- }
  ; Check that by mistake a BLANK IP followed by the parameter "result" was not sent by mistake
  if ($1- == result) { 
    ;ip2c.echo.msg $bold($1-) is an invalid IP
    return 
  }
  ;  Check the IP & Country database files are in the right place.
  verify.ip2c.files.exist
  if ($result) { 
    ip2c.echo.msg The following $result This script needs the file(s) to look up an IP. They are 4not in your $scriptdir directory where it should be. If you don't have the files you need, you can download them from http://ip2country.much.net/
    linesep
    ip2c.echo.msg It is suggested that you unload this script or switch it off by using the right click popup menu: $chr(31) ip2c // Utilities // Switch -OFF- All Settings $chr(15)
    if ($2 != result) { return $result }
    else { return $null }
  }
  if ($1 isnum) {
    if ($2 != result) { ip2c.echo.msg IP: $1 is a number. Invalid entry. }
    return $null
  }
  ; #1# To speed up processing - if the IP is valid - jump straight to the IP verify
  ; Modified on 20-Sep-2010 to check for ipv6
  var %longip = $longip($1), %ip.type = $ip2c.IPv4.IPv6($1)
  if (%ip.type == ipv4) { goto VERIFY-IP }
  elseif (%ip.type == ipv6) {  
    if ($2 != result) { 
      ip2c.echo.msg The IP: $1 is an IPv6 version IP that cannot be looked up yet. 
    }
    return
  }
  ;var %longip = $longip($1)
  ;if (%longip > 0) { goto VERIFY-IP }

  ; #2# Check if the IP is masked for Undernet +x mode
  ip2c.verify.ip.hidden $1
  if ($result) {
    if ($2 != result) { 
      ip2c.echo.msg The IP: $1 is from a nickname that has a IRC hidden IP  - thus the IP cannot be checked. 
      return $result
    }
    return $null
  }
  ;  Check the IP database HASH files are loaded, and if not, load them
  ip2c.hash make | ip2c.LOOKUP.hash make
  if ($group(#ip2c.2nd.Level.Domains) == on) {
    ; #3# To speed up processing - if the IP is a KNOWN 2nd Level Domain
    ip2c.verify.ip.2nd.Level.Domain $1
    if $result {
      var %cc = $gettok($result,1,32), %country = $gettok($result,2-,32)
      if ($2 != result) { 
        if ($true) {
          var %ip.comchans = $ip2c.ial.check($1)
        }
        ip2c.echo.result IP: $upper($1) is from %country $+  ( $+ %cc $+ )  $iif(%ip.comchans,: Nick with this IP is %ip.comchans)
        return %cc %country
        ; return IP: $upper($1) is from $result $+  $iif(%ip.comchans,: Nick with this IP is %ip.comchans)
      }
      if ($prop == cc) { return %cc }
      elseif ($prop == country) { return %country }
      elseif ($prop == cccountry) { return %cc %country }
      else { return $result }
    }
  }
  ; #4# Check if the entry is a Nickname
  if $mask($ial($1),1) {
    if ($2 != result) { 
      .timer 1 0 ip2c $mask($ial($1),1)
      return
    }
  }


  ; #4# Check if the IP is a TLD - Top Level Domain
  ip2c.verify.ip.TLD $1
  if ($result) {
    ; check if an IP can be extracted from this IP ex. ip68-100-148-4.dc.dc.cox.net extracts to 68.100.148.4
    ; however this is usually left disabled as it can give wrong results
    var %temp.result = $result
    if ($group(#ip2c.host2ip) == on) {
      disable #ip2c.host2ip
      host2ip $1
      if ($result) {
        ; now we have changed the incoming IP to a new IP ! How do we handle it?
        tokenize 32 $result $2-
        ; now we need to exit this loop
        GOTO host2ip.found
      }
    }
    if ($2 != result) { 
      ip2c.echo.msg %temp.result
      return %temp.result
    }
    return $null
  }
  :host2ip.found
  ; #5# Check if the IP number entered IS a Country Code IP
  ip2c.lookup.LOOKUP.hash $1
  if ($result) {  
    var %cc = $gettok($result,1,32), %country = $gettok($result,2-,32)
    if ($2 != result) { 
      if ($true) {
        var %ip.comchans = $iif($group(#ip2c.ComChan) = ON,$ip2c.ial.check($1),)
        ;var %ip.comchans = $ip2c.ial.check($1)
        ;var %ip.comchans = $result
      }
      ip2c.echo.result ip2c: $upper($1) is from %country $+  $iif(%ip.comchans,: Nick with this IP is %ip.comchans)
      return ip2c: $upper(%cc) is from %country $+  $iif(%ip.comchans,: Nick with this IP is %ip.comchans)
    }
    if ($prop == cc) { return %cc }
    elseif ($prop == country) { return %country }
    elseif ($prop == cccountry) { return %cc %country }
    else { return $result }
  }
  ; #6# Check if the IP number entered is NOT valid numerical IP
  ip2c.verify.ip.input $1
  if ($result) {
    if ($2 != result) { 
      ip2c.echo.msg $result 
      else { return $result }
    }
    return
  }

  :VERIFY-IP

  ; If all these are verified - time to search the IP database
  ;  Check the IP database HASH files are loaded, and if not, load them
  ip2c.hash make | ip2c.LOOKUP.hash make

  ;  This %start.time is just statistic of interest - the time taken for the lookup and returning the answer.
  var %result = $2, %start.time = $ticks
  ip2c.lookup.heart %longip
  if ($result) {
    tokenize 32 $result
    var %ip.lookup.result = $1, %longip = $2, %tries = $3, %line.read = $4, %lines = $5, %N1 = $6, %N2 = $7, %cc = $8 , %country = $gettok($ip2c.lookup.LOOKUP.hash($8),2-,32)
    var %ticks = $ticks, 
    ;while (%ticks = %start.time) { var %ticks = $ticks } 
    if (%ip.lookup.result = FOUND) {
      if ($prop == cc) { return %cc }
      elseif ($prop == country)   { return %country }
      elseif ($prop == cccountry)   { return %cc %country }
      elseif ($prop == netblock)  { return %N1 %N2 }
      elseif ($prop == result) || (%result == result) { return %N1 $+ , $+ %N2 $+ , $+ %cc $+ , $+ %country }
      else {
        if ($group(#ip2c.Long.IP.Found.Result) == ON) {
          ; var %ip.comchans = $ip2c.ial.check($longip($2))
          var %ip.comchans = $iif($group(#ip2c.ComChan) = ON,$ip2c.ial.check($longip($2)),)
          ip2c.echo.result ip2c: $longip(%longip) is in the NET-RANGE $longip(%N1) - $longip(%N2) and is from %country ( $+ %cc $+ ) - (It took $calc((%ticks - %start.time) / 1000) seconds and %tries tries to get to line %line.read of %lines ) $iif(%ip.comchans,: Nick with this IP is %ip.comchans)
        }
        else {
          ;var %ip.comchans = $ip2c.ial.check($longip($2))
          var %ip.comchans = $iif($group(#ip2c.ComChan) = ON,$ip2c.ial.check($longip($2)),)
          ip2c.echo.result ip2c: $longip(%longip) is from %country $+  ( $+ %cc $+ ) $iif(%ip.comchans,: Nick with this IP is %ip.comchans)
        }
        return $longip(%longip) %cc %country
      }
    }
    if (%ip.lookup.result = NOTFOUND) {
      if ($prop) || (%result) { return }
      var %ip.comchans = $iif($group(#ip2c.ComChan) = ON,$ip2c.ial.check($longip($2)),)
      if ($group(#ip2c.NOT.Found.echo) == ON) {
        if ($group(#ip2c.Long.IP.Found.Result) == ON) { ip2c.echo.NotFound IP: $longip(%longip) has NOT been found. The IP range closest to this is in the NET-RANGE $longip(%N1) - $longip(%N2) and is from %country ( $+ %cc $+ ) - ( It took $calc((%ticks - %start.time) / 1000) seconds and %tries tries to get to line %line.read of %lines ) $iif(%ip.comchans,: Nick with this IP is %ip.comchans)  }
        else { ip2c.echo.NotFound IP: $longip(%longip) has NOT been found. The IP range closest to this is in the NET-RANGE $longip(%N1) - $longip(%N2) and is from %country ( $+ %cc $+ ). $iif(%ip.comchans,: Nick with this IP is %ip.comchans) }
      }
      else { 
        var %ip.comchans = $iif($group(#ip2c.ComChan) = ON,$ip2c.ial.check($longip($2)),)
        ip2c.echo.result ip2c: $longip(%longip) has not been found. $iif(%ip.comchans,: Nick with this IP is %ip.comchans)
      }
      if ($group(#ip2c.NOT-FOUND.log) == on) {
        ip2c.Not.Found.Log.to.File %longip
      }
      return
    }
  }
  else { return $result }
}


ALIAS ip2c.lookup {
  tokenize 32 $1-
  var %result = $2, %return
  ; If the IP is not a valid - return
  var %longip = $longip($1)
  if !%longip {
    if (%result == result) { var %return } 
    else { var %return Wrong or no IP specified }
    GOTO END
  }

  ;  Check the IP database file is in the right place.
  ;  Make HASH if it does not already exist

  ip2c.hash make | ip2c.LOOKUP.hash make
  if (!$ip2c.hash(status) || !$ip2c.lookup.hash(status)) { ip2c.echo.NotFound Hash Database Files Missing | goto END  }

  ;  This %tries is just a statistic of interest - how many lookups are made before a hit.
  ;var %start.time $ticks, %tries = 0, %return
  ip2c.lookup.heart %longip
  tokenize 32 $result
  var %found = $1, %longip = $2, %tries = $3, %line.read = $4, %lines = $5, %N1 = $6, %N2 = $7, %cc = $8
  return %found %longip %tries %line.read %lines %N1 %N2 %cc 
}

;###
;### The main HEART of the SCRIPT - Must have the database ip2c.HASH loaded
;### Input needed is a VALID NUMERICAL Long IP number (not a numerical or alphanumeric IP)
;### in the range 1 - 4294967294 ( $longip(0.0.0.1) - $longip(255.255.255.254) )
;### this alias DOES not verify if the LONG IP is valid. You MUST make sure $1 is a proper LONG IP
;### %ip = %longip / %lf = %line.first / %ll = %line.last / %l = %lines / %f = %found / %t = %tries
;### :L = :LOOP / :F = :FINISH
;### 
;var %longip = $1, %line.first = 0, %line.last = $hget(ip2c.HASH,total), %lines, %found
ALIAS ip2c.lookup.heart {
  !var %ip = $1, %lf = 0, %ll = $hget(ip2c.HASH,total), %f
  !if (!%ll) { %ll = $hget(ip2c.HASH,0).item }
  !var %l = %ll, %t = 0, %lr = $int($calc((%lf + %ll) / 2))
  :L
  !inc %t
  !tokenize 44 $hget(ip2c.HASH,%lr)
  !if (%ip >= $1) {
    !if %ip <= $2 { !var %f = FOUND
    !goto F }
  }
  !if (%lr == %lf) {
    !if (%lr == 0) {
      !var %lr = 1
      !tokenize 44 $hget(ip2c.HASH,%lr)
    }
    !var %f = NOTFOUND
    !goto F
  }
  !if (%ip > $1) {
    !var %lf = %lr, %lr = $round($calc((%lf + %ll) / 2),0)
    !goto L
  }
  !else {
    !var %ll = %lr, %lr = $int($calc((%lf + %ll) / 2))
    !goto L
  }
  :F
  !return %f %ip %t %lr %l $1 $2 $3
}

;This alias below is now redundant
ALIAS ip2c.Found.echo {
  tokenize 32 $1-
  var %longip = $1, %start.time = $2, %tries = $3, %line.read = $4, %lines = $5, %netblock.start = $6, %netblock.end = $7, %cc = $8, %country = $9-
  if ($10 == LONG) {
    ip2c.echo.result IP: $longip(%longip) is in the NET-RANGE $longip(%netblock.start) - $longip(%netblock.end) and is from %country ( $+ %cc $+ ) - ( It took $calc($calc(0.0001 + $ticks - %start.time - 0.0001 ) / 1000) seconds and %tries tries to get to line %line.read of %lines )
  }
  else { ip2c.echo.result IP: $longip(%longip) is from %country ( $+ %cc $+ ) }
}

;### GROUP START #ip2c.short.cc

#ip2c.short.cc on
#ip2c.short.cc end

;### GROUP END #ip2c.short.cc


;### GROUP START #ip2c.Long.IP.Found.Result

#ip2c.Long.IP.Found.Result off
#ip2c.Long.IP.Found.Result end

;### GROUP END #ip2c.Long.IP.Found.Result


;### GROUP START #ip2c.NOT-FOUND.log
#ip2c.NOT-FOUND.log off

ALIAS ip2c.Not.Found.Log.to.File {
  tokenize 32 $1-
  var %longip = $1, %line.read = $2, %file = $+(",$scriptdir,ip2c.ip.not.found.txt,")
  write %file $longip(%longip) : %longip : Closest Line %line.read : $asctime($ctime,HH:nn:ss tt - ddd dd/mmm/yy) - $ctime
}

#ip2c.NOT-FOUND.log end
;### GROUP END #ip2c.NOT-FOUND.log

;### GROUP START #ip2c.NOT.Found.echo
#ip2c.NOT.Found.echo off

ALIAS ip2c.Not.Found.Echo {
  tokenize 32 $1-
  var %longip = $1, %netblock.start = $2, %netblock.end = $3, %cc = $4, %country = $5, %start.time = $6, %tries = $7, %line.read = $8, %lines = $9
  if ($10 == LONG) {
    ip2c.echo.NotFound IP $longip(%longip) has NOT been found. The IP range closest to this is in the NET-RANGE $longip(%netblock.start) - $longip(%netblock.end) and is from %country ( $+ %cc $+ ) - ( It took $calc($calc($ticks - %start.time) / 1000) seconds and %tries tries to get to line %line.read of %lines )
  }
  else {   ip2c.echo.NotFound IP $longip(%longip) has NOT been found. }
}

#ip2c.NOT.Found.echo end
;### GROUP END #ip2c.NOT.Found.echo


; ### Making / Free-ing / checking the Status of the HASH table
ALIAS ip2c.hash {
  if ($1 == make) {
    if (!$hget(ip2c.HASH)) { 
      hmake -s ip2c.HASH 1000 
      .hload -sn ip2c.HASH $+(",$scriptdirip2country.txt,")
      .hadd ip2c.HASH total $hget(ip2c.HASH,0).item
    }
  }
  elseif ($1 == free) {
    if ($hget(ip2c.HASH)) { hfree -s ip2c.HASH } 
  }
  elseif ($1 == status) { 
    return $hget(ip2c.HASH) 
  }
}

ALIAS ip2c.LOOKUP.hash {
  if ($1 == make) {
    if (!$hget(ip2c.LOOKUP)) { 
      hmake -sn ip2c.LOOKUP 100
      ip2c.LOOKUP.hash.load.countries
    }
  }
  elseif ($1 == free) {
    if ($hget(ip2c.LOOKUP)) { hfree -s ip2c.LOOKUP } 
  }
  elseif ($1 == status) { 
    return $hget(ip2c.LOOKUP) 
  }
}


;### Basically Written by liner of #mirc (Undernet) with suitable modification by me
;    This creates the ip2country.txt database from the Maxmind GeoIPCountryWhois.csv database
;    and backs up the old ip2country.txt file
ALIAS Database.convert.GeoIP.to.ip2c {
  ; Usage: /Database.convert.GeoIP.to.ip2c [Input GeoIP CSV file [Output text file]]
  ;
  ; Creates a fresh and up-to-date database
  ; from a GeoIP CSV file.
  ; http://www.maxmind.com/app/geolitecountry
  ; and backs up the old database incase something goes wrong

  var %in.file = GeoIPCountryWhois.csv 
  var %out.file = ip2country.txt

  ;if (!$isfile(%in.file) && $isfile($+(",%in.file,")) {  }

  var %in  = $iif($1-, $1-, $+(",$scriptdir,%in.file,"))
  ;var %out = $iif($2, $2, $+(",$scriptdir,%out.file,"))
  var %out = $+(",$scriptdir,%out.file,")
  if !$isfile(%in) {
    var %msg = info * /MakeDatabase: input file %in is missing.
    if ($1) { ip2c.GeoIP.converting.message %msg }
    else { ip2c.echo.msg %msg } 
    return
  }
  if $isfile(%out) { 
    var %rename = $+(",$scriptdir,%out.file $asctime(dd mmm yyyy - HH nn ss),.bak,")
    if $isfile(%rename) { 
      var %msg = info * /MakeDatabase: output file $nopath(%out) exists and cannot be backed up to $nopath(%rename) .
      if ($1) { ip2c.GeoIP.converting.message %msg }
      else { 
        ip2c.echo.msg %msg 
      }
      return   
    }
    .rename %out %rename
  }
  var %msg = info * This will take time ....
  if ($1) { ip2c.GeoIP.converting.message %msg }
  else { ip2c.echo.msg %msg }

  .fopen -no out %out
  .filter -fk %in Database.convert.GeoIP.to.ip2c.filter
  .fclose out

  var %msg = * Successfully converted GeoIP file %in to our database format %out
  if ($1) { ip2c.GeoIP.converting.message %msg }
  else {   ip2c.echo.msg %msg }
}

ALIAS -l Database.convert.GeoIP.to.ip2c.filter {
  ;.fwrite -n out $gettok($remove($1, "),3-,44)
  .fwrite -n out $gettok($remove($1, "),3-5,44)
}

; To convert the IpToCountry.csv from http://software77.net/geo-ip/ to the ip2country.txt file
ALIAS Database.convert.IpTpCountry.to.ip2c {

  var %in.file = IpToCountry.csv 
  var %out.file = ip2country.IpToCountry.test.txt

  ;if (!$isfile(%in.file) && $isfile($+(",%in.file,")) {  }

  var %in  = $iif($1, $1, $+(",$scriptdir,%in.file,"))
  var %out = $iif($2, $2, $+(",$scriptdir,%out.file,"))
  if !$isfile(%in) {
    var %msg = info * /MakeDatabase: input file %in is missing.
    if ($1) { ip2c.GeoIP.converting.message %msg }
    else { ip2c.echo.msg %msg } 
    return
  }
  if $isfile(%out) { 
    var %rename = $+(",$scriptdir,%out.file $asctime(dd mmm yyyy - HH nn ss),.bak,")
    if $isfile(%rename) { 
      var %msg = info * /MakeDatabase: output file $nopath(%out) exists and cannot be backed up to $nopath(%rename) .
      if ($1) { ip2c.GeoIP.converting.message %msg }
      else { 
        ip2c.echo.msg %msg 
      }
      return   
    }
    .rename %out %rename
  }
  var %msg = info * This will take time ....
  if ($1) { ip2c.GeoIP.converting.message %msg }
  else { ip2c.echo.msg %msg }

  .fopen -no out %out
  .filter -fk %in Database.convert.IpToCountry.to.ip2c.filter
  .fclose out

  var %msg = * Successfully converted GeoIP file %in to our database format %out
  if ($1) { ip2c.GeoIP.converting.message %msg }
  else {   ip2c.echo.msg %msg }
}

ALIAS -l Database.convert.IpToCountry.to.ip2c.filter {
  ;.fwrite -n out $gettok($remove($1, "),3-,44)
  var %left = $left($1,1)
  if (%left != $chr(35)) && (%left != $chr(32)) {
    .fwrite -n out $remove($gettok($1,1-2,44) $+ $chr(44) $+ $gettok($1,5,44), ")
  }
}


; This loads the countries and the 2nd level domains into the Hash - ip2c.LOOKUP
ALIAS ip2c.LOOKUP.hash.load.countries {

  var %in = $+(",$scriptdirip2country.lookup.ini,")
  ;var %in = $+(",$scriptdirlookup.test.ini,")

  ; %in.personal is the personal file that holds changed 2nd level domains.
  ; This may or may not exist - depending on if the user has added or changed 2nd level domain entries in the Update Domains part of the Settings Dialog 

  var %in.personal = $+(",$scriptdirip2country.lookup.personal.ini,")

  var %out = $+(",$scriptdirip2country.lookup.ini.tmp,")

  if (!$hget(ip2c.LOOKUP)) { ip2c.LOOKUP.hash make }

  if $file(%in) {

    if ($fopen(out)) { .fclose out } 
    .fopen -no out %out
    if ($file(%in.personal)) {

      filter -fk %in.personal ip2c.LOOKUP.2nd.Level.filter

      filter -fk %in ip2c.LOOKUP.country.filter
    }
    else { filter -fk %in ip2c.LOOKUP.filter }
    .fclose out
    unset %ip2c.cc.tmp*
  }
  else { ip2c.echo.msg $ip2c.g ip2country.lookup.ini file missing }
  .remove $+(",$scriptdirip2country.lookup.ini.tmp,")
}

ALIAS ip2c.LOOKUP.2nd.Level.filter {
  if ([*] iswm $1) { 
    set %ip2c.cc.tmp $1
    set %ip2c.cc.tmp2 $iif($1 == [ip2c.top.level.domains],$1-,$null)
  }
  if (%ip2c.cc.tmp2) && ($1 != $null) {
    if ($1- != [ip2c.top.level.domains]) {
      hadd ip2c.LOOKUP $gettok($1-,1,61) $gettok($1-,2,61)
      .fwrite -n out $gettok($1-,1,61) $gettok($1-,2,61)
    }
  }
}
ALIAS ip2c.LOOKUP.country.filter {
  if ([*] iswm $1) { 
    set %ip2c.cc.tmp $1
  }
  if (country=* iswm $1-) { 
    if (%ip2c.cc.tmp) && ($1 != $null) {
      if ($len(%ip2c.cc.tmp) == 4) {
        .fwrite -n out $remove(%ip2c.cc.tmp,[,]) $remove($1-,country=)
        hadd ip2c.LOOKUP $remove(%ip2c.cc.tmp,[,]) $remove($1-,country=)
      }    
    }
  }
}

ALIAS ip2c.LOOKUP.ip2c.hidden.network.ip.filter {
  if ([*] iswm $1) { 
    set %ip2c.cc.tmp $1
    set %ip2c.cc.tmp2 $iif($1 == [ip2c.hidden.network.ip],$1-,$null)
  }
  if (%ip2c.cc.tmp2) && ($1 != $null) {
    if ($1- != [ip2c.top.level.domains]) {
      hadd ip2c.LOOKUP $gettok($1-,1,61) $gettok($1-,2,61)
      .fwrite -n out $gettok($1-,1,61) $gettok($1-,2,61)
    }
  }
}

ALIAS ip2c.LOOKUP.filter {
  if ([*] iswm $1) { 
    set %ip2c.cc.tmp $1
    set %ip2c.cc.tmp2 $iif($1 == [ip2c.top.level.domains],$1-,$null)
  }
  if (%ip2c.cc.tmp2) && ($1 != $null) {
    if ($1- != [ip2c.top.level.domains]) {
      hadd ip2c.LOOKUP $gettok($1-,1,61) $gettok($1-,2,61)
      .fwrite -n out $gettok($1-,1,61) $gettok($1-,2,61)
    }
  } 
  if (country=* iswm $1-) { 
    if (%ip2c.cc.tmp) && ($1 != $null) {
      if ($len(%ip2c.cc.tmp) == 4) {
        .fwrite -n out $remove(%ip2c.cc.tmp,[,]) $remove($1-,country=)
        hadd ip2c.LOOKUP $remove(%ip2c.cc.tmp,[,]) $remove($1-,country=)
      }    
    }
  }
}


ALIAS ip2c.lookup.LOOKUP.hash {
  if (!hget(ip2c.LOOKUP)) { ip2c.LOOKUP.hash make }
  var %ip.end = $upper($gettok($1,$gettok($1,0,46),46))
  if (($len(%ip.end ) == 2) && ($left(%ip.end,1) isalpha)) {
    var %ip.country = $hget(ip2c.LOOKUP,%ip.end)
    return $iif(%ip.country,%ip.end %ip.country,$null)
  }
  else { return $null }
}

ALIAS ip2c.HASH.country.integrity.LOOKUP {
  ip2c.hash make | ip2c.LOOKUP.hash make
  var %n = 1, %missing
  var %items = $hget(ip2c.HASH,0).item
  while (%n <= %items) {
    var %cc = $hget(ip2c.HASH,%n), %cc = $gettok(%cc,3,44)
    var %dd = $hget(ip2c.LOOKUP,%cc)
    if (%cc) && (!%dd) { 
      if (!$istok(%missing,%cc,32)) {  ip2c.echo.NotFound $ip2c.g  %cc  is missing from the ip2country.lookup.ini file from ip2country.txt line no: %n }
      var %missing = $addtok(%missing,%cc,32)
    }
    inc %n
  }
  if (%missing) { ip2c.echo.NotFound $ip2c.g Followuing are missing: %missing }
  else { ip2c.echo.msg $ip2c.g The Country database has been successfully verified }
}


ALIAS ip2c.AddItem.ip2country.lookup.ini {
  if ($1 && ($len($2) = 2) {  
    var %inifile = $scriptdirip2country.lookup.ini, %section = ip2c.top.level.domains, %item = $1, value = $2
    writeini -n %inifile %section %item %value
  }
}

;######################### ON TEXT - !ip ################################
;#                                                                      #
;#  SOMEONE TYPES !ip 127.0.0.1 IN a CHANNEL / QUERY / CHAT / BY NOTICE #
;#                                                                      #
;#  These are the REMOTES that catches the TEXT !ip                     #
;#                                                                      #
;#  CALLS the ALIAS: ip2c WITH 1 parm - IP                              #
;#                   ip2c.ial.check WITH 1 parm - IP                    #
;#                                                                      #
;#  Receives back the Messages - and displays those                     #
;#                                                                      #
;########################################################################


;### GROUP START #ip2c.ComChan
#ip2c.ComChan on
#ip2c.ComChan end



;### For Channels respone to !ip

;### GROUP START #ip2c.text
#ip2c.text off

on *:TEXT:!ip *:%ip2c.channels: { 
  if ($chan) { var %chan = $chan }
  else { ip2c.echo.NotFound Referring to the request of !ip - don't know where to send the reply!! Maybe the Channel or MSG window has closed. }
  if (%chan) {
    var %input = $2
    ; Check if Query item is a Nickname rather than a IP or Country  
    if $comchan($2,0) {
      if $mask($ial($2),1) {  
        var %input = $mask($ial($2),1)
        var %ip.comchans = $iif($group(#ip2c.ComChan) = ON,$ip2c.ial.check($gettok(%input,2,64)),)
      }
    }
    var %result = $ip2c(%input).cccountry
    if (%result != $null) {
      var %cc = $gettok(%result,1,32), %country = $gettok(%result,2-,32)
      ; ### Left this line in to give the option to turn off $comchan lookup
      ;if ($group(#ip2c.ComChan) == on) {
      ;if ($true) {
      if !%ip.comchans { var %ip.comchans = $iif($group(#ip2c.ComChan) == ON,$ip2c.ial.check(%input),) }
      ;var %ip.comchans = $ip2c.ial.check($2)
      ;if (%ip.comchans) { msg %chan IP: $2 is %ip.comchans }
      ;}
      msg %chan IP: %input is from %country ( $+ %cc $+ ) $iif(%ip.comchans,: Nick with this IP is %ip.comchans,)

    }
    else { msg %chan IP: %input : Country not found }
  }
  else { ip2c.echo.NotFound Referring to the request by $nick in %chan of !ip - don't know where to send the reply!! Maybe the Channel or MSG window has closed. }
}

#ip2c.text end
;### GROUP END #ip2c.text


;### GROUP START #ip2c.query
;### For Message/Query respone to !ip
#ip2c.query off

on *:TEXT:!ip *:?: { 
  if ($query($nick)) { var %chan = $nick }
  else { ip2c.echo.NotFound Referring to the request of !ip - don't know where to send the reply!! Maybe the MSG window has closed. }
  if (%chan) {
    var %input = $2
    ; Check if Query item is a Nickname rather than a IP or Country  
    if $comchan($2,0) {
      if $mask($ial($2),1) {  
        var %input = $mask($ial($2),1)
        var %ip.comchans = $iif($group(#ip2c.ComChan) = ON,$ip2c.ial.check($gettok(%input,2,64)),)
      }
      else { 
        who $2    
        msg %chan Please try once again by typing !ip $2
      }
    }
    var %result = $ip2c(%input).cccountry
    if (%result != $null) {
      var %cc = $gettok(%result,1,32), %country = $gettok(%result,2-,32)
      ; ### Left this line in to give the option to turn off $comchan lookup
      ;if ($group(#ip2c.ComChan) == on) {
      ;if ($true) {
      if !%ip.comchans { var %ip.comchans = $iif($group(#ip2c.ComChan) == ON,$ip2c.ial.check(%input),) }
      ;var %ip.comchans = $ip2c.ial.check($2)
      ;if (%ip.comchans) { msg %chan IP: $2 is %ip.comchans }
      ;}
      msg %chan IP: %input is from %country ( $+ %cc $+ ) $iif(%ip.comchans,: Nick with this IP is %ip.comchans,)
    }
    else { msg %chan IP: %input : Country not found }
  }
  else { ip2c.echo.NotFound Referring to the %chan Query request of !ip - don't know where to send the reply!! Maybe the MSG window has closed. }
}

#ip2c.query end
;### GROUP END #ip2c.query


;### GROUP START #ip2c.chat
;### For Chat Windows respone to !ip
#ip2c.chat off

on *:CHAT:!ip *: { 
  if (!$chat($nick)) { ip2c.echo.NotFound Referring to the request from ON CHAT !ip - don't know where to send the reply!! Maybe the CHAT window has closed. }
  else { 
    var %chan = =$nick
    var %input = $2
    ; Check if Query item is a Nickname rather than a IP or Country  
    if $comchan($2,0) {
      if $mask($ial($2),1) {  
        var %input = $mask($ial($2),1)
        var %ip.comchans = $iif($group(#ip2c.ComChan) = ON,$ip2c.ial.check($gettok(%input,2,64)),)
      }
      else { 
        who $2    
        msg %chan Please try once again by typing !ip $2
      }
    }

    var %result = $ip2c(%input).cccountry
    if (%result != $null) {
      var %cc = $gettok(%result,1,32), %country = $gettok(%result,2-,32)
      ;msg %chan $result
      ; ### Left this line in to give the option to turn off $comchan lookup
      ;if ($group(#ip2c.ComChan) == on) {
      ;if ($true) {
      if !%ip.comchans { var %ip.comchans = $iif($group(#ip2c.ComChan) == ON,$ip2c.ial.check(%input),) }
      ;var %ip.comchans = $ip2c.ial.check($2)
      ;if (%ip.comchans) { msg %chan Nick: %ip.comchans has IP: $2 }
      ;}

      msg %chan IP: %input is from %country ( $+ %cc $+ ) $iif(%ip.comchans,: Nick with this IP is %ip.comchans,)
    } 
    else { msg %chan IP: %input : Country not found }
  }
  else { ip2c.echo.NotFound Referring to the %chan DCC request of !ip - don't know where to send the reply!! Maybe the DCC window has closed. }

}

#ip2c.chat end
;### GROUP END #ip2c.chat

;### GROUP START #ip2c.DCCchat
;### For Chat Windows showing County of IP on opening
#ip2c.DCCchat on

ctcp *:DCC CHAT: ip2c.echo.msg $ip2c.g  $nick is $1 $2 $+ ing you from IP No. $longip($4) Port: $5  $+($chr(40),$ip2c($longip($4)).country,$chr(41)) 
ctcp *:DCC: ip2c.echo.msg $ip2c.g  $nick is $1 $2 $+ ing you from IP No. $longip($4) Port: $5  $+($chr(40),$ip2c($longip($4)).country,$chr(41)) 



#ip2c.DCCchat end
;### GROUP END #ip2c.DCCchat

;### GROUP START #ip2c.DCCfiles
;#### For showing Country of IP when receiving a file
#ip2c.DCCfiles on

ctcp *:DCC SEND: ip2c.echo.msg $ip2c.g  $nick is $1 $2 $+ ing Filename: $3- [ $+ [ $calc($0 - 3) ] ] which is $bytes($gettok($1-,-1,32)).suf from IP No. $longip($gettok($1-,-3,32))  $+($chr(40),$ip2c($longip($gettok($1-,-3,32))).country,$chr(41)) from port number $gettok($1-,-2,32)
on *:FILESENT:*:ip2c.echo.msg $ip2c.g $bold(FILE SENT) to $bold($nick) ( $+ $ip2c($address).country $+ ) on IP: $address $bold(COMPLETE) : $nopath($filename)
on *:FILERCVD:*:ip2c.echo.msg $ip2c.g $bold(FILE RECEIVED) from $bold($nick) ( $+ $ip2c($address).country $+ ) from IP: $address $bold(COMPLETE) : $nopath($filename)

;on *:SENDFAIL:*:ip2c.echo.msg $ip2c.g $bold(FILE SEND) to $bold($nick) ( $+ $ip2c($address).country $+ ) to IP: $address $bold(FAILED) : $nopath($filename)
;on *:GETFAIL:*: ip2c.echo.msg $ip2c.g $bold(FILE RECEIVE) from $bold($nick) ( $+ $ip2c($address).country $+ ) from IP: $address $bold(FAILED) : $nopath($filename)

#ip2c.DCCfiles end
;### GROUP END #ip2c.DCCfiles


;### GROUP START #ip2c.Whois
;### For changing the 1st line of the /whois message to include the country
#ip2c.Whois on

raw 311:*: {
  if $numeric == 311 { 
    var %addy = $ip2c($4).country
    var %active = $iif($ip2c.where.echo.whois == 1,$true,$false)
    var %echo.place = $iif(%active,-ac whois,-sc whois)
    var %linesep.place = $iif(%active,$active,-s)
    linesep %linesep.place
    echo %echo.place $2 is $3 $+ @ $+ $4 $iif(%addy,* $+($chr(40),%addy,$chr(41)),) $5- 
    halt
  }
}

ALIAS ip2c.where.echo.whois {
  var %mircini = $+(",$mircini,")
  var %where.active = $readini(%mircini,n,options,n2)
  var %where.active = $gettok(%where.active,26,44)
  ; 0 = off / 1 = in active
  return %where.active
  echo 4 -gs = %where.active
}

;Whowas
;314: 1= Free`` / 2= hiiii / 3= ~H_U_M / 4= 62.150.126.89 / 5= * / 6= good / 7= / 8= / 9= / 10=
raw 314:*: {
  if $numeric == 314 { 
    var %addy = $ip2c($4).country
    var %active = $iif($ip2c.where.echo.whois == 1,$true,$false)
    var %echo.place = $iif(%active,-ac whois,-sc whois)
    var %linesep.place = $iif(%active,$active,-s)
    linesep %linesep.place
    echo %echo.place $2 is $3 $+ @ $+ $4 $iif(%addy,* $+($chr(40),%addy,$chr(41)),) $5- 
    ;halt
  }
}


#ip2c.Whois end
;### GROUP END #ip2c.Whois

;### GROUP START #ip2c.Who
;### For changing the 1st line of the /who message to include the country
#ip2c.Who on

raw 352:*: {
  if $numeric == 352 { 
    var %addy = $ip2c($4).country
    var %active = $iif($ip2c.where.echo.whois == 1,$true,$false)
    var %echo.place = $iif(%active,-ac whois,-sc whois)
    var %linesep.place = $iif(%active,$active,-s)
    ; if ($left($1,1) != $chr(35)) { echo $active This is Channel $1 | linesep %linesep.place }
    echo -sc whois $2 $6 $7 $3 $+ @ $+ $4 $iif(%addy,$+($chr(40),%addy,$chr(41)),) : $+ $8-
    halt
  }
}

#ip2c.Who end
;### GROUP END #ip2c.Who





;### GROUP START #ip2c.bans
;### For changing the BAN message to include the country
#ip2c.bans on

on *:rawmode:%ip2c.channels: {
  var %wildtoks = $wildtok($1-,*!*@*,0,32), %result = $1-
  if %wildtoks {
    while %wildtoks {
      var %wild = $wildtok($1-,*!*@*,%wildtoks,32)
      var %full.cc = $ip2c.ban.check($gettok(%wild,2,64))
      %result = $reptok(%result,%wild,%wild $iif(%full.cc,$+($chr(40),%full.cc,$chr(41)),),1,32) 
      dec -z %wildtoks
    }
    echo -ct mode $chan * $nick sets mode: %result
  }
}

on ^*:ban:%ip2c.channels: {
  ;var %ban.country = $ip2c($banmask).cccountry
  ;var %cc = $gettok(%ban.country,1,32), %country = $gettok(%ban.country,2-,32)
  ;var %country.SHOW.chan = $iif($group(#ip2c.short.cc) == on,%cc,%country)
  ;var %full.cc = $ip2c.ban.check($gettok($banmask,2,64))
  ;echo -ct mode $chan * $nick sets mode:: +b $banmask $iif(%country.SHOW.chan,$chr(40) $+ %country.SHOW.chan $+ $chr(41),) $iif(%full.cc,$+($chr(40),%full.cc,$chr(41)),) 
  haltdef
}

on ^*:unban:%ip2c.channels: {
  ;var var %full.cc = $ip2c.ban.check($gettok($banmask,2,64))
  ;echo -ct mode $chan * $nick sets mode:: -b $banmask $iif(%country.SHOW.chan,$chr(40) $+ %country.SHOW.chan $+ $chr(41),) $iif(%full.cc,$+($chr(40),%full.cc,$chr(41)),) 
  haltdef
}

#ip2c.bans end
;### GROUP END #ip2c.bans

;Receives a single wildcard type IP : *!*@###.###.###.### / *!*@###.###.###.* / *!*@###.###.* / *!*@alphanumeric.ext
;Returns a string of 2 letter country Codes matching that wildcard
ALIAS ip2c.ban.check {
  var %in.ip = $1-, %cc = $ip2c(%in.ip).cc
  ; First check if IP can be returned right away
  if %cc { return %cc }
  var %in.ip1 = $gettok(%in.ip,1,46), %in.ip2 = $gettok(%in.ip,2,46), %in.ip3 = $gettok(%in.ip,3,46), %in.ip4 = $gettok(%in.ip,4,46)
  if (%in.ip1 isnum) && (%in.ip1 >= 0) && (%in.ip1 <= 255) {
    if (%in.ip2 isnum) && (%in.ip2 >= 0) && (%in.ip2 <= 255) {
      if (%in.ip3 isnum) && (%in.ip3 >= 0) && (%in.ip3 <= 255) {
        if (%in.ip4 isnum) && (%in.ip4 >= 0) && (%in.ip4 <= 255) { return $ip2c(%in.ip).cc }
        else {
          ; Reaching here means IP is of the form *!*@###.###.###.? or *!*@###.###.###.* or similar
          ;echo 8 reached #.#.#.*
          var %fulltok = $ip2c.wild.process(%in.ip4), %numtok = $numtok(%fulltok,44), %result, %full.cc
          while %numtok {
            var %tok = $gettok(%fulltok,%numtok,44)
            var %low = $gettok(%tok,1,32), %high = $gettok(%tok,2,32)
            var %ip.add = $+(%in.ip1,.,%in.ip2,.,%in.ip3,.)
            var %result = %ip.add $+ %low %ip.add $+ %high
            ; var %full.cc = $addtok(%full.cc,$ip2c.ip.range.search(%result),32)
            ;echo 4 -gs IP looked up range = %result $ip2c.ip.range.search(%result)
            var %this.cc = $ip2c.ip.range.search(%result)
            var %full.cc = $ip2c.merge.country.codes(%full.cc , %this.cc)
            dec -z %numtok
          }
          return %full.cc
        }  
      }
      else {
        ; Reaching here means IP is of the form *!*@###.###.* or *!*@###.###.? or similar
        ;echo 8 reached #.#.*
        var %fulltok = $ip2c.wild.process(%in.ip3), %numtok = $numtok(%fulltok,44), %result, %full.cc
        while %numtok {
          var %tok = $gettok(%fulltok,%numtok,44)
          var %low = $gettok(%tok,1,32), %high = $gettok(%tok,2,32)
          var %ip.add = $+(%in.ip1,.,%in.ip2,.)
          var %result = $+(%ip.add,%low,.0) $+(%ip.add,%high,.255)
          ; var %full.cc = $addtok(%full.cc,$ip2c.ip.range.search(%result),32)
          var %this.cc = $ip2c.ip.range.search(%result)
          var %full.cc = $ip2c.merge.country.codes(%full.cc , %this.cc)

          dec -z %numtok
        }
        return %full.cc
      }
    }
    else {
      ; Reaching here means IP is of the form *!*@###.* or *!*@###.#.? or similar
      ;echo 8 reached #.*
      var %fulltok = $ip2c.wild.process(%in.ip2), %numtok = $numtok(%fulltok,44), %result, %full.cc, %this.cc
      while %numtok {
        var %tok = $gettok(%fulltok,%numtok,44)
        ;echo -gs 4 token = %tok
        var %low = $gettok(%tok,1,32), %high = $gettok(%tok,2,32)
        var %ip.add = $+(%in.ip1,.)
        var %result = $+(%ip.add,%low,.0.0) $+(%ip.add,%high,.255.255)
        ;echo 4 result = %result
        var %this.cc = $ip2c.ip.range.search(%result)
        var %full.cc = $ip2c.merge.country.codes(%full.cc , %this.cc)
        dec -z %numtok
      }
      return %full.cc
    }
  }
  ; else { } Don't Check this )*!*@* kind of entry as it is everything
}

; Receives two valid IP Numbers - a net block (start and end) where start <= end
; Returns the country codes associated with this net block (separated by spaces)
ALIAS ip2c.ip.range.search {
  tokenize 32 $1-
  var %ip1 = $longip($1), %ip2 = $longip($2)
  if (%ip1 isnum) && (%ip2 isnum) && (%ip1 <= %ip2) {
    tokenize 32 $ip2c.lookup.heart(%ip1).result
    var %line = $4, %start.block = $6, %end.block = $7, %cc = $8, %full.cc, %line.last = $hget(ip2c.HASH,0).item
    var %found = $iif(%start.block <= %ip1,FOUND,FINISHED)
    ; In case the netblock is NOT FOUND and the returned range is below the lower IP start
    ; But after this still have to continue, in case the next netblock up matches
    if (%start.block <= %ip1) && (%end.block >= %ip1) {
      var %full.cc = $addtok(%full.cc,%cc,32)
    }
    ; If the end of the netblock is larger than the IP end - then finished
    var %found = $iif(%end.block >= %ip2,FINISHED,FOUND)
    while (%found == FOUND) {
      inc %line
      tokenize 44 $hget(ip2c.HASH,%line)
      var %start.block = $1, %end.block = $2, %cc = $3
      ; Only add if this next netblock falls within the range
      if (%end.block >= %ip1) && (%start.block <= %ip2) {
        var %full.cc = $addtok(%full.cc,%cc,32)
      }
      var %found = $iif((%end.block >= %ip2) || (%line = %line.last),FINISHED,FOUND)
    }
  }
  return %full.cc
}

; Gets two stings separated by commas: US DE HU GB , DE HU CH RU :and merges them to get this result US DE HU GB CH RU 
ALIAS ip2c.merge.country.codes {
  var %tok1 = $1, %tok2 = $2, %numtok2 = $numtok($2,32)
  while %numtok2 {
    var %tok1 = $addtok(%tok1,$gettok(%tok2,%numtok2,32),32)
    dec -z %numtok2
  }
  return %tok1 
}

; Test alias that will run the numbers 0~255 through the wild card being tested
; Returns the range of IPs to be tested in Alias ip2c.ban.check
; Can't use this in real time as it is too slow
; You can see how slow it is by using Alias ip2c.wildtest
ALIAS ip2c.verify.wildcard {
  var %n = 0, %result, %keep.going
  if ($1 == 0) { tokenize 32 $int($1) } 
  while %n <= 256 {
    if ($1 iswm %n) {
      if (%result == $null) {
        var %result = %n, %keep.going = %n 
      }
      else {
        ;echo 11 -gs n= %n // keep.going= %keep.going // result= %result
        ;var %numtok = $numtok(%result,32)
        ;var %check = $gettok(%result,%numtok,32)
        if (%keep.going isnum) {
          if (%keep.going = $calc(%n - 1)) && (%keep.going != 255) { var %keep.going = %n  }
          else {
            ;echo 4 -gs n= %n // keep.going= %keep.going // result= %result
            var %result = %result %keep.going $chr(44), %keep.going
            ;echo 5 -gs n= %n // keep.going= %keep.going // result= %result

          }
        }
        else { var %result = %result $iif(%n <= 255,%n,), %keep.going = %n  }
      }
    }
    else {
      if (%keep.going isnum) {
        var %result = %result %keep.going $chr(44), %keep.going, %placer
      }
    }
    inc %n
  }
  if ($right(%result,1) = $chr(44)) { var %result = $left(%result,-1) }
  return %result
}

; Test Alias to run the Actually used alias against it's Test alias
; $ip2c.wild.process = Alias used by script
; $ip2c.verify.wildcard = Alias used as a Tester
ALIAS ip2c.verify.all.wildcards {
  echo 2 -gs Wildcard very started.
  var %list = *    **   ***  ?    ??   ???  $chr(35)  ##  ### *?   ?*   #?   ?#   #*   *# **?  *?*  ?**  ##?  #?#  ?##  ##*  #*#  *## ??*  ?*?  *??  ??#  ?#?  #??  **#  *#*  #** *?#  *#?  ?*#  ?#*  #*?  #?*
  var %tokens = $numtok(%list,32), %n = 1
  while (%n <= %tokens) {
    var %test = $gettok(%list,%n,32)
    echo 6 -gs Testing: %test
    if (### isin %test) { var %s = 100, %e = 255 }
    elseif (## isin %test) { var %s = 0, %e = 99 }
    elseif ($chr(35) isin %test) { var %s = 0, %e = 9 }
    else { var %s = 1, %e = 1 }
    while %s <= %e {
      if ($chr(35) isin %test) { var %testing = $replace(%test,$v1,%s) }
      var %script = $ip2c.wild.process(%testing), %tester = $ip2c.verify.wildcard(%testing)
      if (%script != %tester) { 
        echo 2 -gs Match difference found in token no. %n for- %testing - Results for Script & Tester below:
        echo 3 -gs = %script
        echo 5 -gs = %tester
      }
      inc %s
    }
    inc %n
  }
  echo 2 -gs Wildcard very completed.
  linesep -s
}

; 9 *    **   ***  ?    ??   ???  #  ##  ###
; 6 *?   ?*   #?   ?#   #*   *#
; 9 **?  *?*  ?**  ##?  #?#  ?##  ##*  #*#  *##
; 9 ??*  ?*?  *??  ??#  ?#?  #??  **#  *#*  #**
; 6 *?#  *#?  ?*#  ?#*  #*?  #?*
; 
;;; *   = ** = *** = *? = ?* = **? = *?* = ?** = 0~255
;;; ?   = 0~9
;;; ??  = 10~99
;;; ??? = 100~255
;;; #?  = #0~#9
;;; ?#  = 1# , 2# , 3# , 4#,,,9#
;;; #*  = #** = # , #0~#9 , (if #=1) 100~199, (if #=2) 200~255
;;; *#  = **# = # , 1#~9# , 10#~25# (<=255) Complicated - do later as includes #1 #2 #3 upto #9 && 1#1 1#2 upto 1#9
;;; ##? = (if ##<=24) ##0~##9 , (if ##=25) 250~255
;;; #?# = (if #?#=1?#) 10#~19# , (if #?#=2?#) 20#~24# , (if #?#=2?5) 210~255
;;; ?## = 1## , (if ##<=55) 2##
;;; ##* = ## , (if ##<=24) ##0 , ##1 , ##2,,,##9 , (if ##=25) 250~255
;;; #*# = ## , (if #*#=1*#) 10# , 11#,,,19# , (if #*#=2*# && 2*# <= 255) 20# , 21# , 22# , 23# , 24# , 25# < Check carefully again
;;; *## = ## , 1## , (if ##<=55) 2##
;;; ??* = ?*? = *?? = 10~255
;;; ??# = 10# , 11#,,,24# , (if #<=5) 25#
;;; ?#? = 1#0~1#9 , (if #<=4) 2#0~2#9 , (if #=5) 2#0~2#5
;;; #?? = (if #=1) 100~199 , (if #=2) 200~255
;;; *#* = # , 1# , 2#,,,9# , 10# , Complicated - do later - see *# above
;;; *?# = 1# , 2#,,,9# , 10# , 11# , 12#,,,19# , 20# , 22# , 23# ,24# , (if #<=5) 25#
;;; *#? = #0~#9 , 1#0~1#9 , (if #<=4) 2#0~2#9 , (if #=5) 250~255
;;; ?*# = 1# , 2# , 3# , 4#,,,9# , 10# , 11#,,,19# , 20#,,,24# , (if #<=5) 25#
;;; ?#* = 1# , 2# 3#,,,9# , 1#0~1#9 , (if #<=4) 2#0~2#9 , (if #=5) 250~255
;;; #*? = #?* = #0~#9 , (if #=1) 100~199 , (if #=2) 200~255
; 
;


; Receives a string up to a $len of 3 in the form * or ?? or ??? or ?*#  or any combination - where # is a number
; Returns a ranges in the form: 1 1 , 11 11 , 200 255
ALIAS ip2c.wild.process {
  while (** isin $1) { tokenize 32 $replace($1,**,*) }
  if ($len($1) > 3) { return }
  if ($1 isnum) && ($1 >= 0) && ($1 <= 255)     { return $int($1) $int($1) }
  ; *   = ** = *** = *? = ?* = **? = *?* = ?**
  ;  if ($1 == *)  || ($1 == **) || ($1 == ***) { return   0 255 }
  ;  if ($1 == ?*) || ($1 == ?**)               { return   0 255 }
  if $istok(* ** *** *? ?* = **? *?* ?**,$1,32) { return   0 255 }
  if $istok(??* ?*? *??,$1,32)                  { return   10 255 }
  if ($1 == ?)                                  { return   0 9 }
  if ($1 == ??)  { return  10 99 }   
  if ($1 == ???) { return 100 255 }
  ;if ($1 == 1??) { return 100 199 }
  ;if ($1 == 1?)  { return  10  19 }
  ;if ($1 == 2??) { return 200 255 }
  ;if ($1 == 2?)  { return  20  29 }
  ; if ($1 == 1*)  { return  1 1 , 10 199 }
  ; if ($1 == 2*)  { return  2 2 , 20 255 }

  var %p1 = $mid($1,1,1), %p2 = $mid($1,2,1), %p3 = $mid($1,3,1), %result

  ; #?  = #0~#9 
  if (%p1 > 0) && (%p2 == ?) && (%p3 == $null) {
    var %low = $int(%p1 $+ 0), %high = $int(%p1 $+ 9)
    return %low %high  
  }
  ; ?#  = 1# , 2# , 3# , 4#,,,9#
  if (%p1 == ?) && (%p2 isnum) && (%p3 == $null) {
    var %n = 1, %result
    while %n <= 9 {
      var %result = %result $iif(%result,$chr(44),) %n $+ %p2 %n $+ %p2
      inc %n
    }
    return %result
  }
  ; #*  = #** = # , #0~#9 , (if #=1) 100~199, (if #=2) 200~255
  if (%p1 isnum) && (%p2 == *) && ((%p3 == $null) || (%p3 == *)) {
    var %result = %p1 %p1
    if (%p1 > 0) { 
      var %result = %result $chr(44) %p1 $+ 0 %p1 $+ 9
      if (%p1 = 1) { var %result = %result $chr(44) 100 199 }
      if (%p1 = 2) { var %result = %result $chr(44) 200 255 }
    }
    return %result
  }  
  ; *#  = **# = # , 1#~9# , 10#~25# (<=255) Complicated - do later as includes #1 #2 #3 upto #9 && 1#1 1#2 upto 1#9
  if (%p1 == *) && (%p2 == *) && (%p3 isnum) { var %p2 = %p3, %p3 = $null  }
  if (%p1 == *) && (%p2 isnum) && (%p3 == $null) {
    var %n = 1, %result = %p2 %p2
    while %n <= 24 {
      %result = %result $iif(%result,$chr(44),) %n $+ %p2 %n $+ %p2
      inc %n
    }
    if (%p2 <= 5) { %result = %result $chr(44) 25 $+ %p2 25 $+ %p2 }
    return %result
  }
  ; ##?
  if (%p1 isnum)  && (%p2 isnum) &&  (%p3 == ?) {
    if (%p1 == 1) {
      var %result = $+(%p1,%p2,0) $+(%p1,%p2,9)
    }
    if (%p1 == 2) {
      if (%p2 <= 4) { var %result =  $+(%p1,%p2,0) $+(%p1,%p2,9) }
      if (%p2  = 5) { var %result =  $+(%p1,%p2,0) $+(%p1,%p2,5) }
    }
    return %result
  }  
  ; ##*

  ; #?#
  if (%p1 isnum) && (%p2 == ?) && (%p3 isnum) {
    var %n = 0
    if (%p1 == 1) || (%p1 == 2) {
      while %n <= 9 {
        var %result = %result $iif(%result,$chr(44),) $+(%p1,%n,%p3) $+(%p1,%n,%p3)
        inc %n
        if (%p1 = 2) && (%n = 5) { break }
      }  
      if (%p1 = 2) && (%p3 <= 5) { var %result = %result , $+(%p1,%n,%p3) $+(%p1,%n,%p3) }
    }
    return %result
  }  
  ; ?##
  if (%p1 == ?) && (%p2 isnum) && (%p3 isnum) {
    var %n = 1
    while %n <= 2 {
      var %num = $+(%n,%p2,%p3)
      if %num <= 255 {
        var %result = %result $iif(%result,$chr(44) %num %num,%num %num)
      }
      inc %n
    }
    return %result
  }
  ; ##*
  if (%p1 isnum) && (%p2 isnum) && (%p3 == *) {
    if (%p1 > 0) { var %result = %p1 $+ %p2 %p1 $+ %p2 }
    if (%p1 = 1) { var %result = %result $chr(44) $+(%p1,%p2,0) $+(%p1,%p2,9) }
    if (%p1 = 2) {
      ;var %result = %p1 $+ %p2 %p1 $+ %p2
      if (%p2 < 5) { var %result = %result $chr(44) $+(%p1,%p2,0) $+(%p1,%p2,9) }
      if (%p2 = 5) { var %result = %result $chr(44) $+(%p1,%p2,0) $+(%p1,%p2,5) }
    }
    return %result
  }  
  ; #*#
  if (%p1 isnum) && (%p2 == * ) && (%p3 isnum) {
    if (%p1 > 0) { var %result = %p1 $+ %p3 %p1 $+ %p3 }
    if (%p1 = 1) { 
      var %n = 0
      while %n <= 9 {
        var %result = %result $chr(44) $+(%p1,%n,%p3) $+(%p1,%n,%p3) 
        inc %n
      }
    }
    if (%p1 = 2) {
      var %n = 0
      while %n <= 4 {
        var %result = %result $chr(44) $+(%p1,%n,%p3) $+(%p1,%n,%p3) 
        inc %n            
      }
      if (%p3 <= 5) { var %result = %result $chr(44) $+(%p1,%n,%p3) $+(%p1,%n,%p3) }
    }
    return %result
  }  
  ; *##
  if (%p1 == *) && (%p2 isnum) && (%p3 isnum) {
    if (%p2 > 0) { var %result = %p2 $+ %p3 %p2 $+ %p3 }
    var %result = %result $iif(%result,$chr(44),) $+(1,%p2,%p3) $+(1,%p2,%p3)
    if (%p2 <= 4) { var %result = %result $iif(%result,$chr(44),) $+(2,%p2,%p3) $+(2,%p2,%p3) }
    if (%p2 == 5) && (%p3 <= 5)  { var %result = %result $chr(44) $+(2,%p2,%p3) $+(2,%p2,%p3) }
    return %result
  }
  ; ??# = 10# , 11#,,,24# , (if #<=5) 25#
  if (%p1 == ?) && (%p2 == ?) && (%p3 == *) {
    var %n = 10
    while (%n <= 24) {
      var %result = %result $iif(%result,$chr(44),) %n $+ %p3 %n $+ %p3
      inc %n
    }
    if (%p3 <= 5) { var %result = %result $chr(44) 25 $+ %p3 25 $+ %p3 }
    return %result
  }  
  ; ?#? = 1#0~1#9 , (if #<=4) 2#0~2#9 , (if #=5) 2#0~2#5
  if (%p1 == ?) && (%p2 isnum) && (%p3 == ?) {
    var %result = $+(1,%p2,0) $+(1,%p2,9)
    if (%p2 <= 4) { var %result = %result $chr(44) $+(2,%p2,0) $+(2,%p2,9) }
    if (%p2 == 5) { var %result = %result $chr(44) $+(2,%p2,0) $+(2,%p2,5) }
    return %result
  }  
  ; #?? = (if #=1) 100~199 , (if #=2) 200~255
  if (%p1 isnum) && (%p2 == ?) && (%p3 == ?) {
    if (%p1 == 1) { var %result = 100 199 }
    if (%p1 == 2) { var %result = 200 255 }
    return %result
  }  
  ; *#* = # , 1# , 2#,,,9# , 10# , (complicated)
  if (%p1 == *) && (%p2 isnum) && (%p3 == *) {
    var %result = %p2 %p2, %n = 1
    while %n <= 9 {
      if (%n == %p2) { var %result = %result $chr(44) $+(%n,0) $+(%n,9) }
      else { var %result = %result $chr(44) $+(%n,%p2) $+(%n,%p2) } 
      inc %n
    }
    if     (%p2 == 1) { var %result = %result $chr(44) 100 199 $chr(44) 201 201 $chr(44) 210 219 $chr(44) 221 221 $chr(44) 231 231 $chr(44) 241 241 $chr(44) 251 251 }
    elseif (%p2 == 2) { var %result = %result $chr(44) 102 102 $chr(44) 112 112 $chr(44) 120 129 $chr(44) 132 132 $chr(44) 142 142 $chr(44) 152 152 $chr(44) 162 162 $chr(44) 172 172 $chr(44) 182 182 $chr(44) 192 192 $chr(44) 200 255 }
    else {
      var %n = 0
      while %n <= 9 {
        if (%n == %p2) { var %result = %result $chr(44) $+(1,%n,0) $+(1,%n,9) }
        else { var %result = %result $chr(44) $+(1,%n,%p2) $+(1,%n,%p2) } 
        inc %n
      }
      var %n = 0
      while %n <= 4 {
        if (%n == %p2) { var %result = %result $chr(44) $+(2,%n,0) $+(2,%n,9) }
        else { var %result = %result $chr(44) $+(2,%n,%p2) $+(2,%n,%p2) } 
        inc %n
      }
      if (%p2 <= 5) {   
        if (%p2 != 5) { var %result = %result $chr(44) $+(2,%n,%p2) $+(2,%n,%p2) }
        else { var %result = %result $chr(44) 250 255 }

      }
    }
    if (%p2 == 0) { 
      var %result = $reptok(%result,$+($chr(32),100 109,$chr(32)),100 110,1,44)
      var %result = $remtok(%result,$+($chr(32),110 110,$chr(32)),1,44) 

      ;var %result = $replace(%result,100 109,100 110) 
      ;var %result = $replace(%result,110 110 $chr(44),) 
    }
    if (%p2 = 9) {
      var %result = $reptok(%result,$+($chr(32),89 89,$chr(32)),89 99,1,44)
      var %result = $remtok(%result,$+($chr(32),90 99,$chr(32)),1,44) 
    }
    return %result
  }  
  ; *?# = 1# , 2#,,,9# , 10# , 11# , 12#,,,19# , 20# , 22# , 23# ,24# , (if #<=5) 25#
  if (%p1 == *) && (%p2 == ?) && (%p3 isnum) {
    var %n = 1
    while (%n <= 9) {
      var %result = %result $iif(%result,$chr(44),) $+(%n,%p3) $+(%n,%p3) 
      inc %n
    }
    var %n = 0
    while (%n <= 9) {
      var %result = %result $chr(44) $+(1,%n,%p3) $+(1,%n,%p3) 
      inc %n
    }
    var %n = 0
    while (%n <= 4) {
      var %result = %result $chr(44) $+(2,%n,%p3) $+(2,%n,%p3) 
      inc %n
    }
    if (%p3 <= 5) { var %result = %result $chr(44) $+(2,%n,%p3) $+(2,%n,%p3) }
    return %result
  }  
  ; *#? = #0~#9 , 1#0~1#9 , (if #<=4) 2#0~2#9 , (if #=5) 250~255
  if (%p1 == *) && (%p2 isnum) && (%p3 == ?) {
    if (%p2 != 0) { var %result = $+(%p2,0) $+(%p2,9) }
    var %result = %result $iif(%result,$chr(44),) $+(1,%p2,0) $+(1,%p2,9)
    if (%p2 <= 4) { var %result = %result $chr(44) $+(2,%p2,0) $+(2,%p2,9) }
    if (%p2 == 5) { var %result = %result $chr(44) $+(2,%p2,0) $+(2,%p2,5) }
    return %result
  }  
  ; ?*# = 1# , 2# , 3# , 4#,,,9# , 10# , 11#,,,19# , 20#,,,24# , (if #<=5) 25#
  if (%p1 == ?) && (%p2 == *) && (%p3 isnum) {
    var %n = 1
    while (%n <= 24) {
      var %result = %result $iif(%result,$chr(44),) $+(%n,%p3) $+(%n,%p3)
      inc %n
    }
    if (%p3 <= 5) { var %result = %result $chr(44) $+(%n,%p3) $+(%n,%p3) }
    return %result
  }  
  ; ?#* = 1# , 2# 3#,,,9# , 1#0~1#9 , (if #<=4) 2#0~2#9 , (if #=5) 250~255
  if (%p1 == ?) && (%p2 isnum) && (%p3 == *) {
    var %n = 1
    while (%n <= 9) {
      var %result = %result $iif(%result,$chr(44),) $+(%n,%p2) $+(%n,%p2)
      inc %n
    }
    var %result = %result $chr(44) $+(1,%p2,0) $+(1,%p2,9)
    if (%p2 < 5) { var %result =  %result $chr(44) $+(2,%p2,0) $+(2,%p2,9) }
    if (%p2 = 5)  { var %result = %result $chr(44) $+(2,%p2,0) $+(2,%p2,5) }
    return %result
  }  
  ; #*? = #?* = #0~#9 , (if #=1) 100~199 , (if #=2) 200~255
  if (%p1 isnum) && (((%p2 == *) && (%p3 == ?)) || (((%p2 == ?) && (%p3 == *)))) {
    if (%p1 > 0) {
      var %result = $+(%p1,0) $+(%p1,9)
      if (%p1 == 1) { var %result = %result $chr(44) 100 199 }
      if (%p1 == 2) { var %result = %result $chr(44) 200 255 }
    }

    return %result
  }  
}  

ALIAS ip2c.wildtest {
  var %start = $ticks, %t = *1*, %m = 100, %n = %m
  while %n {
    !.echo -q $ip2c.verify.wildcard(%t)
    ;!.echo -q $ip2c.wild.process(%t)

    dec -z %n
  }
  var %time = $calc(($ticks - %start) / (%m))
  var %lookup = $calc(%time * (%m / 1000))
  return $ip2c.verify.wildcard(%t) // Time taken for %m lookups ( %lookup secs ): %time ms per lookup
}



ALIAS ip2c.v.stars {
  var %n = 0
  while %n <= 99 {
    var %c = $+(1,%n)
    $iif(1?? iswm %c,echo 3 -gs %c == $v1,echo 4 -gs %c != $v1)    
    inc %n
  }
  echo = %n
}


ALIAS ip2c.wild.question {
  if ($1 == ?) { return 0 1 2 }
  if ($1 == ??) { return 0 99 }   
  if ($1 == ???) { return 0 225 }
}




;### GROUP START #ip2c.notice
;### For respone to !ip by Notice
#ip2c.notice off

on *:NOTICE:!ip *:*: { 
  ip2c.echo.msg $nick sent you a notice of $1-
  var %chan = $nick
  var %result = $ip2c($2).cccountry
  if (%result != $null) {
    var %cc = $gettok(%result,1,32), %country = $gettok(%result,2-,32)
    ;notice %chan $result
    ; ### Left this line in to give the option to turn off $comchan lookup
    ;if ($group(#ip2c.ComChan) == on) {
    if ($true) {
      var %ip.comchans = $ip2c.ial.check($2)
      ;if (%ip.comchans) { notice %chan Nick: %ip.comchans has IP: $2  }
    }
    notice %chan IP: $2 is from %country ( $+ %cc $+ ) $iif(%ip.comchans,: Nick with this IP is %ip.comchans,)
  } 
  else { notice %chan IP: $2 : Country not found }
}

#ip2c.notice end
;### GROUP END #ip2c.notice

;### GROUP START #ip2c.country
;### For respone to !country
#ip2c.country off

on *:TEXT:!country *:%ip2c.channels: { 
  var %chan, %country, %lookup
  var %lookup = $upper($remove($2,$chr(46)))
  if ($chan) { var %chan = $chan }
  elseif ($query($nick)) { var %chan = $nick }
  elseif ($chat($nick)) { var %chan = $nick }
  else { ip2c.echo.NotFound Error from ON TEXT !country - don't know where to send reply - from on *:TEXT:!country }

  if (%lookup == $null) { .notice $nick Country Code Input is Empty }
  elseif (%lookup !isalnum) { .notice $nick Country Code Input must be only Numbers or Letters }
  elseif ($len(%lookup) > 2) { 
    var %find = $+(*,%lookup,*)
    var %num = $hfind(ip2c.LOOKUP,%find,0,w).data, %found, %result
    while %num {
      var %found = $hfind(ip2c.LOOKUP,%find,%num,w).data
      var %found = $ip2c.lookup.LOOKUP.hash(%found)
      var %result = $iif(%result && %found,%result AND %found,%found) 
      if ($len(%result) > 200) {
        msg %chan Country Code: %lookup - %result
        var %result
      }     
      ;msg %chan Country Code: %lookup - $ip2c.lookup.LOOKUP.hash(%found) 
      dec -z %num
    }
    msg %chan Country Code: %lookup - %result
  }
  elseif ($len(%lookup) > 50) { .notice $nick Country Code Input Length is too long }
  elseif ($len(%lookup) == 2) {
    var %result = $ip2c.lookup.LOOKUP.hash(%lookup)
    var %cc = $gettok(%result,1,32), %country = $gettok(%result,2-,32)
    if (%country != $null) {
      msg %chan %cc is %country
    }
    else { msg %chan %lookup is not a valid Country Code }
  }
}

; This alias below is now redundant
ALIAS ip2c.lookup.country {
  ;Country Code
  var %lookup.country.name $readini($+(",$scriptdir,ip2country.lookup.ini,"),n,$1,country)
  return $1 %lookup.country.name
}


#ip2c.country end
;### GROUP END #ip2c.country


ALIAS country { 
  var %lookup = $upper($remove($1,$chr(46)))
  if (%lookup == $null) { ip2c.echo.NotFound Country Code Input is Empty }
  elseif (%lookup !isalnum) { ip2c.echo.NotFound Country Code Input must be only Numbers or Letters }
  elseif ($len(%lookup) > 2) { 
    var %find = $+(*,%lookup,*)
    var %num = $hfind(ip2c.LOOKUP,%find,0,w).data
    if (!%num) {  ip2c.echo.NotFound %lookup does not match any country }
    while %num {
      var %found = $hfind(ip2c.LOOKUP,%find,%num,w).data
      ip2c.echo.result Country Code: %lookup - $ip2c.lookup.LOOKUP.hash(%found) 
      dec -z %num
    }
    linesep %ip2c.echo.result.place
  }
  elseif ($len(%lookup) > 40) { ip2c.echo.NotFound Country Code Input Length is too long }
  elseif ($numtok(%lookup,46) == 1) {
    var %result = $ip2c.lookup.LOOKUP.hash(%lookup)
    var %cc = $gettok(%result,1,32), %country = $gettok(%result,2-,32)
    if (%country != $null) { ip2c.echo.result %cc is %country | linesep %ip2c.echo.result.place }
    else { ip2c.echo.NotFound %lookup is not a valid Country Code | linesep %ip2c.echo.result.place }
  }
}

on *:DNS:{
  var %dns = $dns(0), %n = 1, %r, %result, %result.cc, %cc
  var %resolved.address = $raddress
  if $longip($address) { var %result = $raddress, %result.cc = $ip2c($address).cc | GOTO Finished } 

  while (%n <= %dns) {

    var %r = $dns(%n).ip, %cc = $ip2c(%r).cc, %unresolved.cc = $ip2c($address).cc
    var %result = $iif(%result == $null,$+($chr(2),%r,$chr(2)),$iif(%r,$+(%result,$chr(44),%r))) 
    var %result.cc = $iif(%result.cc,%result.cc,%cc)

    var %result.cc = $iif($istok(%result.cc,%cc,32),%result.cc,%result.cc %cc)
    inc %n
  }  
  :Finished
  var %unresolved.cc = $iif(%result.cc,%result.cc,$ip2c($address).cc)
  if ($group(#ip2c.DNS.long) == on) || %ip2c.temp.dnsL. [ $+ [ $address ] ] {
    if $nick { echo 3 -gsc o Nickname queried: $nick }
    echo -sc o Address queried: $address
    echo -sc o Full Resolved list: $iif(($raddress == $null), Dns unable to resolve address,%result)
    echo -sc o Queried Country: $iif(%result.cc,%result.cc,$iif($ip2c($address).cc,$ip2c($address).cc,))
    linesep -s
    unset %ip2c.temp.dns. [ $+ [ $address ] ] | unset %ip2c.temp.dnsL. [ $+ [ $address ] ]
    halt
  }

  elseif ($group(#ip2c.DNS) == on) || (%ip2c.temp.dns. [ $+ [ $address ] ] )  { 
    echo -stec o $iif($raddress,* Dns resolved $dns(1) to $raddress $iif(%result.cc,$chr(40) $+ %result.cc $+ $chr(41),),* Dns unable to resolve address $address $iif(%unresolved.cc,( $+ %unresolved.cc $+ ),)) 
    unset %ip2c.temp.dns. [ $+ [ $address ] ] | unset %ip2c.temp.dnsL. [ $+ [ $address ] ]
    halt
  }
} 

ALIAS ipdns {
  set %ip2c.temp.dns. [ $+ [ $1 ] ] $true
  dns $1
}
ALIAS ipdnsL {
  set %ip2c.temp.dnsL. [ $+ [ $1 ] ] $true
  dns $1
}

;### GROUP START #ip2c.DNS
;### For respone to /dns
#ip2c.DNS on

#ip2c.DNS end
;### GROUP END #ip2c.DNS 

#ip2c.DNS.long on
#ip2c.DNS.long end

; Receives parameters $dns(0) $address $raddress $dns(%n).ip
ALIAS ipdns {
  tokenize 32 $1-
  var %dns = $1, %address = $2, %resolved.address = $3, %n = 1, %r, %result, %result.cc, %cc
  if $longip(%address) { var %result = %resolved.address, %result.cc = $ip2c(%address).cc | GOTO FINISHED }



  :FINISHED

}

;######################### ALIASES for ON TEXT !ip ########################
;#                                                                        #
;#  These are:                                                            #
;#     /verify.ip2c.files.exist - Just checks the IP data file exists     #
;#     /ip2c.verify.ip.input - Simple check to see the IP is valid number #
;#     /ip2c.verify.ip.hidden - Looks for ex. users.undernet.org          #
;#     /ip2c.ial.check - Checks the /ial for $comchans for the IP         #
;#     /ip2country.suxs - A silly message incase the script goes wrong    #
;#                                                                        #
;##########################################################################

ALIAS verify.ip2c.files.exist {
  if ($isfile($+(",$scriptdir,ip2country.txt,"))) && ($isfile($+(",$scriptdir,ip2country.lookup.ini,"))) return 
  if (!$isfile($+(",$scriptdir,ip2country.txt,"))) { var %ip2c.file.missing.1 = ip2country.txt }
  if (!$isfile($+(",$scriptdir,ip2country.lookup.ini,")))     { var %ip2c.file.missing.2 = ip2country.lookup.ini }
  if ((%ip2c.file.missing.1) || (%ip2c.file.missing.2)) { 
    return File-s: %ip2c.file.missing.1 %ip2c.file.missing.2 is/are not installed in the right place.
  }
}


;### Input is numeric IP and output is a message if it is wrong - and no reply if it is OK
ALIAS ip2c.verify.ip.input {
  if ($1 == $null) { return You didn't specify an IP to Lookup }
  elseif ($longip($1) == 0) { return Very funny - who has an Ip of $1 ? }
  elseif ($longip($1) !isnum) { return IP: $1 is not a proper IP }
  return $null
}

;ALIAS ip2c.alpha.country.get {
;  var %ip.end = $upper($gettok($1,$gettok($1,0,46),46))
;  if (($len(%ip.end ) == 2) && (%ip.end isalpha)) {
;    ;var %ip.country = $readini($+(",$scriptdir,ip2country.lookup.ini,"),n,%ip.end,country)
;    var %ip.country = $hget(ip2c.LOOKUP,%ip.end)
;    return $iif(%ip.country,%ip.end %ip.country,$null)
;    ;return %ip.end %ip.country
;  }
;  else { return $null }
;}


ALIAS ip2c.IPv4.IPv6 {
  if ($version > 7) {
    return $iptype($1)
  }
  else {
    if ($numtok($1,58) > 1) { return ipv6 }
    elseif ($numtok($1,46) = 4) && ($longip($1) isnum) { return ipv4 }
  }
}

ALIAS ip2c.verify.ip.hidden {
  var %hidden = $null, %hidden.token = $gettok($1,$calc($gettok($1,0,46) -2) $+ - $+  $gettok($1,0,46),46), %hidden.ip = $gettok($1,-1,46)
  ; Verify if the last 3 tokens are users.undernet.org
  ; echo 4 -gs hidden.ip= %hidden.ip // hidden.token= %hidden.token // 1= $1-
  if ($network == undernet) { var %hidden = $iif(%hidden.token == users.undernet.org,$true,$null) }
  if ($network == quakenet) { var %hidden = $iif(%hidden.token == users.quakenet.org,$true,$null) }
  if ($network == SwiftIRC) { 
    if ($gettok(%hidden.token,-1,46) == IP) { var %hidden = $true }
    elseif (%hidden.token == users.swiftirc.net) { var %hidden = $true  }
  }
  if ($network == freenode) { var %hidden = $iif(/ isin $1,$true,$null) }
  if ($network == What-Network) { var %hidden = $iif(*.what.cd,$true iswm %hidden.token,$null) }
  ; 
  return %hidden
}

#ip2c.2nd.Level.Domains on
#ip2c.2nd.Level.Domains end

; Receives the 2nd level domain parameter - such as - quality.net
ALIAS ip2c.verify.ip.2nd.Level.Domain {
  var %ip2c.tld.check = $gettok($1,$gettok($1,0,46),46)
  var %ip2c.2ld.check = $gettok($1,$calc($gettok($1,0,46) - 1) $+ -,46)
  ;echo = %ip2c.tld.check // %ip2c.tld2.check
  var %lookup = $hget(ip2c.LOOKUP,%ip2c.2ld.check)
  if (%lookup) { 
    var %country = $hget(ip2c.LOOKUP,%lookup)
    return %lookup %country 
  }
  else { return $null }  
}

ALIAS ip2c.verify.ip.TLD {
  tokenize 32 $1-
  var %ip2c.tld.check = $gettok($1,$gettok($1,0,46),46)
  var %ip2c.TLDs = com net org edu gov mil arpa info biz mobi tel pro asia name aero cat coop jobs museum travel int xxx
  if ($istok(%ip2c.TLDs,%ip2c.tld.check,32)) {
    if ($2 != result) {  
      return The IP: $1 is from a nickname that has the $upper(%ip2c.tld.check) Top Level Domain. At present these cannot be looked up quickly so this will not be processed.
    }
    else { return %ip2c.TLDs }
  }
  else { return $null }
}

;if ($istok(%var,com net org edu gov info biz,32))

;### receives parameter IP 
;### returns the Nickname(#Channels) of the common channels that IP is on
ALIAS ip2c.ial.check {
  if ($longip($1) isnum) { var %wildsite = *!*@ $+ $1 }
  elseif ($len($1) isnum 2-4) {
    if ($left($1,1) != $chr(46)) { var %wildsite = *!*@*. $+ $1 }
    ;CHANGED on 16-Sep-2010 from *!*@ TO *!*@* 
    else { var %wildsite = *!*@ $+ $1 }
  }
  else { var %wildsite = *!*@ $+ $1 }
  var %nn = $ial(%wildsite,0), %nick.chans
  while (%nn > 0) { 
    var %nick = $ial(%wildsite,%nn).nick
    if (%nn = 1) { var %lookup.nick %nick | var %lookup.chan $comchan(%nick,1) }
    var %cc = $comchan(%nick,0), %n.chans, %comchan.chans
    while (%cc > 0) { 
      var %n.chans = %n.chans $comchan(%nick,%cc)
      var %comchan.chans =  $addtok(%comchan.chans,$comchan(%nick,%cc),32)
      dec %cc
    }
    var %nick.chans = %nick.chans %nick ( $+ %n.chans $+ )
    dec %nn
  }
  var %lookup.comchans.chans %comchan.chans
  var %lookup.nick.chans %nick.chans
  var %lookup.wildsite.ip $ial(%wildsite,0)
  return %lookup.nick.chans
}


; This Group and IP is for a one of use of extraction of a number from a Alpha type IP
; Extraction example is ex. ip68-100-148-4.dc.dc.cox.net extracts to 68.100.148.4
; As it can give wrong results, it has to be asked for manually

#ip2c.host2ip on

ALIAS ip2c.host2ip { .disable #ip2c.host2ip | return $true }

#ip2c.host2ip end

; This alias kindly (and annoyingly) provided by liner of #mirc undernet !
; Will extract an IP from this: //echo = $host2ip(ip68-100-148-4.dc.dc.cox.net)

ALIAS host2ip {
  var %r = /(\d{1,3})[.-]((?1))[.-]((?1))[.-]((?1))/
  if $regex($1, %r) {
    var %extracted = $+($regml(1), ., $regml(2), ., $regml(3), ., $regml(4))
    if $longip(%extracted) > 0 { return %extracted }
  }
  else { return $null }
}

;### This Alias pops up a window that shows all the country names of those on a channel

ALIAS ip2c.channel.info {
  var %ch = $iif($1,$1,#)
  var %window = @ip2c. $+ %ch
  if ($window(%window)) { window -c %window }
  ; To fix the tab spacing in versions 6.35 and below
  if ($version < 7) { var %tab = -t15,30 }
  else { var %tab = -t30,90 }
  /window -Cel %tab %window 300 200 800 300 @ip2c.channel Arial 11

  var %nicks = $nick(%ch,0), %line = 1
  /titlebar %window Nicks: ( $+ %nicks $+ )  Ops: ( $+ $nick(%ch,0,o) $+ ) Voiced: ( $+ $nick(%ch,0,v,o) $+ ) Regular: ( $+ $nick(%ch,0,a,ov) $+ ) IAL ( $+ $iif($chan(%ch).ial,Full,Not Full !!!) $+ )
  if (!$chan(%ch).ial) {
    aline %window %ch $chr(9) Country Names & other info
    aline 4 %window Your IAL (Internal Address List) for Channel %ch is not updated.
    aline 4 %window You can either type this in your status window-->  /who %ch
    aline 4 %window Or right click in %ch and use the Popop: ip2c // Utilities // Update # IAL
  }
  var %draw.line = ==  ======= $chr(9) =============== $chr(9) ============
  aline %window %ch $chr(9) Country Names & other info
  aline %window %draw.line
  aline %window CC  Nickname $chr(9) Common Channels $chr(9) *!*user@host
  aline %window %draw.line
  while (%line <= %nicks) {
    var %addy = $address($nick(%ch,%line),1)
    var %comchan = $ip2c.common.channels($nick(%ch,%line))
    var %cc = $ip2c(%addy).cc
    var %hidden = $ip2c.verify.ip.hidden(%addy)
    var %show.cc = $iif(%hidden,4xx,$iif(%cc,%cc,. .))
    aline %window $iif(%cc,%cc ..,.. .. . ) $nick(%ch,%line).pnick  $chr(9) $iif(%comchan,%comchan, ) $chr(9) $chr(40) $+ %show.cc $+ $chr(41) %addy  

    ;aline %window $iif(%cc,%cc ..,.. .. . ) $nick(%ch,%line).pnick  $chr(9) $iif(%comchan,%comchan, ) $chr(9) $chr(40) $+ $iif(%cc,%cc,. .) $+ $chr(41) %addy  
    inc %line
  }
}

ALIAS ip2c.common.channels {
  var %nick = $1, %total.com.chans = $comchan(%nick,0), %com.com
  while (%total.com.chans != 0) {
    var %com.com = %com.com $comchan(%nick,%total.com.chans)
    dec %total.com.chans
  }
  return %com.com
}



;### Popup Menu for the Channel Country Info custom window @ip2c. $+ #

menu @ip2c.channel {
  dclick: whois $remove($gettok($gettok($line($active,$$1-),1,9),-1,46),@,+,%)
  $style(2) Nicknames in $gettok($line($active,1),1,9):return
  -
  Nickname - $gettok($$1-,1,9)
  .$style(2) $gettok($$1-,1,9):return
  .$style(2) $gettok($line($active,1),1,9):return
  .-
  .Get Nick: echo = $gettok($gettok($$1-,1,9),-1,46)
  .Whois: whois $remove($gettok($gettok($$1-,1,9),-1,46),@,+,%)
  .Whois (with idle):var %nick = $remove($gettok($gettok($$1-,1,9),-1,46),@,+,%) | whois  %nick %nick
  .Who: who $remove($gettok($gettok($$1-,1,9),-1,46),@,+,%)
  .-
  .Control $gettok($gettok($$1-,1,9),-1,46)
  ..kick:kick $gettok($line($active,1),1,9) $remove($gettok($gettok($$1-,1,9),-1,46),@,+,%) No Reason Given
  ..kickban:ban -k $gettok($line($active,1),1,9) $remove($gettok($gettok($$1-,1,9),-1,46),@,+,%) 2 No Reason Given
  ..ban:ban $gettok($line($active,1),1,9) $remove($gettok($gettok($$1-,1,9),-1,46),@,+,%) 2
  .-
  .dns: dns $remove($gettok($gettok($$1-,1,9),-1,46),@,+,%)
  .Query: query $remove($gettok($gettok($$1-,1,9),-1,46),@,+,%)
  .UWho: uwho $remove($gettok($$1-,1,9),+,@,%)
  .copy nick: clipboard $remove($gettok($gettok($$1-,1,9),-1,46),@,+,%)
  .Select line in chan:var %nick = $remove($gettok($gettok($$1-,1,9),-1,46),@,+,%), %chan = $gettok($line($active,1),1,9)  | sline %chan %nick | window -a %chan
  .CTCP $remove($gettok($gettok($$1-,1,9),-1,46),@,+,%)
  ..$style(2) $gettok($gettok($$1-,1,9),-1,46):return
  ..-
  ..PING: CTCP $remove($gettok($gettok($$1-,1,9),-1,46),@,+,%) PING
  ..VERSION: CTCP $remove($gettok($gettok($$1-,1,9),-1,46),@,+,%) VERSION
  ..FINGER: CTCP $remove($gettok($gettok($$1-,1,9),-1,46),@,+,%) FINGER
  ..-
  .-
  Address
  .$style(2) $gettok($gettok($$1-,1,9),-1,46):return
  .-
  .who IP
  ..$+(*,$remove($gettok($gettok($$1-,1,9),-1,46),@,+,%),*):who $+(*,$gettok($gettok($$1-,3,9),2,64),*)
  .Copy $ $+ address 0
  ..$mask($gettok($$1-,3,9),0): clipboard $mask $gettok($$1-,3,9),0)
  .Copy $ $+ address 1:
  ..$mask($gettok($$1-,3,9),1): clipboard $mask($gettok($$1-,3,9),1)
  .Copy $ $+ address 2
  ..$mask($gettok($$1-,3,9),2): clipboard $mask($gettok($$1-,3,9),2)
  .Copy $ $+ address 3
  ..$mask($gettok($$1-,3,9),3): clipboard $mask($gettok($$1-,3,9),3)
  .Copy $ $+ address 4
  ..$mask($gettok($$1-,3,9),4): clipboard $mask($gettok($$1-,3,9),4)
  .-
  Others
  .Update Titlebar:var %ch = $gettok($line($active,1),1,9) | titlebar $active Nicks: ( $nick(%ch,0) )  Ops: ( $nick(%ch,0,o) ) Voiced: ( $nick(%ch,0,v,o) ) Regular: ( $nick(%ch,0,a,ov) )
  .Update All info:ip2c.channel.info $gettok($line($active,1),1,9)
  .-
  .echo2 line to Status:echo 2 -s $replace($sline($active,1),$chr(9),$chr(32))
  .-
  -
}

ALIAS -l ip2country.suxs { return This Addon suxs. Email Free` of #mIRC Undernet and tell him to get his act together. }

;######################### POPUP MENU ########## START ##################
;#                                                                      #
;#  Popup menu - ip2Country                                             #
;#  Started off simple, but as you can see,                             #
;#  took much more work than ever anticipated                           #
;#                                                                      #
;########################################################################

;### GROUP START #ip2c.popup.result
#ip2c.popup.result on

; This alias allows the Popup Menu to give an immediate result of the Country Name
; With hopefully the least CPU (and delay time) overhead
; Anyway there is an option to switch it off if it is causing any delays
; Needs Parameters: $nick $address
ALIAS ip2c.menu.ip.check {
  unset %ip2c.menu.tmp.msg
  var %result
  tokenize 32 $1-
  ; $1 = $nick
  ; $2= $address
  if ($address($1,2)) {
    if ($longip($gettok($address($1,2),2,64)) isnum) { 
      set %ip2c.menu.tmp.msg $ip2c($gettok($address($1,2),2,64) result)
      var %result = $gettok(%ip2c.menu.tmp.msg,4,44)
      set -u1 %ip2c.menu.tmp.msg $+($chr(40),$upper($gettok(%ip2c.menu.tmp.msg,3,44)),$chr(41))
      set -u1 %ip2c.menu.tmp.chan $ip2c.ial.check($gettok($address($1,2),2,64))
      return %result
    }
    if ($longip($gettok($address($1,2),2,64)) !isnum) { 
      var %result = $ip2c($gettok($address($1,2),2,64) result)
      if (%result) { 
        set -u1 %ip2c.menu.tmp.msg $chr(40) $+ $gettok(%result,1,32) $+ $chr(41)  
        var %result = $gettok(%result,2-,32) 
      }
      else { 
        set %ip2c.menu.tmp.msg $gettok($address($1,2),2,64)
        set -u1 %ip2c.menu.tmp.msg $+($chr(40),$upper($gettok(%ip2c.menu.tmp.msg,$gettok(%ip2c.menu.tmp.msg,0,46),46)),$chr(41))
      }
      set -u1 %ip2c.menu.tmp.chan $ip2c.ial.check($gettok($address($1,2),2,64))
      if (%result) {
        return %result 
      }
      else { return $gettok($address($1,2),2,64) }
    }
  }
  if ($2) {
    if ($longip($gettok($2,2,64)) isnum) { 
      set %ip2c.menu.tmp.msg $ip2c($gettok($2,2,64) result)
      var %result = $gettok(%ip2c.menu.tmp.msg,4,44)
      if (%result) {
        set -u1 %ip2c.menu.tmp.msg $+($chr(40),$upper($gettok(%ip2c.menu.tmp.msg,3,44)),$chr(41))
        set -u1 %ip2c.menu.tmp.chan $ip2c.ial.check($gettok($address($2,2),2,64))
        return %result
      }
    }
    if ($longip($gettok($2,2,64)) !isnum) { 
      var %result = $ip2c($gettok($2,2,64) result)
      set -u1 %ip2c.menu.tmp.msg $+($chr(40),$upper($gettok($2,$gettok($2,0,46),46)),$chr(41))
      set -u1 %ip2c.menu.tmp.chan $ip2c.ial.check($gettok($address($2,2),2,64))
      if (%result) {
        return %result
      }
      else { return $gettok($2,2,64) }
    }
  }
  if ($chat($1).ip) {
    var %ip = $chat($1).ip
    if ($longip(%ip) isnum) { 
      set %ip2c.menu.tmp.msg $ip2c(%ip result)
      var %result = $gettok(%ip2c.menu.tmp.msg,4,44)
      set -u1 %ip2c.menu.tmp.msg $+($chr(40),$upper($gettok(%ip2c.menu.tmp.msg,3,44)),$chr(41))
      set -u1 %ip2c.menu.tmp.chan $ip2c.ial.check(%ip)
      return %result
    }
  }
  return Not Valid Nickname
}
#ip2c.popup.result end
;### GROUP END #ip2c.popup.result

menu channel,nicklist,status,query,menubar {
  $iif($ip.m.status(#ip2c.popup.result) == ON,ip2c $1 %ip2c.menu.tmp.msg,ip2c)
  .$iif(((#) && (!$chan(#).ial)),WARNING - IAL of # incomplete):return
  .$iif(((#) && (!$chan(#).ial)),Use the IAL Updater in the Utilities):return
  .$iif($chan(#).ial,,-)
  .$iif((($ip.m.status(#ip2c.popup.result) == ON) && ($1)),$style(2) $ip2c.menu.ip.check($1 $address)):return
  .$iif((($ip.m.status(#ip2c.popup.result) == ON) && ($1)),$style(2) $iif(%ip2c.menu.tmp.chan,%ip2c.menu.tmp.chan,No comchans)) :return
  .$iif($ip.m.status(#ip2c.popup.result) == ON,-)
  .-
  .Settings && Options: ip2c.dialog
  ..-
  .$iif($gettok($address($1,2),2,64),/ip2c $gettok($address($1,2),2,64),):ip2c $gettok($address($1,2),2,64)
  .$iif($gettok($address($1,2),2,64),/dns $gettok($address($1,2),2,64),):dns $gettok($address($1,2),2,64)
  .$iif($window($active).type == chat,ip2c $chat($1).ip,):ip2c $chat($1).ip
  .$iif($address,ip2c $gettok($address,2,64),): ip2c $gettok($address,2,64)
  .-
  .Display Settings
  ..$style(2) Display Menu:return
  ..-
  ..Disable Check if Remote is On message - $ip.m.status(#ip2c.check.remote.status)
  ...$iif($ip.m.status(#ip2c.check.remote.status) == ON,$style(1)) Switch $ip.m.status(#ip2c.check.remote.status).opp: $ip.m.switch(#ip2c.check.remote.status)
  ..-
  ..Popup - INSTANT Result - $ip.m.status(#ip2c.popup.result)
  ...$iif($ip.m.status(#ip2c.popup.result) == ON,$style(1)) Switch $ip.m.status(#ip2c.popup.result).opp: $ip.m.switch(#ip2c.popup.result)
  ..-
  .-
  .Utilities
  ..$style(2) Utilities Menu:return
  ..-
  ..$iif(#,# All Nick's Details): ip2c.channel.info
  ..-
  ..IAL updating - $ip.m.status(#ip2c.IAL-update)
  ...$iif($ip.m.status(#ip2c.IAL-update) == ON,$style(1)) Switch $ip.m.status(#ip2c.IAL-update).opp: $ip.m.switch(#ip2c.IAL-update)
  ..$iif((($ip.m.status(#ip2c.IAL-update) == ON) && (#)),$iif($chan(#).ial,,Update IAL #))
  ...Slow & Steady Update:/names #
  ...Just Quickly Update the IAL:who #
  ..$iif((($ip.m.status(#ip2c.IAL-update) == ON) && (#)),$iif($chan(#).ial,$style(2) IAL # Already Full))
  ...Slow & Steady Update:/names #
  ...Just Quickly Update the IAL:who #
  ..$iif((($ip.m.status(#ip2c.IAL-update) == OFF) && (#)),$style(2) $iif($chan(#).ial,IAL # Already Full,Update IAL #))
  ...Slow & Steady Update:/names #
  ...Just Quickly Update the IAL:who #
  ..-
  ..Host to IP extraction - $ip.m.status(#ip2c.host2ip)
  ...$style(2) As this can be wrong:return
  ...$style(2) in that the numbers in the Alpha IP:return
  ...$style(2) may not represent the actual IP,:return
  ...$style(2) this has to be manually enabled:return
  ...$style(2) for ONE use at a time only.:return
  ...$iif($ip.m.status(#ip2c.host2ip) == ON,Disable Immediately,Enable for 1 extraction)
  ....$iif($ip.m.status(#ip2c.host2ip) == ON,$style(1)) Switch $ip.m.status(#ip2c.host2ip).opp: $ip.m.switch(#ip2c.host2ip)
  ..-
  ..Benchmark IP lookup speed
  ...$style(2) Engine Usual time is abt 7 ms:return
  ...IP Search Engine only: ip2c.overhead.test engine 100
  ...-
  ...$style(2) Alias Usual time is abt 11 ms:return
  ...ip2c full Alias: ip2c.overhead.test alias 100
  ...-
  ...$style(2) Results in Status Window:return
  ..-
  ..$iif($ip2c.hash(status),Unload,Load) the HASH file: if ($ip2c.hash(status)) { ip2c.hash free } | else { ip2c.hash make }
  ..$style(2) Convert GeoIP Database:Database.convert.GeoIP.to.ip2c
  ..$style(2) Update Database:run http://ip2country.much.net/
  ..-
  ..ip2country website:run http://www.much.net/forums/viewforum.php?f=45
  ..Get latest GeoIPCountryCSV:run http://geolite.maxmind.com/download/geoip/database/GeoIPCountryCSV.zip
  ..-
  ..Unload script: if ($input(Are you sure you want to unload this script $crlf $+ $nopath($script) ?,y,ip2c: - Unload $nopath($script) ?)) { ip2c.unload }
  .-
  .Info/Help/About
  ..$style(2) Info/Help Menu:return
  ..-
  ..$style(2) Help File:return
  ..$style(2) FAQs:return
  ..$style(2) Website:return
  ..-
  ..Colour Code Help: ip2c.colours.echo | linesep %ip2c.echo.result.place
  ..Fun/Useful Stuff
  ...Find Words of $1:var %nk = $1 | var %ch = # | window @findword | filter -wwcpz %ch @findword * $+ %nk $+ *
  ...Find Word in $active : ip2c.findword $active $1
  ..-
  ..About ip2c
  ...$style(2) About ip2c:return
  ...-
  ...ip2country  :return
  ...ip2c Version %ip2c.Version:return
  ...-
  ...By Free` (#mIRC Undernet):return
  ...-
  ...Forum URL:run http://www.much.net/forums/index.php?c=11
  ...Download Latest Version:run http://www.much.net/forums/viewforum.php?f=33
  ...Bug Reports and Questions:run http://www.much.net/forums/viewforum.php?f=30
  ...Comments:http://www.much.net/forums/viewforum.php?f=31
  ...Suggestions and New Features:run http://www.much.net/forums/viewforum.php?f=32
  ...Website isn't ready yet, Use the Forum:run http://www.much.net/forums/viewforum.php?f=45
  ...$style(2) $ip2c.website:run http://ip2country.much.net/
}
ALIAS ip2c.website return http://ip2country.much.net/ 
ALIAS ip2c.findword { 
  var %nk = $$?="Word", %ch = $active 
  if (%ch = Status Window) { var %switch = -swwcpz } 
  elseif (%ch = Message Window) { var %switch = -dwwcpz } 
  else { var %switch = -wwcpz %ch }
  echo 2 -gs switch= %switch
  window @findword | filter %switch @findword * $+ %nk $+ * | /titlebar @findword in Window: $active  --->  Word: %nk  --->   Matches found: $filtered
}

; t = on TEXT ; m = message/query ; c = on CHAT  ; n = on NOTICE
; j = on JOIN ; p = on PART  ; q = on QUIT
; o = on OPEN ; y = !countrY ; i = Instant result in Popup
; n = common chaN

; a = IAL auto updater on 

;### POPUP Menu Aliases - ip.menu . type (text/query/chat/notice) . status/switch/echo
ALIAS ip.m.text  return $iif($group(#ip2c.text) == on,on,off) $+ / $+ $iif($group(#ip2c.query) == on,on,off) $+ / $+ $iif($group(#ip2c.chat) == on,on,off) $+ / $+ $iif($group(#ip2c.notice) == on,on,off)
ALIAS ip.m.remotes return $iif($group(#ip2c.join) == on,on,off) $+ / $+ $iif($group(#ip2c.part) == on,on,off) $+ / $+ $iif($group(#ip2c.quit) == on,on,off)

;### alias ip.m.status --> needs parameter GroupName --> #ip2c.groupname.EXT
;### Returns the ON/OFF status of a #Group -- and also the opposite of ON/OFF

ALIAS    ip.m.status if ($prop == opp) { var %op1 = OFF, %op2 = ON } | else { var %op1 = ON, %op2 = OFF } | return $iif($group($1) == ON,%op1,%op2)

;### alias ip.m.switch --> needs parameter GroupName --> #ip2c.groupname.EXT
;### Switches a #Group from -- if (ON) { OFF } -or-  if (OFF) { ON } -- and echos the result
;### Ensure that the .EXT of the #GroupName - #ip2c.groupname.EXT - has the same ip.m.EXT.echo alias

ALIAS ip.m.switch $iif($group($1) == on,.disable $1,.enable $1) | ip.m. $+ $gettok($1,2-,46) $+ .echo | linesep %ip2c.echo.result.place

ALIAS ip.m.t.q.c.n.ON.all  { .enable #ip2c.text  #ip2c.query #ip2c.chat #ip2c.notice | ip.m.text.echo }
ALIAS ip.m.t.q.c.n.OFF.all { .disable #ip2c.text #ip2c.query #ip2c.chat #ip2c.notice | ip.m.text.echo }

ALIAS ip.m.j.p.q.ON.all  { .enable #ip2c.join  #ip2c.part #ip2c.quit | ip.m.remotes.echo  }
ALIAS ip.m.j.p.q.OFF.all { .disable #ip2c.join #ip2c.part #ip2c.quit | ip.m.remotes.echo  }

ALIAS ip.m.o.y.i.a.ON.all  { .enable #ip2c.open  #ip2c.country #ip2c.popup.result #ip2c.IAL-update | ip.m.open.echo | ip.m.country.echo | ip.m.popup.result.echo | ip.m.IAL-update.echo }
ALIAS ip.m.o.i.a.ON.y.OFF.rec    { .enable #ip2c.open #ip2c.popup.result #ip2c.IAL-update | .disable #ip2c.country | ip.m.open.echo | ip.m.country.echo | ip.m.popup.result.echo | ip.m.IAL-update.echo }
ALIAS ip.m.o.y.i.a.OFF.all { .disable #ip2c.open #ip2c.country #ip2c.popup.result #ip2c.IAL-update | ip.m.open.echo | ip.m.country.echo | ip.m.popup.result.echo | ip.m.IAL-update.echo }




ALIAS ip.m.switch.ON.recommended  { ip2c.echo.menu $ip2c.g Switching RECOMMENDED $bold(ON)  | linesep %ip2c.echo.result.place | ip.m.t.q.c.n.OFF.all  | ip.m.j.p.q.ON.all  | ip.m.o.i.a.ON.y.OFF.rec | .enable #ip2c.DNS #ip2c.2nd.Level.Domains #ip2c.ComChan #ip2c.Whois #ip2c.Who | .disable #ip2c.country #ip2c.short.cc #ip2c.NOT-FOUND.log #ip2c.NOT.Found.echo #ip2c.Long.IP.Found.Result #ip2c.check.remote.status #ip2c.DNS.long  | linesep %ip2c.echo.result.place   }
ALIAS ip.m.switch.ON.everything  { ip2c.echo.menu $ip2c.g Switching EVERYTHING $bold(ON)  | linesep %ip2c.echo.result.place | ip.m.t.q.c.n.ON.all  | ip.m.j.p.q.ON.all  | ip.m.o.y.i.a.ON.all | .enable #ip2c.country #ip2c.NOT-FOUND.log #ip2c.NOT.Found.echo #ip2c.check.remote.status #ip2c.DNS #ip2c.DNS.long #ip2c.2nd.Level.Domains | linesep %ip2c.echo.result.place   }
ALIAS ip.m.switch.OFF.everything { ip2c.echo.menu $ip2c.g Switching EVERYTHING $bold(OFF) | linesep %ip2c.echo.result.place | ip.m.t.q.c.n.OFF.all | ip.m.j.p.q.OFF.all | ip.m.o.y.i.a.OFF.all | .disable #ip2c.USERHOST #ip2c.country #ip2c.NOT-FOUND.log #ip2c.NOT.Found.echo #ip2c.check.remote.status #ip2c.DNS #ip2c.DNS.long #ip2c.2nd.Level.Domains |linesep %ip2c.echo.result.place  }

ALIAS -l bold return $+($chr(2),$1-,$chr(2))
ALIAS ip2c.g return $+($chr(2),$chr(3),%ip2c.echo.result.col,ip2c:,$chr(3),$chr(2))
ALIAS ip.m.help.echo    ip2c.echo.menu  $ip2c.g The IP to Country addon converts an IP to a country name wherever possible. $bold(The ip2c Settings at present are:)
ALIAS ip.m.text.echo    ip2c.echo.menu  $ip2c.g $bold(!IP) trigger settings $iif($1,are:,updated to:) $bold($+(TEXT,$chr(40),$group(#ip2c.text),$chr(41) / QUERY,$chr(40),$group(#ip2c.query),$chr(41) /  CHAT,$chr(40),$group(#ip2c.chat),$chr(41) /  NOTICE,$chr(40),$group(#ip2c.notice), $chr(41)))
ALIAS ip.m.query.echo   ip.m.text.echo
ALIAS ip.m.chat.echo   ip.m.text.echo
ALIAS ip.m.notice.echo ip.m.text.echo
ALIAS ip.m.remotes.echo ip2c.echo.menu  $ip2c.g $bold(Messages) settings $iif($1,are:,updated to:) $bold($+(JOIN,$chr(40),$group(#ip2c.join),$chr(41) / PART,$chr(40),$group(#ip2c.part),$chr(41) /  QUIT,$chr(40),$group(#ip2c.quit),$chr(41)))
ALIAS ip.m.join.echo ip.m.remotes.echo
ALIAS ip.m.part.echo ip.m.remotes.echo
ALIAS ip.m.quit.echo ip.m.remotes.echo
ALIAS ip.m.open.echo    ip2c.echo.menu  $ip2c.g $bold(/msg) & $bold(/dcc chat) windows settings $iif($1,are:,updated to:) on $bold($+(OPEN,$chr(40),$group(#ip2c.open),$chr(41)))
ALIAS ip.m.country.echo ip2c.echo.menu  $ip2c.g $bold(!country) trigger setting $iif($1,is:,updated to:) $bold($+(COUNTRY,$chr(40),$group(#ip2c.country),$chr(41))) 
ALIAS ip.m.popup.result.echo     ip2c.echo.menu  $ip2c.g $bold(Popup) instant result setting $iif($1,is:,updated to:) $bold($+(POPUP,$chr(40),$group(#ip2c.popup.result),$chr(41)))
ALIAS ip.m.IAL-update.echo ip2c.echo.menu          $ip2c.g $bold(IAL) setting $iif($1,is:,updated to:) $bold($+(IAL,$chr(40),$group(#ip2c.IAL-update),$chr(41)))
ALIAS ip.m.check.remote.status.echo ip2c.echo.menu $ip2c.g $bold(Disable Check if Remote is On) setting $iif($1,is:,updated to:) $bold($+(Disabled ,$chr(40),$group(#ip2c.check.remote.status),$chr(41)))

ALIAS ip.m.host2ip.echo    ip2c.echo.menu  $ip2c.g $bold(host2ip) setting $iif($1,is:,updated to:) $bold($+(host2ip,$chr(40),$group(#ip2c.host2ip),$chr(41)))


ALIAS ip.m.colours.echo {
  var %bk = $chr(2) $+ $chr(3), %kb = $chr(3) $+ $chr(2)
  ip2c.echo.menu  $ip2c.g $bold(Message colours) settings $iif($1,are:,updated to:) %bk $+ %ip2c.echo.result.col RESULT Colour $+ %kb / %bk $+ %ip2c.echo.msg.col MESSAGES Colour %kb / %bk $+ %ip2c.echo.NotFound.col NOT-FOUND Colour %kb / Message echo place $bold(%ip2c.echo.result.place)
}
ALIAS ip.m.channels.echo ip2c.echo.menu  $ip2c.g $bold(Active Channels) settings $iif($1,are:,updated to:) $bold($+(CHANNELS,$chr(40),%ip2c.channels,$chr(41)))

ALIAS ip.m.channels.echo {
  var %bk = $chr(2) $+ $chr(3), %kb = $chr(3) $+ $chr(2)
  ip2c.echo.menu  $ip2c.g settings for Active Channels updated to %bk $+ %ip2c.echo.channels CHANNELS $+ %kb / %bk $+ %ip2c.echo.msg.col CHANNELS Colour %kb / %bk $+ %ip2c.echo.NotFound.col NOT-FOUND Colour %kb
}


ALIAS ip.m.show.all.settings ip.m.help.echo | linesep %ip2c.echo.result.place | ip.m.text.echo s | ip.m.remotes.echo s | ip.m.open.echo s | ip.m.country.echo s | ip.m.popup.result.echo s | ip.m.IAL-update.echo s | ip.m.colours.echo s | ip.m.channels.echo s |linesep %ip2c.echo.result.place

ALIAS ip2c.change.defaults { 
  tokenize 32 $1-
  var %result = $input(Please only change this if $&
    $crlf $+ you know what new values you want $&
    $crlf $+ $iif($2 == CHANNELS,Channels entered as $+(#chan1,$chr(44),#chan2,$chr(44),#chan3)) $&
    $iif($2 == COLOUR,Colours entered as a colour number) $&
    $iif($2 == ECHO,Echo entered as per the normal /echo alias options) $&
    $crlf $+ $crlf $+ Enter the New $2 for $3 $crlf $+ or press YES to keep $2 --> $1 <-- for $3,en,DOMAIN input Box,$1)
  if ($2 == COLOUR) { return $iif(%result isnum 0-15,%result,$1) }
  elseif ($2 == ECHO) { return $iif(%result != $null,%result,$1) }
  elseif ($2 == CHANNELS) { return $iif(%result != $null,%result,$1) }
}

ALIAS ip2c.colours.echo { 
  var %k = $chr(3), %b = $chr(2), %bo = $chr(40), %bc = $chr(41)
  ip2c.echo.menu Colour codes are:   $+(%b,%bo %k,0) $+ ,1 $+( 0 %k,1) $+ ,0 $+(1 %k,2 2 %k,3 3 %k,4 4 %k,5 5 %k,6 6 %k,7 7 %k,8 8 %k,9 9 %k,10 10 %k,11 11 %k,12 12 %k,13 13 %k,14 14 %k,15 15 %k,%bc,%b)
}

;### Sets the Default Colours and Place of the ECHO messages

ALIAS ip2c.echo.msg { 
  if ((!%ip2c.echo.msg.col) || (!%ip2c.echo.result.place))  { ip2c.default.echo.colour }
  echo %ip2c.echo.msg.col %ip2c.echo.result.place $1-
}

ALIAS ip2c.echo.result { 
  if ((!%ip2c.echo.result.col) || (!%ip2c.echo.result.place))  { ip2c.default.echo.colour }
  echo %ip2c.echo.result.col %ip2c.echo.result.place $1-
}

ALIAS ip2c.echo.NotFound { 
  if ((!%ip2c.echo.NotFound.col) || (!%ip2c.echo.result.place))  { ip2c.default.echo.colour }
  echo %ip2c.echo.NotFound.col %ip2c.echo.result.place $1-
}

ALIAS ip2c.echo.menu { 
  if ((!%ip2c.echo.msg.col) || (!%ip2c.echo.result.place))  { ip2c.default.echo.colour }
  echo %ip2c.echo.msg.col %ip2c.echo.result.place $+ t $1-
}
; 
ALIAS ip2c.default.echo.colour { 
  ; If the personal settings file exists, use the colours from there, else, take Script defaults.
  var %file = $+(",$scriptdirip2country.lookup.personal.ini,")
  if $file(%file) {
    var %r  = $readini(%file,n,variables,ip2c.echo.result.col)
    var %m  = $readini(%file,n,variables,ip2c.echo.msg.col)
    var %nf = $readini(%file,n,variables,ip2c.echo.NotFound.col)
    var %p  = $readini(%file,n,variables,ip2c.echo.result.place)
  }
  ; var %r = 9, %m = 2, %nf = 4, %p = -gs
  var %r = $iif(%r,%r,9), %m = $iif(%m,%m,2), %nf = $iif(%nf,%nf,4), %p = $iif(%p,%p,-gs)

  if ($1 = result) { return %r }
  elseif ($1 = msg) { return %m }
  elseif ($1 = NotFound) { return %nf }
  elseif ($1 = place) { return %p }

  else {  
    ;### The default RESULT colour is an obnoxious Bright Green (9)
    if (%ip2c.echo.result.col == $null) { set %ip2c.echo.result.col %r }
    ;### The default MSG colour is a Navy Blue (2)
    if (%ip2c.echo.msg.col == $null) { set %ip2c.echo.msg.col %m }
    ;### The default NOT FOUND colour is a Red (4)
    if (%ip2c.echo.NotFound.col == $null) { set %ip2c.echo.NotFound.col %nf }
    ;### The default PLACE of the ECHOs is the Status Window
    if (%ip2c.echo.result.place == $null) { set %ip2c.echo.result.place %p }
  }
}
; This was a test to hold ALL variables - and is not being used
ALIAS ip2c.echo {
  if ($prop == result) { return $gettok(%ip2c.variables,2,44) }
  if ($prop == msg) { return $gettok(%ip2c.variables,3,44) }
  if ($prop == NotFound) { return $gettok(%ip2c.variables,4,44) }
  if ($prop == place) { return $gettok(%ip2c.variables,5,44) }
  if ($prop == reserved1) { return $gettok(%ip2c.variables,6,44) }
  if ($prop == reserved2) { return $gettok(%ip2c.variables,7,44) }
  if ($prop == reserved3) { return $gettok(%ip2c.variables,8,44) }
  if ($prop == ch) { return $gettok(%ip2c.variables,9-,44) }

  ;  Note the Channel list is $gettok(%ip2c.variables,9-,44)
}

ALIAS ip2c.default.channels { 
  if (%ip2c.channels == $null) {
    var %file = $+(",$scriptdirip2country.lookup.personal.ini,")
    if $file(%file) {
      set %ip2c.channels $readini(%file,n,variables,ip2c.channels)
    }  
    set %ip2c.channels $iif(%ip2c.channels,%ip2c.channels,$chr(35))
  }
}

ALIAS ip2c.default.webpage { 
  if (%ip2c.webpage == $null) { set %ip2c.webpage http://www.much.net/forums/viewforum.php?f=45 }
  if (%ip2c.Versions.Url.Path.File == $null) { set %ip2c.Versions.Url.Path.File www.much.net /mirc/scripts/ versions.txt }
}

;### %ip2c.variables should hold ALL /set variables needed for this addon.
;### This alias is Still under development even on release of ver 1.06
ALIAS ip2c.var { 
  ; var %ip2c.channels = #dubai,#mirc
  ; DO NOT DELETE VARIABLE msg , result.col , msg.col , NotFound.col , result.place , #chan1 #chan2
  set %ip2c.variables DO_NOT_DELETE_THIS_VARIABLE_or_the_ip2country_settings_will_return_to_their_default %ip2c.echo.result.col %ip2c.echo.msg.col %ip2c.echo.NotFound.col %ip2c.echo.result.place reserved1 reserved2 reserved3
  set %ip2c.channels #dubai,#mirc,#nippon
}

;######################### POPUP MENU ######### END ####################


;### GROUP START #ip2c.quit
#ip2c.quit on

ON ^*:QUIT: { 
  var %address = $gettok($fulladdress,2,33)
  var %ip.join.chan = $gettok(%address,2,64)
  if ($1- != *.net *.split) {

    var %country.result = $ip2c(%ip.join.chan).cccountry
    if (%country.result) {
      if ($chr(32) isin %country.result) { 
        var %country.join.chan = $gettok(%country.result,2-,32)
        var %cc.join.chan = $gettok(%country.result,1,32)
      } 
      else {
        var %country.join.chan = $gettok(%country.result,4-,44)
        var %cc.join.chan = $gettok(%country.result,3,44)
      }
    }
  }
  var %com.chan = $comchan($nick,0), %com.chan.string
  while %com.chan { 
    var %next.chan = $comchan($nick,%com.chan)
    var %com.chan.all = %com.chan.all %next.chan

    ; Check Where the Quit display should be - and set the correct echo place(s)
    var %quit.chan.result = $addtok(%quit.chan.result,$ip2c.read.mirc.ini.quit(%next.chan),32)
    dec -z %com.chan 
  }
  var %ip2c.quit.address = $iif($ip2c.read.mirc.ini.join.part.address.shown,$chr(40) $+  $gettok($fulladdress,2,33) $+ $chr(41),)
  var %ip2c.join.part.short = $ip2c.read.mirc.ini.join.part.short

  ; Short / Channel
  ; [12:30] * Quits: +@nickname (user@host) (Reason of Quit)
  ; Normal / Channel
  ; [12:30] * @+nickname (user@host) Quit (Reason of Quit)
  ;
  ; Status
  ; [12:30] * nickname (user@host) Quit (Reason of Quit)
  ;

  var %echo.place.numbers = $numtok(%quit.chan.result,32)
  while (%echo.place.numbers) {
    var %echo.place.result = $gettok(%quit.chan.result,%echo.place.numbers,32), %ip2c.quit.status.echo, %ip2c.quit.channel.echo

    ;Quits pos 03 - 1=Channel, 2=Status, 3=Both, 4=Hide ($false)
    if ((%echo.place.result == STATUS)  || (%echo.place.result == BOTH)) { var %ip2c.quit.status.echo = -estc quit  }
    if ((%echo.place.result == CHANNEL) || (%echo.place.result == BOTH)) { var %ip2c.quit.channel.echo = -tc quit }
    if ((%echo.place.result != STATUS) && (%echo.place.result != CHANNEL) && (%echo.place.result != BOTH)) { var %ip2c.quit.status.echo, %ip2c.quit.channel.echo }

    if (%ip2c.quit.status.echo)  { 
      echo %ip2c.quit.status.echo * $nick $+($chr(40),%address,$chr(41))  $iif(%country.join.chan, $chr(40) $+ %country.join.chan $+ $chr(41),) $iif(%com.chan.all,from %com.chan.all,)  Quit $iif($1-,$+($chr(40),$1-,$chr(41)),Quit) 
    }
    if (%ip2c.quit.channel.echo) { 
      var %com.chan.num = $numtok(%com.chan.all,32)
      var %country.SHOW.chan = $iif(%country.join.chan,$+($chr(40),%country.join.chan,$chr(41)),)
      var %cc.SHOW.chan = $iif(%cc.join.chan,$+($chr(40),%cc.join.chan,$chr(41)),)

      while (%com.chan.num != 0) {
        var %com.chan = $gettok(%com.chan.all,%com.chan.num,32)
        var %com.chan.nick = $nick(%com.chan,$nick).pnick

        ;### 0X X0 00 XX = Short Joins & User Address ( 0=unticked X=ticked )
        ;### 0X ###
        if (!%ip2c.join.part.short && %ip2c.quit.address) { 
          echo %ip2c.quit.channel.echo %com.chan * %com.chan.nick $+($chr(40),%address,$chr(41))  $iif(%country.SHOW.chan,%country.SHOW.chan,) $iif(%com.chan.all,from %com.chan.all,)  Quit $iif($1-,$+($chr(40),$1-,$chr(41)),Quit) 
        }
        ;### X0 ###

        if (%ip2c.join.part.short && !%ip2c.quit.address) { 
          var %country.SHOW.chan = $iif($group(#ip2c.short.cc) == on,%cc.SHOW.chan,%country.SHOW.chan)
          echo %ip2c.quit.channel.echo %com.chan * Quits: %com.chan.nick $iif(%country.SHOW.chan, %country.SHOW.chan,) $iif($1-,$+($chr(40),$1-,$chr(41)),Quit) 
        }
        ;### 00 ###
        if (!%ip2c.join.part.short && !%ip2c.quit.address) { 
          echo %ip2c.quit.channel.echo %com.chan * %com.chan.nick $iif(%country.SHOW.chan, %country.SHOW.chan,) has quit IRC $iif($1-,$+($chr(40),$1-,$chr(41)),Quit) 
        }
        ;### XX ###
        var %country.SHOW.chan = $iif($group(#ip2c.short.cc) == on,%cc.SHOW.chan,%country.SHOW.chan)
        if (%ip2c.join.part.short && %ip2c.quit.address) { 
          var %country.join.chan = $iif($group(#ip2c.short.cc) == on,%cc.join.chan,%country.join.chan)
          echo %ip2c.quit.channel.echo %com.chan * Quits: %com.chan.nick $+($chr(40),%address,$chr(41)) $iif(%country.SHOW.chan, %country.SHOW.chan,) $iif($1-,$+($chr(40),$1-,$chr(41)),Quit) 
        }
        dec -z %com.chan.num
      }
    }
    dec -z %echo.place.numbers
  }
  ; This next Alias call is if you wish to Custom Make any of your own QUIT commands depending on the Country Name
  ;ip2c.catch.countries QUIT   %cc.join.chan   %country.join.chan   $nick                      %com.chan.all %ip2c.quit.address $1-
  ip2c.catch.countries QUIT , $+ %cc.join.chan , $+ %country.join.chan , $+ $nick , $+ $chan , $+ %address , $+ %com.chan.all , $+ $1-

  haltdef
}

#ip2c.quit end
;### GROUP END #ip2c.quit


;### This is how mIRC can display the messages



;    CH ST
;### 00 00 NORMAL with/add - [12:30] * nickname (user@host) has joined #channel
;                   no/add - [12:30] * nickname has joined #channel
;### SHORT  with/add - [12:30] * Joins #channel: nickname (user@host)
;             no/add - [12:30] * Joins #channel: nickname
;
;### These are the changes this addon will make
;
;### NORMAL with/add - [12:30] * nickname (user@host) [from COUNTRY] [also in #channel] has joined #channel
;           no/add - [12:30] * nickname [from COUNTRY] [also in #channel] has joined #channel
;### SHORT  with/add - [12:30] * Joins #channel: nickname (user@host) [COUNTRY] [also in #channel] 
;           no/add - [12:30] * Joins #channel: nickname [COUNTRY] [(#channel1 #channel2)] 


;### GROUP START #ip2c.join
#ip2c.join on

on  ^*:join:#: { 
  var %address = $gettok($fulladdress,2,33)
  var %ip.join.chan = $gettok(%address,2,64)
  var %country.result = $ip2c(%ip.join.chan).cccountry
  if (%country.result) {
    if ($chr(32) isin %country.result) { 
      var %country.join.chan = $gettok(%country.result,2-,32)
      var %cc.join.chan = $gettok(%country.result,1,32)
    } 
    else {
      var %country.join.chan = $gettok(%country.result,4-,44)
      var %cc.join.chan = $gettok(%country.result,3,44)
    }
  }
  ; Only process this if the Group #ip2c.ComChan is ON
  if ($group(#ip2c.ComChan) == ON) {
    var %com.chan = $comchan($nick,0), %com.chan.string
    while %com.chan { 
      var %com.chan.all = %com.chan.all $comchan($nick,%com.chan)
      dec -z %com.chan 
    }
    ; remove the present channel name from the "other" Common channels
    var %com.chan.all = $remtok(%com.chan.all,$chan,1,32)
  }
  else { var %com.chan.all  }
  ; Check Where the Join display should be
  ; and set the correct echo place

  var %ip2c.where.show.join = $ip2c.read.mirc.ini.where.channel.join($chan)
  if (%ip2c.where.show.join) {

    if     (%ip2c.where.show.join == STATUS)  { var %ip2c.join.echo = -estc join }
    elseif (%ip2c.where.show.join == CHANNEL) { var %ip2c.join.echo = -tc join $chan }
    else { var %ip2c.join.echo = -estc join SOMETHING WRONG in JOIN remote with %ip2c.where.show.join - }

    var %ip2c.join.address = $iif($ip2c.read.mirc.ini.join.part.address.shown,$chr(40) $+ %address $+ $chr(41),)
    var %ip2c.join.show.chan = $iif(%ip2c.where.show.join == STATUS,$chan,)
    var %ip2c.join.part.short = $ip2c.read.mirc.ini.join.part.short

    ; Display choice of SHORT or NORMAL style
    ; SHORT =     Joins $chan: $nick ($address)
    ; NOT SHORT = $nick ($address) has joined $chan
    var %country.SHOW.chan = $iif(%country.join.chan,%country.join.chan,)
    if (%ip2c.join.part.short) { 
      var %country.SHOW.chan = $iif($group(#ip2c.short.cc) == on,%cc.join.chan,%country.SHOW.chan)
      echo %ip2c.join.echo * $iif(%ip2c.join.show.chan,Joins $chan $+ :,Joins:) $nick $iif(%ip2c.join.address,%ip2c.join.address,) $iif(%country.SHOW.chan,$+($chr(40),%country.SHOW.chan,$chr(41)),) $iif(%com.chan.all,$+($chr(40),%com.chan.all,$chr(41)),) 
    }
    else { 
      echo %ip2c.join.echo * $nick $iif(%ip2c.join.address,%ip2c.join.address,) $iif(%country.SHOW.chan, from %country.SHOW.chan,) $iif(%com.chan.all,also in %com.chan.all,) has joined $chan 
    }   
  }
  ; This next Alias call is if you wish to Custom Make any of your own JOIN commands depending on the Country Name
  ip2c.catch.countries JOIN , $+ %cc.join.chan , $+ %country.join.chan , $+ $nick , $+ $chan , $+ %address , $+ %com.chan.all

  haltdef
}

#ip2c.join end
;### GROUP END #ip2c.join
; Gets $1 = the Country Code Parameter , $2 = nick

ALIAS ip2c.catch.countries {
  return
  var %message = $gettok($1-,8-,44)
  tokenize 44 $1-
  ; Remove the extra space received
  var %action = $left($1,-1)), %cc = $left($2,-1), %country = $left($3,-1), %nick = $left($4,-1), %chan = $left($5,-1), %address = $left($6,-1), %common.channels = $left($7,-1)
  ; CALL ACTION HERE , ex. if (%action = JOIN) { DO SOMETHING using the Country name %country OR %cc }
  var %catch.countries PH ID MY TR MK MA RO NG
  if $istok(%catch.countries,%cc,32) {
    ; OR PASS ON AN ACTION HERE
    ip2c.example.alias.for.ip2country.join.part.quit %action , %cc , %country , %nick , %chan , %address , %common.channels , %message
  }
}

ALIAS ip2c.example.alias.for.ip2country.join.part.quit {
  return
  var %message = $gettok($1-,8-,44)
  tokenize 44 $1-
  var %action = $1, %cc = $2, %country = $3, %nick = $4, %chan = $5, %address = $6, %common.channels = $7
  echo 6 -gs   var %action = $1, %cc = $2, %country = $3, %nick = $4, %chan = $5, %address = $6, %common.channels = $7

  if (%action = JOIN) {
    var %ip2c.join.address = $6
    .ignore -pntiu1800 %nick 2 | ECHO -gs echo 4 -t  @whois ignoring %nick $chr(40) $+ %address spam $+ $chr(41) country detected %country
    if ( %chan isin %agentchannels ) { ECHO -gs .gtalk -lu mirc %nick $iif(%country, from %country,) has joined %chan }
  }
  elseif (%action = PART) {
    var %ip2c.part.address = $6
    if ( %chan isin %agentchannels ) { .gtalk -lu mirc %nick $iif(%country, from %country,) has left %chan }
  }
  elseif (%action = QUIT) { 
    var %ip2c.quit.address = $6, %QuitMessage = $7-
    if ( %chan isin %agentchannels ) { ECHO -gs .gtalk -lu mirc %nick $iif(%country, from %country,) has quit IRC $iif(%message,%message,Quit)) }
  }
}


;### GROUP START #ip2c.part
#ip2c.part on

on  ^*:part:#: { 
  var %address = $gettok($fulladdress,2,33)
  var %ip.join.chan = $gettok(%address,2,64)
  ; These next 2 lines commented out on 10/Feb/05 - and line below added - need to see the result
  ; if ($longip(%ip.join.chan isnum)) { var %country.join.chan = $gettok($ip2c(%ip.join.chan result),4,44) }
  ; else { var %country.join.chan = $ip2c(%ip.join.chan result) }
  var %country.result = $ip2c(%ip.join.chan).cccountry
  if (%country.result) {
    if ($chr(32) isin %country.result) { 
      var %country.join.chan = $gettok(%country.result,2-,32)
      var %cc.join.chan = $gettok(%country.result,1,32)
    } 
    else {
      var %country.join.chan = $gettok(%country.result,4-,44)
      var %cc.join.chan = $gettok(%country.result,3,44)
    }
  }
  ; Only process this if the Group #ip2c.ComChan is ON
  if ($group(#ip2c.ComChan) == ON) {
    var %com.chan = $comchan($nick,0), %com.chan.string
    while %com.chan { 
      var %com.chan.all = %com.chan.all $comchan($nick,$chr(32) $+ %com.chan)
      dec -z %com.chan 
    }
    ; remove the present channel name from the "other" Common channels
    var %com.chan.all = $remtok(%com.chan.all,$chan,1,32)
  }
  else { var %com.chan.all  }
  ; Check Where the Part display should be
  ; and set the correct echo place

  var %ip2c.where.show.part = $ip2c.read.mirc.ini.where.channel.part($chan)
  if (%ip2c.where.show.part) {

    if     (%ip2c.where.show.part == STATUS)  { var %ip2c.part.echo = -estc part }
    elseif (%ip2c.where.show.part == CHANNEL) { var %ip2c.part.echo = -tc part $chan }
    else { var %ip2c.join.echo = -estc part SOMETHING WRONG in JOIN remote with %ip2c.where.show.part - }

    var %ip2c.part.address = $iif($ip2c.read.mirc.ini.join.part.address.shown,$chr(40) $+ %address $+ $chr(41),)
    var %ip2c.part.show.chan = $iif(%ip2c.where.show.part == STATUS,$chan,)
    var %ip2c.join.part.short = $ip2c.read.mirc.ini.join.part.short

    ; Display choice of SHORT or NORMAL style
    ; SHORT =     Parts $chan: $nick ($address)
    ; NOT SHORT = $nick ($address) has left $chan
    var %country.SHOW.chan = $iif(%country.join.chan,%country.join.chan,)
    if (%ip2c.join.part.short) { 
      var %country.SHOW.chan = $iif($group(#ip2c.short.cc) == on,%cc.join.chan,%country.SHOW.chan)
      echo %ip2c.part.echo * $iif(%ip2c.part.show.chan,Parts $chan $+ :, Parts:) $nick $iif(%ip2c.part.address,%ip2c.part.address,) $iif(%country.SHOW.chan,$+($chr(40),%country.SHOW.chan,$chr(41)),) $iif(%com.chan.all,$+($chr(40),%com.chan.all,$chr(41)),) $iif($1-,$chr(40) $+ $1- $+ $chr(41),)
    }
    else { 
      echo %ip2c.part.echo * $nick $iif(%ip2c.part.address,%ip2c.part.address,) $iif(%country.SHOW.chan, from %country.SHOW.chan,) $iif(%com.chan.all,also in %com.chan.all,) has left $chan  $iif($1-,$chr(40) $+ $1- $+ $chr(41),)
    }   
  }
  ; ip2c.catch.countries PART    %cc.join.chan   %country.join.chan   $nick   $chan %ip2c.part.address

  ; This next Alias call is if you wish to Custom Make any of your own PART commands depending on the Country Name
  ip2c.catch.countries PART , $+ %cc.join.chan , $+ %country.join.chan , $+ $nick , $+ $chan , $+ %address , $+ %com.chan.all , $+ $1-

  haltdef
}

#ip2c.part end
;### GROUP END #ip2c.part

;### GROUP START #ip2c.open
#ip2c.open on

on *:open:=: {
  ip2c.open.message $nick $address $address =$nick
}
on *:open:?:*: {
  ip2c.open.message $nick $address $gettok($address,2,64) $nick
}

ALIAS ip2c.open.message {
  ; ### receives 4 Parameters 1= nickname 2= user@host 3 = IP (host) 4 = Place to send msg back ($nick or =$nick)
  tokenize 32 $1-
  var %nick = $1
  var %address = $2
  var %ip.open.window = $3
  var %msg.place = $4

  ;var %ip.open.window = $gettok(%address,2,64)
  var %country.open.window = $ip2c(%ip.open.window result)
  if ($chr(44) isin %country.open.window) { var %country.open.window = $gettok(%country.open.window,4,44) }
  var %chan.num $comchan(%nick,0), %com.chan, %b = $chr(2)
  while (%chan.num > 0) { var %com.chan = %com.chan $comchan( %nick , %chan.num ) | dec %chan.num }
  if (%com.chan) { echo %ip2c.echo.msg.col -te %msg.place $+(%b,%nick,%b) $+($chr(40),%address,$chr(41)) $iif(%country.open.window, from $+ %b %country.open.window $+ %b,) on common Channels $+ %b %com.chan }
  else { echo %ip2c.echo.msg.col -te %msg.place $chr(3) $+(%b,%nick,%b) $+($chr(40),%address,$chr(41)) $iif(%country.open.window, from $+ %b %country.open.window $+ %b,) is on $+ %b NO Common Channels with you }
}

#ip2c.open end
;### GROUP END #ip2c.open

;### GROUP START #ip2c.IAL-update
#ip2c.IAL-update on

; ### This is a way to update the IAL of a channel without doing a /who
; ### It uses /userhost which means it can do 5 /userhost 's at a time
; ### so one fifth the load of doing /who #

raw 353:*:{
  .timer 1 $rand(5,15) $!iif(($chan($3).ial) || ($chan($3).inwho),,ip2c.IAL.update $3 $4-)
  RETURN

  var %ip2c.timer.num = $timer(0)
  while %ip2c.timer.num {

    var %ip2c.timer.name = $timer(%ip2c.timer.num)

    if (%ip2c.timer.name iswm timer.ip2c.ial.*)  { 
      var %ip2c.time.next = $calc($timer(%ip2c.tn).secs + 5)
      var %ip2c.timer.name.next = $calc($gettok(%ip2c.timer.name,3,46) + 1)
      break
      ;timer-ip2c.ial. $+ %ip2c.timer.name.next 1 %ip2c.time.next $!iif(($chan($3).ial) || ($chan($3).inwho),,ip2c.IAL.update $4-)
    }

    dec -z %ip2c.timer.num
  }

  if (%ip2c.timer.name.next) {
    .timer-ip2c.ial. $+ %ip2c.timer.name.next 1 %ip2c.time.next $!iif(($chan($3).ial) || ($chan($3).inwho),,ip2c.IAL.update $4-)
  }
  else {
    .timer-ip2c.ial. $+ $ctime 1 1 $!iif(($chan($3).ial) || ($chan($3).inwho),,ip2c.IAL.update $4-) 
  }
}
#ip2c.IAL-update end
;### GROUP END #ip2c.IAL-update

;### GROUP START #ip2c.USERHOST
#ip2c.USERHOST off

raw 302:*: .disable #ip2c.USERHOST | haltdef

#ip2c.USERHOST end
;### GROUP END #ip2c.USERHOST

;### ip2c.IAL.update wants the Parameters of the Channel followed by the Nickname List to do /userhost on
;### This set of 3 Aliases is an experiment in updating the IAL on busier channels where /who may flood you off
ALIAS ip2c.IAL.update {
  ; timers
  tokenize 32 $1-
  ; ### $1 = channel name , $2- = nick list
  var %i = 1, %ii = %i + 4, %range = %i $+ - $+ %ii
  var %ip2c.ial.chan = $1
  while $gettok($2-,%range,32) {
    var %names.list = $gettok($2-,%range,32)
    ;  removes all the @'s and +'s from the front of nicks that have them
    var %names.list = $remove(%names.list,+,@,%)

    ; enable #ip2c.userhost.reply.blocked
    var %ip2c.timer.num = $timer(0)

    ip2c.find.last.timer -ip2c.ial.*

    ; Returns: TimerName Timer-wildcard-portion Time-to-next-trigger
    if ($result) {
      var %ip2c.timer.name.next = $calc($gettok($result,2,32) + 1)
      var %ip2c.time.next = $calc($gettok($result,3,32) + 5)
      .timer-ip2c.ial. $+ %ip2c.timer.name.next 1 %ip2c.time.next $!iif( (($chan( %ip2c.ial.chan ).ial) || ($chan( %ip2c.ial.chan ).inwho)),,ip2c.ial.userhost %names.list )
    }
    else {
      .timer-ip2c.ial. $+ $ctime 1 1 $!iif((($chan( %ip2c.ial.chan ).ial) || ($chan( %ip2c.ial.chan ).inwho)),,ip2c.ial.userhost %names.list )
    }
    inc %i 5 | var %ii = %i + 4, %range = %i $+ - $+ %ii
  }
  ; One last check of the IAL has to be done as 
  ; some events (like a nick change) would cause a not completely updated IAL
  ip2c.find.last.timer -ip2c.ial.*
  if ($result) {
    var %ip2c.timer.name.next = $calc($gettok($result,2,32) + 1)
    var %ip2c.time.next = $calc($gettok($result,3,32) + 5)
    .timer-ip2c.ial. $+ %ip2c.timer.name.next 1 %ip2c.time.next ip2c.ial.verifier %ip2c.ial.chan 
  }
  else {
    .timer-ip2c.ial. $+ $ctime 1 1 ip2c.ial.verifier %ip2c.ial.chan
  }
}

;### Part of the sets of Aliases from ALIAS ip2c.IAL.update

ALIAS ip2c.ial.userhost { .enable #ip2c.USERHOST | userhost $1- }

;### Needs parameter: Timer-Name-wildcard*
;### Returns: TimerName Timer-wildcard-portion Time-to-next-trigger
;### Part of the sets of Aliases from ALIAS ip2c.IAL.update

ALIAS ip2c.find.last.timer {
  ; var %timer.wildcard = -ip2c.ial.*
  var %timer.wildcard = $1
  var %timer.num = $timer(0)
  while (%timer.num) {
    var %timer.name = $timer(%timer.num)
    if (%timer.wildcard iswm %timer.name)  { 
      var %time.next = $timer(%timer.name).secs
      var %timer.name.ext = $gettok(%timer.name,3,46)
      var %wildcard.name.length = $calc($len($remove(%timer.wildcard,*)) + 1)
      var %wnm = %wildcard.name.length
      var %timer.name.ext = $mid(%timer.name,%wnm,$len(%timer.name))
      return %timer.name %timer.name.ext %time.next 

      ; Increment each timer by 3 seconds
      var %ip2c.time.next = $calc($timer(%ip2c.timer.name).secs + 3)
      var %ip2c.timer.name.next = $calc($gettok(%ip2c.timer.name,3,46) + 1)
      ; Get the last token after a period .
      var %ip2c.timer.name.next = $gettok(%ip2c.timer.name,$gettok(%ip2c.timer.name,0,46),46)
      ; Add 1 to the timer name
      var %ip2c.timer.name.next = $calc(%ip2c.timer.name.next + 1)
      break
    }
    dec -z %timer.num
  }
}

; Checks a channel to see which nicks are not in the IAL
; Need the Parameter Channel Name
ALIAS ip2c.ial.verifier {
  var %t = $nick($1,0) 
  while %t { 
    %a = $address($nick($1,%t),1) 
    if (!%a) { 
      var %nick.list = %nick.list $nick($1,%t)
      if ($numtok(%nick.list,32) >= 5) { 
        ip2c.IAL.update $1 %nick.list
        var %nick.list
      }
    } 
    dec -z %t    
  }
  if (%nick.list) { ip2c.IAL.update $1 %nick.list }
}

; This checks the ip2country.txt database file for integrity
; Can take a parameter of Anti-Freeze.Speed which defaults to 500
; Lower Anti-Freeze.Speed means slower processing but less freezing
; Has hash table name and the text file to load the hash table
; This is part 1 of a set of 3 Aliases - /ip2c.data.verify , /ip2c.data.verify.run , /ip2c.data.verify.show
; Reason for splitting this into 3 is to use timers and stop freezing

ALIAS ip2c.data.verify {

  var %ip2c.database.verify = $input(Please be aware that it takes over TWO MINUTES $crlf $+ to check the integrity of the database. $crlf $+ Only do this when mIRC slowing down for 2 minutes $crlf $+ will not cause you a problem. $crlf $+ $crlf $+ This will not change the contents of the Database. $crlf $+ It only alerts you of problems. $crlf $+ $crlf $+ Are you sure you want to continue?,y,ip2c.txt DATABASE Integrity Check,$1)

  if (%ip2c.database.verify) {
    var %hash.table = ip2c.HASH
    var %hash.file = $+(",$scriptdirip2country.txt,")
    var %Anti-Freeze.Speed = $iif($1,$1,500)
    if ($window(@ip2c.database.check)) { window -c @ip2c.database.check }
    window -Cldoa @ip2c.database.check 300 200 500 300 @ip2c.database.check Arial 11
    titlebar @ip2c.database.check : X the window closed to abandon verification
    if ($window(@ip2c.database.processing))  { window -c @ip2c.database.processing }
    var %win.pos.x = $window(@ip2c.database.check).x,  %win.pos.y = $window(@ip2c.database.check).y
    var %win.pos.w = $window(@ip2c.database.check).w,  %win.pos.h = $window(@ip2c.database.check).h
    var %win.pos.x = $int($calc(%win.pos.x + (%win.pos.w -255)/2))
    var %win.pos.y = $int($calc(%win.pos.y + %win.pos.h - 40 - $calc((%win.pos.h)/6)))
    window -ahkodp +fe @ip2c.database.processing  %win.pos.x %win.pos.y 255 40

    drawfill @ip2c.database.processing 1 1 1 1
    window -o  @ip2c.database.processing

    aline @ip2c.database.check $asctime(hh:mm:ss) - Starting Data Integrity Check
    sline 14 @ip2c.database.check 1

    aline @ip2c.database.check $asctime(hh:mm:ss) - Freeing Hash Table - %hash.table -
    sline 14 @ip2c.database.check 2
    if ($hget(%hash.table)) { hfree -s %hash.table }
    hmake -s %hash.table 1000 
    aline @ip2c.database.check $asctime(hh:mm:ss) - Reloading Hash Table - %hash.table - with - $nopath(%hash.file) -
    sline 14 @ip2c.database.check 3
    hload -sn %hash.table %hash.file

    var %line.last = $hget(%hash.table,0).item
    aline @ip2c.database.check $asctime(hh:mm:ss) - Loaded Hash Table - %hash.table - with - %line.last - lines

    sline 14 @ip2c.database.check 4

    ;  These %start.time & %tries  are just statistics of interest - how many lookups are made before a hit and the time taken.
    var %start.time $ticks
    var %line = 0

    aline @ip2c.database.check $asctime(hh:mm:ss) - Starting on Line %line of %line.last
    sline 14 @ip2c.database.check 5
    aline @ip2c.database.check * | sline @ip2c.database.check $line(@ip2c.database.check,0)
    aline @ip2c.database.check * | sline @ip2c.database.check $line(@ip2c.database.check,0) 
    aline @ip2c.database.check * | sline @ip2c.database.check $line(@ip2c.database.check,0)
    aline @ip2c.database.check * | sline @ip2c.database.check $line(@ip2c.database.check,0)
    aline @ip2c.database.check * X the Window Closed to Safely Abandon Verification - or X when the Test finishes | sline @ip2c.database.check $line(@ip2c.database.check,0)

    if ((%line < %line.last) && ($window(@ip2c.database.check))) {
      ip2c.data.verify.run %hash.table %line %line.last %start.time %Anti-Freeze.Speed
      return 
    }
    else {
      ip2c.echo.msg $ip2c.g Abandoned ip2country.txt Database Integrity Check
      window -c @ip2c.database.processing
      return
    }
    while ((%line < %line.last) && ($window(@ip2c.database.check))) {

      ; Read the %line line of the database
      var %ip.line = $hget(%hash.table,%line)
      var %ip.line.1 = $gettok(%ip.line,1,44)
      var %ip.line.2 = $gettok(%ip.line,2,44)

      if ((!%ip.line) && (%line != 0)) { 
        aline 10 @ip2c.database.check On line no: %line : ERROR : Blank Line !
        sline @ip2c.database.check $line(@ip2c.database.check,0)
        echo 10 -gs On line no: %line : ERROR : Block Start IP: %ip.line.1 <= %ip.line.2 : End Block IP
      }

      if %ip.line.1 > %ip.line.2 {
        aline 4 @ip2c.database.check On line no: %line : ERROR : Block Start IP: %ip.line.1 <= %ip.line.2 : End Block IP
        sline @ip2c.database.check $line(@ip2c.database.check,0)
        ip2c.echo.NotFound On line no: %line : ERROR : Block Start IP: %ip.line.1 <= %ip.line.2 : End Block IP
      }
      if ((%line.last.4.compare) && (%ip.line.1 <= %line.last.4.compare)) { 
        aline 13 @ip2c.database.check On line no: %line : ERROR : Block Start IP: %ip.line.1 >= %line.last.4.compare : Previous Like End Block IP
        sline @ip2c.database.check $line(@ip2c.database.check,0)
        echo 13 -gs On line no: %line : ERROR : Block Start IP: %ip.line.1 >= %line.last.4.compare : Previous Like End Block IP
      }
      var %line.last.4.compare = %ip.line.2
      inc %line
      if ($calc(%line / 1000) == $int($calc(%line / 1000))) { 
        sline @ip2c.database.check 7
        rline @ip2c.database.check 7 $asctime(hh:mm:ss) - Line no: %line / %line.last :Time: $calc(($ticks - %start.time) / 1000) seconds
        sline @ip2c.database.check 7
      }
      ;  while (loop ends)
    }
    rline @ip2c.database.check 7 $asctime(hh:mm:ss) - Line no: %line / %line.last :Time: $calc(($ticks - %start.time) / 1000) seconds -- $calc(100 * %line / %line.last) %
    sline @ip2c.database.check 7
    rline 12 @ip2c.database.check 9 $asctime(hh:mm:ss) - Database Verify Completed - Lines: %line / %line.last :Time: $calc(($ticks - %start.time) / 1000) seconds
    sline @ip2c.database.check 9
    sline @ip2c.database.check 10
    hfree -s %hash.table
  }
  else { 
    ip2c.echo.msg $ip2c.g Abandoned ip2country.txt Database Integrity Check 
    window -c @ip2c.database.processing
  }
}

;### Part 2 of the set of 3 aliases starting with ALIAS ip2c.data.verify
;### Neeed parameters $1 = %hash.table , $2 = %line , $3 = %line.last , $4 = %start.time
;### Can receive the optional $5 parameter of Anti-Freeze.Speed which is default 500
ALIAS ip2c.data.verify.run {
  tokenize 32 $1-
  var %hash.table = $1, %line = $2, %line.last = $3, %start.time = $4, %Anti-Freeze.Speed = $5
  ;var %Anti-Freeze.Speed = $iif($5,$5,500)
  if ((%line < %line.last) && ($window(@ip2c.database.check))) { 
    ip2c.data.verify.show %hash.table %line %line.last %start.time %Anti-Freeze.Speed
  }
  else { 
    if ($window(@ip2c.database.check)) {
      rline @ip2c.database.check 7 $asctime(hh:mm:ss) - Line no: %line / %line.last :Time: $calc(($ticks - %start.time) / 1000) seconds
      sline @ip2c.database.check 7
      rline 12 @ip2c.database.check 9 $asctime(hh:mm:ss) - Database Verify Completed - Lines: %line / %line.last :Time: $calc(($ticks - %start.time) / 1000) seconds
      sline @ip2c.database.check 9
      sline @ip2c.database.check 10
      .timer 1 5 window -c @ip2c.database.processing
    }
    else {
      hfree -s %hash.table
      ip2c.echo.NotFound Abandoned Database Integrity Check #1
      window -c @ip2c.database.processing
    }
    return %Anti-Freeze.Speed
  }
}

;### Part 3 of the set of 3 aliases starting with ALIAS ip2c.data.verify
ALIAS ip2c.data.verify.show {
  tokenize 32 $1-
  var %hash.table = $1, %line = $2, %line.last = $3, %start.time = $4, %Anti-Freeze.Speed = $5

  :Anti-Freeze.loop
  if $window(@ip2c.database.check) {
    ; Read the %line line of the database
    var %ip.line = $hget(%hash.table,%line)
    var %ip.line.1 = $gettok(%ip.line,1,44)
    var %ip.line.2 = $gettok(%ip.line,2,44)

    if ((!%ip.line) && (%line != 0)) { 
      echo 9 W.C.Test Reached ip2c.data.verify.show Position #2
      aline 10 @ip2c.database.check On line no: %line : ERROR : Blank Line !
      sline @ip2c.database.check $line(@ip2c.database.check,0)
      ip2c.echo.NotFound On line no: %line : ERROR : Block Start IP: %ip.line.1 <= %ip.line.2 : End Block IP
    }
    if %ip.line.1 > %ip.line.2 {
      aline 4 @ip2c.database.check On line no: %line : ERROR : Block Start IP: %ip.line.1 <= %ip.line.2 : End Block IP
      sline @ip2c.database.check $line(@ip2c.database.check,0)
      ip2c.echo.NotFound On line no: %line : ERROR : Block Start IP: %ip.line.1 <= %ip.line.2 : End Block IP
    }
    if ((%line.last.4.compare) && (%ip.line.1 <= %line.last.4.compare)) { 
      aline 13 @ip2c.database.check On line no: %line : ERROR : Block Start IP: %ip.line.1 >= %line.last.4.compare : Previous Like End Block IP
      sline @ip2c.database.check $line(@ip2c.database.check,0)
      ip2c.echo.NotFound On line no: %line : ERROR : Block Start IP: %ip.line.1 >= %line.last.4.compare : Previous Like End Block IP
    }
    var %line.last.4.compare = %ip.line.2
    inc %line
    if ($calc(%line / 1000) == $int($calc(%line / 1000))) { 
      sline @ip2c.database.check 7
      rline @ip2c.database.check 7 $asctime(hh:mm:ss) - Line no: %line / %line.last :Time: $calc(($ticks - %start.time) / 1000) seconds  -- $round($calc(100 * %line / %line.last),0) $+ % 
      sline @ip2c.database.check 7
    }
    ;  while (loop ends)

    if ((%line < %line.last) && ($window(@ip2c.database.check))) {
      if ($calc(%line / %Anti-Freeze.Speed) != $int($calc(%line / %Anti-Freeze.Speed))) { goto Anti-Freeze.loop }
    }

    if $window(@ip2c.database.processing) {
      var %i = $calc(255 * %line / %line.last)
      drawline -r @ip2c.database.processing $rgb(100,100,100) 2 $calc(0 + %i)  20 $calc(0 + %i) 40
      drawtext -r @ip2c.database.processing $rgb(200,200,200) Arial 10 10 0 Processing, please wait...
      window -o @ip2c.database.processing
      var %p = $int($calc(100 * %i / 245))
      if ($calc(%p / 5) == $int($calc(%p / 5))) {
        ; if (%p < 100) { %p = %p + 5 }
        drawrect -f @ip2c.database.processing 1 1 150 0 255 12 
        drawtext -r @ip2c.database.processing $rgb(200,200,200) Arial 10 150 0 %p $+ % completed
        window -o @ip2c.database.processing
      }

      .timer -m 1 0 ip2c.data.verify.run %hash.table %line %line.last %start.time %Anti-Freeze.Speed
      ; ip2c.data.verify.run %hash.table %line %line.last %start.time
    }
    else { 
      ip2c.echo.NotFound  Database Integrity Window was closed prematurely - Processing Abandoned  
      window -c @ip2c.database.processing
    }
  }
}

;### Reads from the mirc.ini file to see if PART/JOIN display is NORMAL or SHORT
ALIAS ip2c.read.mirc.ini.join.part.short {
  ; Options Line n2 Switch 19 - 0=Normal($false) , 1=Short($true)
  var %ip2c.mirc.ini.options.n2 = $readini($mircini,n,options,n2)
  var %ip2c.mirc.ini.options.n2.pos19 = $gettok(%ip2c.mirc.ini.options.n2,19,44)
  if (%ip2c.mirc.ini.options.n2.pos19 == 0) { 
    return $false 
  }
  elseif (%ip2c.mirc.ini.options.n2.pos19 == 1) { 
    return $true 
  }
  else { ip2c.echo.NotFound Joins/Parts display has NO RESULT - unable to read mirc.ini in ip2c.read.mirc.ini.join.part.short ( %ip2c.mirc.ini.options.n2.pos19 ) | return $false  }
}

;### Reads the mirc.ini file to see if ADDRESS is shown in the PART/JOIN display
ALIAS ip2c.read.mirc.ini.join.part.address.shown {
  ; User Address - options n0 - pos 2 - not shown on join/parts = 0
  var %ip2c.mirc.ini.options.n2 = $readini($mircini,n,options,n0)
  if ($gettok(%ip2c.mirc.ini.options.n2,2,44) == 0) { 
    return $false 
  }
  elseif ($gettok(%ip2c.mirc.ini.options.n2,2,44) == 1) { 
    return $true
  }
  else { ip2c.echo.NotFound User Address display has NO RESULT - unable to read mirc.ini in ALIAS ip2c.read.mirc.ini.join.part.address.shown ( %ip2c.mirc.ini.options.n2 ) | return $false  }
}

;### Reads the mirc.ini file to see if NICKS are shown on the PART/JOIN display
ALIAS ip2c.read.mirc.ini.nicks.on.join {
  ; User Address - options n3 - pos 35 - not shown on join/parts = 0
  var %ip2c.mirc.ini.options.n3 = $readini($mircini,n,options,n3)
  if ($gettok(%ip2c.mirc.ini.options.n3,35,44) == 0) { 
    return $false 
  }
  elseif ($gettok(%ip2c.mirc.ini.options.n3,35,44) == 1) { 
    return $true
  }
  else { ip2c.echo.NotFound Nicks on Join/Part display has NO RESULT - programming error in ALIAS ip2c.read.mirc.ini.nicks.on.join | return $false  }
}

;### Reads from the mirc.ini file to see if WHERE the JOIN/PART/QUIT display is supposed to go

ALIAS ip2c.read.mirc.ini.where.channel.JPQ {
  ; Receives parameter #Channel & Returns text: #,#,# 
  ; #,#,# Being the J P Q & the numbers are for JOIN & PART 1=Channel , 2=Status , 3=Hide
  ; and for QUIT 1=Channel , 2=Status , 3=Both , 4=Hide
  var %mircini = $+(",$mircini,")
  var %p = 1, %result = $null
  ; Three loops for the 3 tokens of Join/Part/Quit
  while %p <= 3 {
    ; Since a new copy of mIRC does not create an [event] section in mirc.ini until a change is made there,
    ; we ensure a check for this, and return the defaults of Channel (value = 1) for all three of J P Q if [events] is not yet created.
    if $ini(%mircini,events) {
      ; First check if there is an individual channel setting - which are $calc + 1 from the Default Settings
      ; For Join & Part 0=Default 1=Channel 2=Status 3=Hide
      ; For Quit        0=Default 1=Channel 2=Status 3=Both 4=Hide
      if ($ini(%mircini,events,$1) != 0) { 
        var %mirc.ini.events      = $readini($mircini,n,events,$1)
        var %mirc.ini.events.pos = $gettok(%mirc.ini.events,%p,44)
      }
      ; If there is no individual channel setting, or that setting = 0 (Which means take the default)
      ; do we use the default
      ; But since Default Setting values are 1 lower than Channel Settings [ 0 = Channel 1 = Status ]
      ; This operation is also adjusted here with the $calc + 1
      if ((!%mirc.ini.events.pos) || (%mirc.ini.events.pos == 0)) { 
        var %mirc.ini.events      = $readini(%mircini,n,events,default)
        var %mirc.ini.events.pos = $calc($gettok(%mirc.ini.events,%p,44) +1)
      }
    }
    else { 
      ; Default value on a new installation or unchanged initial value is Channel for all 3 cases of J/P/Q
      var %mirc.ini.events.pos = 1
    }
    var %result =  %result %mirc.ini.events.pos
    inc %p
  }
  return $replace(%result,$chr(32),$chr(44))
}


;### Reads from the mirc.ini file to see if WHERE the JOIN display is supposed to go
; Needs to receive the $chan name & Returns CHANNEL or STATUS or $false
ALIAS ip2c.read.mirc.ini.where.channel.join {
  var %where = $ip2c.read.mirc.ini.where.channel.JPQ($1)
  var %ip2c.mirc.ini.events.pos1 = $gettok(%where,1,44), %result = $false
  ; Returns WHERE the EVENTS are shown
  ; Joins pos 01 - 1=Channel,2=Status,3=Hide 
  ;
  if     (%ip2c.mirc.ini.events.pos1 == 1) { var %result = CHANNEL }
  elseif (%ip2c.mirc.ini.events.pos1 == 2) { var %result = STATUS }
  elseif (%ip2c.mirc.ini.events.pos1 == 3) { var %result = $false }  
  else { ip2c.echo.NotFound Joins display place has NO RESULT from alias ip2c.read.mirc.ini.where.channel.join }
  return %result
}

;### Reads from the mirc.ini file to see if WHERE the PART display is supposed to go
; Needs to receive the $chan name
ALIAS ip2c.read.mirc.ini.where.channel.part {
  var %where = $ip2c.read.mirc.ini.where.channel.JPQ($1)
  var %ip2c.mirc.ini.events.pos1 = $gettok(%where,2,44), %result = $false
  ; Returns WHERE the EVENTS are shown
  ; Parts pos 02 - 1=Channel,2=Status,3=Hide 
  ;
  if     (%ip2c.mirc.ini.events.pos1 == 1) { var %result = CHANNEL }
  elseif (%ip2c.mirc.ini.events.pos1 == 2) { var %result = STATUS }
  elseif (%ip2c.mirc.ini.events.pos1 == 3) { var %result = $false }  
  else { ip2c.echo.NotFound Joins display place has NO RESULT from alias ip2c.read.mirc.ini.where.channel.part }
  return %result
}

;### Reads the mirc.ini file to see WHERE the QUITS are shown
; Needs to receive the $chan name
ALIAS ip2c.read.mirc.ini.quit {
  ;Quits pos 03 - 1=Channel,2=Status,3=Both,4=Hide 
  var %where = $ip2c.read.mirc.ini.where.channel.JPQ($1)
  var %ip2c.mirc.ini.events.pos1 = $gettok(%where,3,44), %result = $false
  ; Returns WHERE the EVENTS are shown
  ; Quits pos 03 - 1=Channel,2=Status,3=Hide 
  ;
  if     (%ip2c.mirc.ini.events.pos1 == 1) { var %result = CHANNEL }
  elseif (%ip2c.mirc.ini.events.pos1 == 2) { var %result = STATUS }
  elseif (%ip2c.mirc.ini.events.pos1 == 3) { var %result = BOTH }  
  elseif (%ip2c.mirc.ini.events.pos1 == 4) { var %result = $false }  
  else { ip2c.echo.NotFound Joins display place has NO RESULT from alias ip2c.read.mirc.ini.quit }
  return %result
}

;ip2c.overhead.test alias - Benchmark speed testing  %cyc 94.96.166.241
ALIAS ip2c.overhead.test {
  tokenize 32 $1-
  var %host = $iif($longip($1) > 0,$1,194.175.15.15)
  var %host = $iif($longip($3) > 0,$3,194.175.15.15)
  var %host = $iif($1 == country,$3,%host) 
  var %c = $iif($1 = overhead,10000,100)
  if ($2 isnum) { var %c = $2 }
  ; Ensures the hash table is loaded before the TIMING starts for the test
  if ($1 = country) { ip2c.LOOKUP.hash make }
  else { ip2c.hash make }
  var %longip = $longip(%host)  
  var %i = 1, %t = $ticks 
  while (%i < %c) { 
    if ($1 = overhead) { goto SKIP-TESTING }
    elseif ($1 = engine)  { !.echo -q $ip2c.lookup.heart(%longip) }
    ;elseif ($1 = engine) { !.echo -q $ip2c.lookup(%host result) }
    elseif ($1 = alias) { !.echo -q $ip2c(%host result) }
    elseif ($1 = country) { !.echo -q $ip2c.lookup.LOOKUP.hash(%host) }
    else { !.echo -q $ip2c(%host result) }
    :SKIP-TESTING
    inc %i
  } 
  var %time = $calc($ticks - %t)
  if (!$4) {
    ip2c.echo.msg $ip2c.g %i lookups ( $+ %host $+ ) for the $iif($1,$upper($1),FULL ALIAS) took %time ms - Avg time per lookup: $bold($calc(%time / %c) ms) 
    linesep -s
  }
  else { 
    return %i %host $iif($1,$upper($1),FULL ALIAS) %time $calc(%time / %c) 
  }
}

ALIAS ip2c.dialog {
  if (!$file($+(",$scriptdirip2c.bmp,"))) { ip2c.small.bmp.icon }
  var %d = ip2cConfig
  if $dialog(%d) { dialog -x %d }
  .timer 1 0 dialog -m ip2cConfig ip2cConfig
}
ALIAS ip2c.small.bmp.icon {
  if (!$file($+(",$scriptdirip2c.bmp,"))) {
    ; Creates 1 small bmp icon for pre-loading into the ip2cConfig Dialog - so that it can be changed later 
    if ($window(@ip2c.small.bmp.icon)) { window -c @ip2c.small.bmp.icon }
    window -pfh @ip2c.small.bmp.icon 0 0 1 1
    drawrect -f @ip2c.small.bmp.icon $color(background) 1 0 0 1 1
    var %c = $+(",$scriptdir,ip2c.bmp,")
    drawsave @ip2c.small.bmp.icon %c
    ; Timer is used as mIRC v6.35 and before can GPF here
    .timer 1 1 window -c @ip2c.small.bmp.icon
  }
}

ALIAS ip2c.Colour.Result {
  if ($window(@ip2c.Colour.Result)) { window -c @ip2c.Colour.Result }
  window -pfh @ip2c.Colour.Result 0 0 130 25
  drawrect -f @ip2c.Colour.Result $color(background) 1 0 0 130 25
  var %cl = 1, %b = $chr(2), %k = $chr(3)
  var %tmp.c = $iif($did($1,$2),$did($1,$2),%ip2c.echo.result.col)
  var %col = $+(%b,%k,%tmp.c,RESULT Colour,%k,%b)
  drawtext -p @ip2c.Colour.Result $color(normal) "MS Sans Serif" 8 5 5 %col
  var %c = preview.tmp.colour.file.bmp
  drawsave @ip2c.Colour.Result %c
  did -g $1 $3 %c
  if ($exists(%c)) .remove %c | .timer 1 0 window -c @ip2c.Colour.Result
}

ALIAS ip2c.Colour.Message {
  if ($window(@ip2c.Colour.Message)) { window -c @ip2c.Colour.Message }
  window -pfh @ip2c.Colour.Message 0 0 130 25
  drawrect -f @ip2c.Colour.Message $color(background) 1 0 0 130 25
  var %cl = 1, %b = $chr(2), %k = $chr(3)
  var %tmp.c = $iif($did($1,$2),$did($1,$2),%ip2c.echo.msg.col)
  var %col = $+(%b,%k,%tmp.c,MESSAGE Colour,%k,%b)
  drawtext -p @ip2c.Colour.Message $color(normal) "MS Sans Serif" 8 5 5 %col
  var %c = preview.tmp.colour.file.bmp
  drawsave @ip2c.Colour.Message %c
  did -g $1 $3 %c
  if ($exists(%c)) .remove %c | .timer 1 0 window -c @ip2c.Colour.Message
}

ALIAS ip2c.Colour.NotFound {
  if ($window(@ip2c.Colour.NotFound)) { window -c @ip2c.Colour.NotFound }
  window -pfh @ip2c.Colour.NotFound 0 0 130 25
  drawrect -f @ip2c.Colour.NotFound $color(background) 1 0 0 130 25
  var %cl = 1, %b = $chr(2), %k = $chr(3)
  var %tmp.c = $iif($did($1,$2),$did($1,$2),%ip2c.echo.NotFound.col)
  var %col = $+(%b,%k,%tmp.c,NOT FOUND Colour,%k,%b)
  drawtext -p @ip2c.Colour.NotFound $color(normal) "MS Sans Serif" 8 5 5 %col
  var %c = preview.tmp.colour.file.bmp
  drawsave @ip2c.Colour.NotFound %c
  did -g $1 $3 %c
  if ($exists(%c)) .remove %c | .timer 1 0 window -c @ip2c.Colour.NotFound
}

ALIAS ip2c.Colour.Help {
  if ($window(@ip2c.Colour.Help)) { window -c @ip2c.Colour.Help }
  window -pfh @ip2c.Colour.Help 0 0 240 25
  drawrect -f @ip2c.Colour.Help $color(background) 1 0 0 225 25
  var %cl = 1, %b = $chr(2), %k = $chr(3), %col = $+(%k,0,$chr(44),14,%b,0,%b,$chr(15))  | while (%cl <= 15) { %col = $+(%col,%k,%cl,%b,$chr(160), %cl ,%b) | inc %cl } 
  drawtext -p @ip2c.Colour.Help $color(normal) "MS Sans Serif" 8 5 5 %col
  var %c = preview.tmp.colour.file1.bmp
  drawsave @ip2c.Colour.Help %c
  did -g $1 $2 %c
  if ($exists(%c)) .remove %c | .timer 1 0 window -c @ip2c.Colour.Help
}

dialog ip2cConfig {
  title - ip 2 country - Version %ip2c.Version
  size -1 -1 310 260
  option dbu
  tab "Options"          , 1001, 5 15 300 220
  tab " Advanced "       , 1002
  tab " Update Database ", 1003
  tab " Utilities "      , 1004
  tab "Update Domains"   , 1005
  tab " Help "           , 1006
  tab " About "          , 1007
  Menu "File"            , 1010
  Item "Save && Close"   , 1011, 1010
  Item "Save w/o Exit"   , 1012, 1010
  Item "Cancel && Close" , 1013, 1010
  Item "Cancel && ReOpen" , 1014, 1010
  Menu "View"            , 1020 
  Item "Options"         , 1021, 1020
  Item "Advanced Options", 1022, 1020
  Item "Database Update" , 1023, 1020
  Item "Domains Update"  , 1024, 1020
  Item "Utilities"       , 1025, 1020
  Menu "Help"            , 1060
  Item "Help"            , 1061, 1060
  Item break             , 1062
  Item "Open Web Page"   , 1063, 1060
  Item "Send Email"      , 1064, 1060
  Item break             , 1065
  Item Version %ip2c.Version     , 1066, 1060
  Item "About"           , 1067, 1060
  box Customize Options - ip2c ,  101,  15  35 280 190, tab 1001
  check "Show Joins",               2,  25  45  60  10, tab 1001
  check "Show Parts",               3,  25  55  60  10, tab 1001
  check "Show Quits",               4,  25  65  60  10, tab 1001
  check "Show Short Country Name",  5,  35  75  75  10, tab 1001
  button "?"                      251,  90  50  10  10, tab 1001 ; Help button for Joins/Parts/Quit

  check "Show on Query Open",  6,  25  90  60 10, tab 1001
  check "Show on Chat Open",   7,  25 100  60 10, tab 1001
  check "Show on DCC Files",   8,  25 110  60 10, tab 1001
  button "?"                 252,  90  95  10 10, tab 1001 ; Help button for Show on Query/DCC/Files

  check "Popup - Show Instant",   9,  25 125  60 10, tab 1001
  check "IAL Updating",          10,  25 135  60 10, tab 1001
  button "?"                    253,  90 130  10 10, tab 1001 ; Help button for Popup/IAL

  check "Allow !ip in Channel",   11,  25 150  60 10, tab 1001
  check "Allow !ip in Query",     12,  25 160  60 10, tab 1001
  check "Allow !ip in DCC Chat",  13,  25 170  60 10, tab 1001
  check "Allow !ip by Notice",    14,  25 180  60 10, tab 1001
  check "Reply !country xx",      15,  25 190  60 10, tab 1001
  button "?"                     254,  90 155  10 10, tab 1001 ; Help button for Allow !ip
  button "?"                     255,  90 190  10 10, tab 1001 ; Help button for Allow !country

  check "Long IP result"         16, 115  45  75 10, tab 1001
  check "Logging Not Found"      17, 115  55  75 10, tab 1001
  check "Echo Not Found msg"     18, 115  65  75 10, tab 1001
  check "Disable Check if Remote is On", 19, 115 75 90 10, tab 1001
  button "?"                    259, 190  45  10 10, tab 1001 ; Help button for Long IP Result
  button "?"                    256, 190  60  10 10, tab 1001 ; Help button for Logging/Not Found

  check "Custom DNS reply"       20, 205  45  60 10, tab 1001
  check "Long DNS reply"         21, 215  55  55 10, tab 1001
  button "?"                    257, 270  50  10 10, tab 1001 ; Help button for DNS


  check "2nd Level Domains"         22, 205  65  60 10,  tab 1001
  button "?"                       258, 270  65  10 10,  tab 1001 ; Help button for 2nd Level Domains

  check "Common Channels"           23, 205  75  60 10,  tab 1001
  button "?"                       267, 270  75  10 10,  tab 1001 ; Help button for Common Channels

  check "Whois shows country"       24, 205  85  60 10,  tab 1001
  button "?"                       268, 270  90  10 10,  tab 1001 ; Help button for Whois & Who
  check "Who shows country"         25, 205  95  60 10,  tab 1001

  check "Bans/Unbans shows cc"      26, 115  85  75 10,  tab 1001
  button "?"                       269, 190  85  10 10,  tab 1001 ; Help button for any new feature

  check "Request a feature"         30, 115  95  75 10, disable tab 1001
  button "?"                       260, 190  95  10 10,  tab 1001 ; Help button for any new feature


  box ": Help Box :"               211, 110 105 180  95, tab 1001
  edit "Help are for Options",     212, 115 115 170  80, multi, vsbar, tab 1001

  ; button "Revert",         71,  25 160  50 12, flat
  button "Set All",          72, 155 210  40 10, flat tab 1001
  button "Unset All",        73,  90 210  40 10, flat tab 1001
  button "Recommended",      74,  25 210  40 10, flat tab 1001

  box "Message Colours",     120, 145  45  150 115, left tab 1002
  edit ""                     31, 150  55  20 10, center, autohs, limit 2, tab 1002 ; Result Colour - default bright green
  text "Result Colour",      121, 175  56  40 10, tab 1002
  icon                       221, 195  55 100 10, ip2c.bmp, tab 1002
  button "?"               , 261, 280  55  10 10, tab 1002

  edit ""                     32, 150  65  20 10, center, autohs, limit 2, tab 1002 ; Message Colour - default dark blue
  text "Message Colour",     122, 175  66  40 10, tab 1002
  icon                       222, 195  65 100 10, ip2c.bmp, tab 1002
  button "?"               , 262, 280  65  10 10, tab 1002

  edit ""                     33, 150  75  20 10, center, autohs, limit 2, tab 1002 ; Not Found Colour - default red
  text "Not Found",          123, 175  76  40 10, tab 1002
  icon                       223, 195  75 100 10, ip2c.bmp, tab 1002
  button "?"               , 263, 280  75  10 10, tab 1002

  button "Preview"         , 224, 230  90 30 10, flat, tab 1002   
  edit ""                     34, 150  85  20 10, center, autohs, tab 1002 ; Show New Message Colour icons
  text "/echo switch",       124, 175  86  40 10, tab 1002
  button "?"               , 264, 280  85  10 10, tab 1002

  icon                        35, 100 100 220 25, ip2c.bmp, tab 1002
  text "Colour Code CHART : ",125, 150  97  80  10, tab 1002



  ;text "s Delay"            131, 225  97  20 10, disable, limit isnum tab 1001
  ;edit "Limit",              40, 210 114  15 10, limit isnum tab 1001

  ;box "",                               102, 160  -1 135 17
  ;button "Disable?",                     85, 240  4  50  10, flat 
  ;text "Completely Disable ip2c ?",    84, 165  5  70  10, right

  text "#Channel Names",    111, 150 122  55 10, center tab 1002
  combo                      41, 150 132  65 35, drop,edit,sort tab 1002 limit 12
  button "Add #",            42, 151 145  25  9, flat tab 1002
  button "Del #",            43, 189 145  25  9, flat tab 1002
  button "Reset to all #",   44, 225 132  45 10, flat tab 1002
  button "?"               ,265, 280 132  10 10, tab 1002 ; Help button for #Channel Names

  text "Recommended",       144, 220 122  55 10, center tab 1002
  button "Recommended",     174,  25 210  40 10, flat tab 1002


  box Today is : $asctime(dd mmm yyyy - dddd), 302, 15  35  280 190, tab 1002

  edit "Help on Advanced Options"  , 305, 145 170  140  45, multi, vsbar, tab 1002



  button ip2c $+ $crlf $+ &Version,         45, 245 190  40 30, flat center multi tab 1004
  ;text "Check for latest",  46, 245 160  40 10, center tab 1004
  text "Click to check"    , 47, 235 160  50  7, right tab 1004 *note:- Version Reply space line 1
  text "for a newer",        48, 235 167  50  7, right tab 1004 *note:- Version Reply space line 2
  text "version of",         49, 235 174  50  7, right tab 1004 *note:- Version Reply space line 3
  text "ip2country",         50, 235 181  50  7, right tab 1004 *note:- Version Reply space line 4

  box "-- Convert CSV tp a new Updated Database: ip2contry.txt --"          , 610,  15  35  200  45, tab 1003
  text Current file: $ip2c.country.txt.file.info().filename , 611,  25  45  200  10, tab 1003
  text Modified Time: $ip2c.country.txt.file.info().modtime , 612,  25  55  200  10, tab 1003
  text Size of file: $ip2c.country.txt.file.info().size     , 613,  25  65  200  10, tab 1003

  button "Location"               , 614,  25  95  30  10, tab 1003
  text " of new CSV File:"        , 615,  57  96  70  10, tab 1003
  text $scriptdir                 , 616, 100  96 189  20, tab 1003
  button &Download $+ $crlf $+ New $+ $crlf $+ Database, 617, 245  38  40  37, center multi tab 1003
  button "?"                                           , 266, 225  50  10  10, tab 1003 ; Help button for Update Database


  button "Find your downloaded CSV file" ,    311,  25 115  90  10, tab 1003
  list                           312,  25  130 200 60, sort, hsbar, vsbar, tab 1003
  button &Convert $+ $crlf $+ Selected $+ $crlf $+ File Now, 313,  245  135  40  40, center multi tab 1003
  edit "Conversion Progress: Not Started", 314,  125 115 160  10, read, rich, autohs, tab 1003
  text "STRONGLY SUGGEST"             621, 225 35 70 10 center, hide, tab 1003
  text "Unload old Data Now"          622, 225 45 70 10 center, hide, tab 1003
  text "Reload new Data Now"          623, 225 45 70 10 center, hide, tab 1003
  button UN-load $+ $crlf $+ OLD Database $+ $crlf $+ IMMEDIATELY !!, 315,  225   55  60  30, center, multi, hide, tab 1003
  button RE-load $+ $crlf $+ NEW Database $+ $crlf $+ NOW !!        , 319,  225   55  60  30, center, multi, hide, tab 1003
  text Current file:            , 626, 25 190  55   10, tab 1003
  text Modification Time:       , 627, 25 200  55   10, tab 1003
  text Size of file:            , 628, 25 210  55   10, tab 1003
  edit                          , 316, 70 190  195  10, read, rich, tab 1003
  edit                          , 317, 70 200  195  10, read, rich, tab 1003
  edit                          , 318, 70 210  195  10, read, rich, tab 1003

  box "Database Integrity Check"          , 401,  15  35 110 120, tab 1004    
  radio "Normal Anti-freeze (500)"          , 402,  25  45  90 10, group, tab 1004
  radio "Strong (good) Anti-freeze (10)"    , 403,  25  55  90 10, tab 1004
  radio "In between Freeze (100)"           , 404,  25  65  90 10, tab 1004
  radio "Don't care about Freezing (5,000)" , 405,  25  75  90 10, tab 1004
  radio "I never Freeze (10,000)"           , 406,  25  85  90 10, tab 1004
  text "Smaller number, Less Freeze"        , 407,  25 100  90 10, tab 1004
  text "But slower (longer) processing time", 408,  25 110  90 10, tab 1004
  button Database $+ $crlf $+ Integrity $+ $crlf $+ Check , 421,  25   120  40  25, center, multi, tab 1004

  box "Benchmark Speed Test"         , 410,  140  35 155 120, tab 1004
  radio "IP Search Engine Only"      , 411,  150  45  70 10, group, tab 1004
  radio "Full /ip2c Alias"           , 412,  150  55  70 10,        tab 1004
  radio "Country Search"             , 415,  230  45  60 10, tab 1004
  edit "100"                         , 422,  150  65  20 10, limit 4, tab 1004
  text "Cycles (Normal 100)"         , 413,  175  67 100 10, tab 1004
  text "Speed per IP Lookup in milliseconds"   , 414,  150 105 140 10, center, tab 1004 
  button Benchmark Test Now          , 423,  150  80  70 15, center, multi, tab 1004
  edit "Result - Engine Only"        , 424,  150 115 140 10,  read, rich, tab 1004
  edit "Result - Full /ip2c Alias"   , 425,  150 125 140 10,  read, rich, tab 1004
  edit "Result - Country Search"     , 426,  150 135 140 10,  read, rich, tab 1004

  box "Unload/Reload Hash Files"       , 430,   15 160 110 60, tab 1004
  button Unload $+ $crlf $+ Both       , 431,   25 173  25 17, center, multi, tab 1004
  button Unload $+ $crlf $+ Main       , 432,   55 173  25 17, center, multi, tab 1004
  button Unload  $+ $crlf $+ secondary , 433,   85 173  30 17, center, multi, tab 1004
  button Re-load $+ $crlf $+ Both      , 434,   25 195  25 17, center, multi, tab 1004
  button Re-load $+ $crlf $+ Main      , 435,   55 195  25 17, center, multi, tab 1004
  button Re-load $+ $crlf $+ secondary , 436,   85 195  30 17, center, multi, tab 1004

  box "Miscellaneous"                  , 440,  140 160  90 60, tab 1004
  button Delete my own $+ $crlf $+ Personal Settings file , 441, 150 173  60 17, center, multi, tab 1004
  button "?"                           , 442,  215 177  10 10, tab 1004

  button Lookup Data $+ $crlf $+ Integrity Check , 443, 150 195  60 17, center, multi, tab 1004
  button "?"                           , 444,  215 198  10 10, tab 1004

  link "ip2c Web Page (double click)"    75, 115 225  80 10, right
  box   "",                                80, 105 221 100 13  

  check "",                  86, 180 243  10 10, disable
  edit Delete Personal $+ $crlf Settings File , 87, 190 238  50 20, multi, read

  button "&Revert",          71,  25 241  40 15, flat
  ;button "&Clear",          87,  25 241  40 15, flat tab 1002
  button "&Save && Close",   88, 135 241  40 15, multi
  button "OK"                89, 160 241  40 15, ok,disable,hide 
  button "&Cancel",          99, 245 241  40 15, cancel

  Box Update 2nd Level Domain Countries,501,  15 35 280 190, tab 1005
  list                                  530,  25  50  30 100, right, hsbar, vsbar, tab 1005
  list                                  531,  60  50 150 100, hide, sort, hsbar, vsbar, tab 1005 ; Hidden master list for 2nd level domains to Update
  list                                  532,  60  50 150 100, hsbar, vsbar, tab 1005
  list                                  533,  60  50 150 100, hide, hsbar, vsbar, tab 1005  ; Hidden master list for 2nd level domains to Delete
  edit                                , 534,  25 150  30  10, autohs, tab 1005 ; Edit box for CC
  edit                                , 535,  60 150 150  10, autohs, tab 1005 ; Edit bx for 2nd Level Domain
  button "Add"                        , 541,  60 165  25  9, flat tab 1005
  button "Del"                        , 542, 185 165  25  9, flat tab 1005
  button "?"                           ,555,  25 165  10 10, tab 1005
  button Rebuild Domains $crlf overwriting my $crlf custom entries              ,556, 220  50  50 30, multi, tab 1005
  button "?"                           ,557, 275  60  10 10, tab 1005

  Box Help on ip2c - aka IP to Country, 601, 15 35 280 190, tab 1006
  list                                651, 25 45  60 178, right, autovs, autohs, tab 1006
  list                                652, 90 45 195 175, right, autovs, sort, hide, tab 1006
  edit ""                           , 653, 90 45 195 170, multi, read, autovs, autohs, hsbar, vsbar, rich, tab 1006


  Box About ip2c - aka IP to Country, 701, 15 35 280 190, tab 1007
  edit ""                           , 710, 25 45 260 170, multi, read, vsbar, autovs, rich, tab 1007
}

; Read the settings, and place the values into the dialog check boxes
on *:dialog:ip2cConfig:init:0: {
  ; ip2c.Settings.Reset
  ; Add the Colour settings and the bmp icons for the Colour message settings
  ip2c.Colour.Result $dname 31 221 | ip2c.Colour.Message $dname 32 222 | ip2c.Colour.NotFound $dname 33 223 | ip2c.Colour.Help $dname 35
  ; Load op the #Group settings & Default Colour names & Default 2nd level Domains
  ip2c.Settings.Load $dname
  ; Load up the Channel Names
  ip2c.Settings.chanLoad $dname
  ; Loads up the Topics in the tab 1006 - Help Area
  ip2c.Dialog.HelpBox.Fill $dname
  ; Loads up the About Box in tab 1007
  ip2c.About.Load ip2cconfig 710
  ; ip2c.OnOff $dname
}

ALIAS ip2c.2ndLevelDomains.ListBox {
  var %d = $1
  var %file.ini = $+(",$scriptdirip2country.lookup.ini,")
  var %file.per = $+(",$scriptdirip2country.lookup.personal.ini,")
  var %file = $iif($file(%file.per),%file.per,%file.ini)

  var %r = $read(%file,w,[ip2c.top.level.domains]), %line = $readn + 1

  var %listbox.line.no = 1
  did -r %d 530,531,532
  var %2nd = $read(%file,%line)
  while ($left(%2nd,1) != [) && (%r != $null) {
    var %2nd.name = $gettok(%2nd,1,61)
    var %2nd.cc = $gettok(%2nd,2,61)
    if %2nd.name { did -a %d 531 %2nd.name %2nd.cc }
    ;if %2nd.name { echo %2nd.name %2nd.cc // %line // %listbox.line.no }
    inc %line 
    inc %listbox.line.no
    var %2nd = $read(%file,%line)
    var %r = %2nd
  }
  ip2c.2ndLevelDomains.ListBox.Update %d
}

ALIAS ip2c.2ndLevelDomains.ListBox.Update {
  var %d = $1
  did -r %d 530,532
  var %line = 1
  var %r = $did(ip2cConfig,531,%line)
  while %r {
    did -a ip2cConfig 530 $gettok(%r,2,32)
    did -a ip2cConfig 532 $gettok(%r,1,32)
    inc %line
    var %r = $did(ip2cConfig,531,%line)
  }
  did -o ip2cConfig 501 1 Update 2nd Level Domain Countries - Total $did(ip2cConfig,532).lines entries - Show 2nd Level Domains setting is presently - $group(#ip2c.2nd.Level.Domains)
}

ALIAS ip2c.2ndLevelDomains.ListBox.Rebuild {
  var %d = $1
  var %file.ini = $+(",$scriptdirip2country.lookup.ini,")
  var %file.per = $+(",$scriptdirip2country.lookup.personal.ini,")
  var %file = $iif($file(%file.per),%file.per,%file.ini)

  did -r %d 530,531,532

  var %file = %file.per
  if $isfile(%file) {
    var %r = $read(%file,w,[ip2c.top.level.domains]), %line = $readn + 1

    var %listbox.line.no = 1
    var %2nd = $read(%file,%line)
    while ($left(%2nd,1) != [) && (%r != $null) {
      var %2nd.name = $gettok(%2nd,1,61)
      var %2nd.cc = $gettok(%2nd,2,61)
      if %2nd.name { did -a %d 531 %2nd.name %2nd.cc }
      ;if %2nd.name { echo %2nd.name %2nd.cc // %line // %listbox.line.no }
      inc %line 
      inc %listbox.line.no
      var %2nd = $read(%file,%line)
      var %r = %2nd
    }
  }
  var %file = %file.ini

  if $isfile(%file) {
    var %r = $read(%file,w,[ip2c.top.level.domains]), %line = $readn + 1
    var %listbox.line.no = 1
    var %2nd = $read(%file,%line)
    while ($left(%2nd,1) != [) && (%r != $null) {
      var %2nd.name = $gettok(%2nd,1,61)
      var %2nd.cc = $gettok(%2nd,2,61)
      if %2nd.name { 
        var %duplicate = $didwm(%d,531,%2nd.name $+ *)
        ;echo 6 -gs duplicate = %diuplicate // 2nd.name = %2nd.name 
        if (%duplicate !> 0) {
          did -a %d 531 %2nd.name %2nd.cc 
        }
        else {
          did -o %d 531 %duplicate %2nd.name %2nd.cc
        }
      }
      ;if %2nd.name { echo %2nd.name %2nd.cc // %line // %listbox.line.no }
      inc %line 
      inc %listbox.line.no
      var %2nd = $read(%file,%line)
      var %r = %2nd
    }
  }
  ip2c.2ndLevelDomains.ListBox.Update %d
}

ALIAS ip2c.Settings.chanLoad {
  did -r $1 41
  if (($prop = enable) || ($prop = reset.removed.for.testing)) { didtok $1 41 44 %ip2c.temp.chan.for.setting }
  elseif ($prop = recommended-1002) { 
    didtok $1 41 44 $ip2c.default.channels 
    set %ip2c.temp.chan.for.setting $ip2c.default.channels
  }
  else {
    didtok $1 41 44 %ip2c.channels
  }  
}

ALIAS -l ip2c.Settings.Load {
  ; Loads the correct settings into the Dialog
  ; $1 is the dialog name ($dname)
  ; $2 is the property - recommended , setall , unsetall
  ; if GROUP is ON, did -c $1 2 ; else did -u $1 2
  var %d = $1, %property = $2
  did -r %d 212 305
  did -o %d 47 1 Click to check for
  did -o %d 48 1 a newer version
  did -o %d 49 1 of ip2c
  ; ip2c.HelpBox.ipReply $dname 212 | ip2c.HelpBox.JoinsPartsQuits $dname 206 | ip2c.HelpBox.WindowOpens $dname 209 | ip2c.HelpBox.Others $dname 212
  if (%property = recommended-1002) {
    var %r =  $ip2c.default.echo.colour(result)
    var %m =  $ip2c.default.echo.colour(msg)
    var %nf = $ip2c.default.echo.colour(NotFound)
    var %p =  $ip2c.default.echo.colour(place)
  }
  elseif (%property = recommended-1001) { 
    var %r = $did(%d,31)
    var %m = $did(%d,32)
    var %nf = $did(%d,33)
    var %p = $did(%d,34)
  }
  else {
    var %r =  %ip2c.echo.result.col
    var %m = %ip2c.echo.msg.col
    var %nf = %ip2c.echo.NotFound.col
    var %p = %ip2c.echo.result.place
  }
  did -r $1 31,32,33,34
  did -o %d 31 1 %r
  did -o %d 32 1 %m
  did -o %d 33 1 %nf
  did -o %d 34 1 %p
  ip2c.Colour.Result $dname 31 221 | ip2c.Colour.Message $dname 32 222 | ip2c.Colour.NotFound $dname 33 223
  ; Reset Radio Boxes in tab 1004 - Utilities
  did -c %d 402,411 | did -u %d 403,404,405,406,412,415 | did -j %d 422 
  did -v %d 617 ; Reshow "Download new database"
  ;### Load up the 2nd Level Domains & clear the hidden Delete Box 533 (Needed for when Reverting)
  if ($prop == reset) { did -r %d 531,532,533,534,535 }
  ip2c.2ndLevelDomains.ListBox %d
  ; Undo any deletion of Personal Settings ip2country.lookup.ini
  unset %ip2c.temp.delete.lookup.ini
  did -h %d 86,87
  did -o %d 441 1 Delete my own $crlf $+ Personal Settings File
  did $iif($exists($+(",$scriptdirip2country.lookup.personal.ini)),-e,-b) %d 441
  ;### The number of Groups. To Add a group, also change the number in /ip2c.Settings.Save
  var %n = 26
  while (%n && %property != recommended-1002) {
    ; Checks for the group name for a given ID
    var %result = $iif(%property = recommended-1001,$ip2c.Settings.values(%n).recommended,$ip2c.Settings.values(%n))
    if (%result) { 
      var %group.name = $gettok(%result,1,32)
      if (%property = recommended-1001) {
        var %default.setting = $gettok(%result,2,32)
        if (%default.setting = 0) { %t.u = -u }
        elseif (%default.setting = 1) { %t.u = -c }
        elseif (%default.setting = 2) { %t.u = -cu }
        else { %t.u = -u }
      }
      elseif (%property = setall) { %t.u = -c }
      elseif (%property = unsetall) { %t.u = -u }
      else { var %t.u $iif($ip.m.status(%group.name) == ON, -c,-u) }
      did %t.u %d %n 
    }
    dec -z %n
  }
}

ALIAS -l ip2c.Settings.Save {
  ; Saves the newly chosen settings from the Dialog
  ; $1 is the dialog name ($dname)
  var %d = $1
  ; Write the changed 2nd Level Domains to ip2country.lookup.personal.ini
  var %file = $+(",$scriptdirip2country.lookup.personal.ini,")
  ; If ip2country.lookup.ini is set for deletion
  if (%ip2c.temp.delete.lookup.ini) {
    if ($exists(%file)) { remove -b %file }
    ; else Write to the ip2country.lookup.ini
  }
  else {
    var %section = ip2c.top.level.domains, %l = 1
    ; Lines to be deleted - held in Hidden Edit Box 533
    var %lines = $did(%d,533).lines
    while (%l <= %lines) {
      var %2nd = $did(%d,533,%l), %2nd.item = $gettok(%2nd,1,32), %2nd.cc = $gettok(%2nd,2,32)
      remini %file %section %2nd.item
      inc %l 
    }
    ; Lines to be added - held in Hidden Edit Box 531
    var %lines = $did(%d,531).lines
    while (%l <= %lines) {
      var %2nd = $did(%d,531,%l), %2nd.item = $gettok(%2nd,1,32), %2nd.cc = $gettok(%2nd,2,32)
      writeini -n %file %section %2nd.item %2nd.cc
      inc %l 
    }
    ; Write the channels for !ip & !country
    var %section = variables
    if ($var(%ip2c.temp.chan.for.setting)) { 
      set %ip2c.channels %ip2c.temp.chan.for.setting
      writeini -n %file %section ip2c.channels %ip2c.channels
    }
    ; Write the new values of Echo colours & Keeps these variables in the ip2country.lookup.personal.ini so that they can be used when upgrading
    set %ip2c.echo.result.col $did(%d,31)   | writeini -n %file %section ip2c.echo.result.col %ip2c.echo.result.col
    set %ip2c.echo.msg.col $did(%d,32)      | writeini -n %file %section ip2c.echo.msg.col %ip2c.echo.msg.col
    set %ip2c.echo.NotFound.col $did(%d,33) | writeini -n %file %section ip2c.echo.NotFound.col %ip2c.echo.NotFound.col
    set %ip2c.echo.result.place $did(%d,34) | writeini -n %file %section ip2c.echo.result.place %ip2c.echo.result.place
  }

  ; Enable and Disable the Groups
  ; if GROUP is ON, did -c $1 2 ; else did -u $1 2
  %section = groups
  var %n = 26
  while (%n) {
    ip2c.Settings.values %n
    ; Checks for the group name for a given ID
    if ($result) { 
      var %t.u = $did(%d,%n).state
      if (%t.u = 0) {     .disable $result | if (!%ip2c.temp.delete.lookup.ini) { writeini -n %file %section $result off } }
      elseif (%t.u = 1) { .enable $result  | if (!%ip2c.temp.delete.lookup.ini) { writeini -n %file %section $result on } }
      elseif (%t.u = 2) {  }
    }
    dec -z %n
  }
  unset %ip2c.temp.*
}

ALIAS ip2c.Dialog.Close {
  var %d = $1
  if $timer(ip2c.sockopen) { .timerip2c.sockopen off }
  if $sock(ip2c) { .sockclose ip2c }
  unset %ip2c.temp.*
  if $dialog(%d) { dialog -c %d }
}

ALIAS ip2c.Settings.values {
  ; Receives the id control number
  ; Returns the right group to ALIAS ip2c.Settings.Load
  var %r
  ; Group default setting 0 = off & 1 = on
  if     ($1 =  2) { %r = #ip2c.join 1 }
  elseif ($1 =  3) { %r = #ip2c.part 1 }
  elseif ($1 =  4) { %r = #ip2c.quit 1 }
  elseif ($1 =  5) { %r = #ip2c.short.cc 0 }
  elseif ($1 =  6) { %r = #ip2c.open 1 }
  elseif ($1 =  7) { %r = #ip2c.DCCchat 1 }
  elseif ($1 =  8) { %r = #ip2c.DCCfiles 1 }
  elseif ($1 =  9) { %r = #ip2c.popup.result 1 }
  elseif ($1 = 10) { %r = #ip2c.IAL-update 1 }
  elseif ($1 = 11) { %r = #ip2c.text 0 }
  elseif ($1 = 12) { %r = #ip2c.query 0 }
  elseif ($1 = 13) { %r = #ip2c.chat 0 }
  elseif ($1 = 14) { %r = #ip2c.notice 0 }
  elseif ($1 = 15) { %r = #ip2c.country 0 }
  elseif ($1 = 16) { %r = #ip2c.Long.IP.Found.Result 0 }
  elseif ($1 = 17) { %r = #ip2c.NOT-FOUND.log 0 }
  elseif ($1 = 18) { %r = #ip2c.NOT.Found.echo 0 }
  elseif ($1 = 19) { %r = #ip2c.check.remote.status 0 }
  elseif ($1 = 20) { %r = #ip2c.DNS 1 }
  elseif ($1 = 21) { %r = #ip2c.DNS.long 0 }
  elseif ($1 = 22) { %r = #ip2c.2nd.Level.Domains 1 }
  elseif ($1 = 23) { %r = #ip2c.ComChan 1 }
  elseif ($1 = 24) { %r = #ip2c.Whois 1 }
  elseif ($1 = 25) { %r = #ip2c.Who 1 }
  elseif ($1 = 26) { %r = #ip2c.bans 0 }
  else { %r = $null }
  if (!$prop) { %r = $gettok(%r,1,32) }
  return %r
}

;[1011] [1012]
on *:dialog:ip2cConfig:menu:*: { 
  var %d = $dname
  ; [1011] Save & Close
  if ($did = 1011) { 
    ip2c.Settings.Save %d
    ip2c.Dialog.Close %d
  }
  ; [1012] Save without Exit
  if ($did = 1012) { ip2c.Settings.Save %d }
  ; [1013] Cancel & Close
  if ($did = 1011) { ip2c.Dialog.Close %d }
  ; [1014] Cancel & Reopen
  if ($did = 1014) { 
    ip2c.Dialog.Close %d
    .timer 1 0 ip2c.dialog 
  }
  ; [1021] Options TAB Display
  if ($did = 1021) { did -f %d 1001 }
  ; [1022] Advanced TAB Display
  if ($did = 1022) { did -f %d 1002 }
  ; [1023] Database TAB Display
  if ($did = 1023) { did -f %d 1003 }
  ; [1024] Domains TAB Display
  if ($did = 1024) { did -f %d 1005 }
  ; [1025] Utilities TAB Display
  if ($did = 1025) { did -f %d 1004 }
  ; [1061] Help TAB Display
  if ($did = 1061) { did -f %d 1006 }
  ; [1063] Web Page
  if ($did = 1063) { run http://www.much.net/forums/viewforum.php?f=45 }
  ; [1064] = Email
  if ($did = 1064) { run mailto:free@much.net?Subject="ip2country%20ver%20 $+ %ip2c.Version $+ " }
  ; [1066] Version Display is Help TAB 
  if ($did = 1066) { 
    did -f %d 1006
    did -r %d 653
    var %line = $didwm(%d,652,*=Version)
    did -c %d 651 %line
    ip2c.Dialog.HelpBox Version %d 653
  }
  ; [1067] Help TAB Display
  if ($did = 1067) { did -f %d 1007 }
}

on *:dialog:ip2cConfig:close:*: { 
  ip2c.Dialog.Close $dname
}

on *:dialog:ip2cConfig:sclick:*: { 
  var %d = $dname
  ; [41] CHANNEL edit/drop combo box 
  if ($did = 41) { 
    set %ip2c.temp.chan.selected $did(%d,41,$did(41).sel) | halt 
  }
  ; [42] ADD CHANNEL
  if ($did = 42) {
    if ($did(41).text != $null) && ($chr(32) !isin $did(41).text) { 
      if (!$didwm(41,$did(41,0))) { 
        did -a %d 41 $did(41).text 
        set %ip2c.temp.chan.for.setting $didtok(%d,41,44)
        did -u %d 41
      }
    }
  }
  ; [43] DELETE CHANNEL
  if ($did = 43) {
    if ($did(41).text != $null) { 
      var %text = $did(41,0)
      if ($didwm(41,$did(41,0))) { 
        did -d %d 41 $ifmatch
        set %ip2c.temp.chan.for.setting $didtok(%d,41,44)
      }
      did -u %d 41
    }
  }
  ; [44] RESET TO ALL CHANNELS
  if ($did = 44) {
    did -r %d 41
    did -a %d 41 $chr(35)
    ;did -u %d 41
    set %ip2c.temp.chan.for.setting $didtok(%d,41,44)
  }
  ; [45] ip2c Version check
  if ($did = 45) {

    ip2c.update  

  }

  ; [71] REVERT
  if ($did = 71) {
    $ip2c.Settings.Load(%d).reset 
    return $ip2c.Settings.chanLoad(%d).reset
  }
  ; [72] SET ALL
  if ($did = 72) {
    ip2c.Settings.Load %d setall
  }
  ; [73] UNSET ALL
  if ($did = 73) {
    ip2c.Settings.Load %d unsetall
  }
  ; [74] RECOMMENDED-1001 TAB #1
  if ($did = 74) {
    ip2c.Settings.Load %d recommended-1001 
  }
  ; [88] SAVE
  if ($did = 88) {
    ip2c.Settings.Save %d
    ip2c.Dialog.Close %d
  }
  ; [89] Hidden OK button - will halt text - used for Dropbox [41] not closing Dialog
  if ($did = 89) { 
    halt
    if ($did(41).text != $null) { 
      did -a %d 41 $did(41).text 
      did -u %d 41
    }
    halt 
  }
  ; [99]
  if ($did = 99) { 
    ip2c.Dialog.Close %d
  }
  ; [174] RECOMMENDED-1002 - TAB #2
  if ($did = 174) {
    ip2c.Settings.Load %d recommended-1002 
  }
  ; [224] Preview message colours
  if ($did = 224) { 
    ip2c.Colour.Result %d 31 221 | ip2c.Colour.message %d 32 222 | ip2c.Colour.NotFound %d 33 223
  }
  ; [251] Help Message 1 put in did=212 of TAB 1001
  if ($did = 251) { 
    did -r %d 212
    ip2c.Dialog.HelpBox JoinsPartsQuits %d 212
  }
  ; [252] Help Message 2 put in did=212 of TAB 100
  if ($did = 252) { 
    did -r %d 212
    ip2c.Dialog.HelpBox WindowOpens %d 212
  }
  ; [253] Help Message 3 put in did=212 of TAB 1001
  if ($did = 253) { 
    did -r %d 212
    ip2c.Dialog.HelpBox Others %d 212
  }
  ; [254] Help Message 4 put in did=212 of TAB 1001
  if ($did = 254) { 
    did -r %d 212
    ip2c.Dialog.HelpBox ipReply %d 212
  }
  ; [255] Help Message 5 put in did=212 of TAB 1001
  if ($did = 255) { 
    did -r %d 212
    ip2c.Dialog.HelpBox countryReply %d 212
  }
  ; [256] Help Message 5 put in did=212 of TAB 1001
  if ($did = 256) { 
    did -r %d 212
    ip2c.Dialog.HelpBox NotFound %d 212
  }
  ; [257] Help Message 6 put in did=212 of TAB 1001
  if ($did = 257) { 
    did -r %d 212
    ip2c.Dialog.HelpBox DNS %d 212
  }
  ; [258] Help Message 7 put in did=212 of TAB 1001
  if ($did = 258) { 
    did -r %d 212
    ip2c.Dialog.HelpBox 2ndLevel %d 212
  }
  ; [259] Help Message 8 put in did=212 of TAB 1001
  if ($did = 259) { 
    did -r %d 212
    ip2c.Dialog.HelpBox LongIPresult %d 212
  }
  ; [260] Help Message 10 put in did=212 of TAB 1001
  if ($did = 260) { 
    did -r %d 212
    ip2c.Dialog.HelpBox FeatureRequest %d 212
  }
  ; [261] Help Message Advanced 1 put in did=305 of TAB 1002
  if ($did = 261) { 
    did -r %d 305
    ip2c.Dialog.HelpBox ResultColour %d 305
  }
  ; [262] Help Message Advanced 2 put in did=305 of TAB 1002
  if ($did = 262) { 
    did -r %d 305
    ip2c.Dialog.HelpBox MessageColour %d 305
  }
  ; [263] Help Message Advanced 3 put in did=305 of TAB 1002
  if ($did = 263) { 
    did -r %d 305
    ip2c.Dialog.HelpBox NotFoundColour %d 305
  }
  ; [264] Help Message Advanced Echo Place Switch put in did=305 of TAB 1002
  if ($did = 264) { 
    did -r %d 305
    ip2c.Dialog.HelpBox EchoPlace %d 305
  }
  ; [265] Help Message Advanced 4 put in did=305 of TAB 1002
  if ($did = 265) { 
    did -r %d 305
    ip2c.Dialog.HelpBox ChannelNames %d 305
  }
  ; [266] Help Message Update Database 1 put in did=305 of TAB 1002
  if ($did = 266) { 
    did -f %d 1006
    did -r %d 653
    var %line = $didwm(%d,652,*=UpdateDatabase)
    did -c %d 651 %line
    ip2c.Dialog.HelpBox UpdateDatabase %d 653
  }
  ; [267] Help Message 9 put in did=212 of TAB 1001
  if ($did = 267) { 
    did -r %d 212
    ip2c.Dialog.HelpBox ComChan %d 212
  }
  ; [268] Help Message Whois & Who put in did=212 of TAB 1001
  if ($did = 268) { 
    did -r %d 212
    ip2c.Dialog.HelpBox Whois %d 212
  }
  ; [269] Help Message Whois & Who put in did=212 of TAB 1001
  if ($did = 269) { 
    did -r %d 212
    ip2c.Dialog.HelpBox Bans %d 212
  }
  ; [311] Button = Get your downloaded CSV filenames 
  if ($did = 311) { 
    did -bm %d 314 | did -o %d 314 1 Conversion Progress: Not Started
    var %nf = $findfile($did(%d,616,1),*.csv,0,3)
    while (%nf > 0) {
      var %ff = $findfile($did(%d,616,1),*.csv,%nf,3)
      if (!$didwm(%d,312,%ff)) { did -a %d 312 %ff | did -z %d 312 }
      dec %nf
    }
    ip2c.GeoIP.file.selected.details %d
    var %f = $didwm(%d,312,*\GeoIPCountryWhois.csv,1)
    if (%f) {
      did -c %d 312 %f
      ip2c.GeoIP.file.selected.details %d
    }
  }
  ; [312] 
  if ($did = 312) { 
    ip2c.GeoIP.file.selected.details %d
  }
  ; [313] 
  if ($did = 313) {
    did -em %d 314 
    did -o %d 314 1 Conversion Progress: Not Started
    var %file = $did(%d,312).seltext
    var %file = $+(",%file,")
    if $isfile(%file) {
      did -en %d 314
      var %process = $?!=" This will take about Half a Minute $crlf $crlf $+ In that time, mIRC will FREEZE. $crlf $+ This is Normal. $crlf $crlf $+ Are You Sure You Want $crlf $+ to Process this File Now? $crlf "
      if (%process) { 
        var %ok = $input(After The File is Converted $crlf $+ It is SUGGESTED you unload $crlf $crlf $+ the HASH file with Old Data $crlf $+ And Re-Load the new Data $crlf,o,ip2c Processing CSV conversion)
        ; var %process = $?!=" After The File is Converted $crlf $+ It is SUGGESTED you unload $crlf $crlf $+ the HASH file with Old Data $crlf $+ And Re-Load the new Data $crlf "
        if (%ok) {
          did -o %d 314 1 Conversion Progress: Started - This will take time ...
          .timer 1 0 Database.convert.GeoIP.to.ip2c %file
          ; did -em %d 314
        }

      }
      else { did -bm %d 314 }
    }
    else { did -o %d 314 1 Conversion Progress: No Valid File Selected }
  }
  ; [315] 
  if ($did = 315) {
    ; Changed for v1.04
    ;if ($ip2c.hash(status)) { ip2c.hash free } | else { ip2c.hash make }
    ip2c.hash free
    did -h %d 315,621,622
    did -v %d 319,621,623
  }
  ; [319]
  if ($did = 319) {
    ; Changed for v1.04
    ;if ($ip2c.hash(status)) { ip2c.hash free } | else { ip2c.hash make }
    ip2c.hash make
    did -h %d 319,621,623
    did -v %d 617
  }
  ; [421] Database Integrity Check
  if ($did = 421) {
    var %af
    if ($did(%d,402).state == 1)     { var %af = 500,   %msg = $did(%d,402), %min = 3 }
    elseif ($did(%d,403).state == 1) { var %af = 10,    %msg = $did(%d,403), %min = 6 }
    elseif ($did(%d,404).state == 1) { var %af = 100,    %msg = $did(%d,404), %min = 4  }
    elseif ($did(%d,405).state == 1) { var %af = 5000,  %msg = $did(%d,405), %min = 2  }
    elseif ($did(%d,406).state == 1) { var %af = 10000, %msg = $did(%d,406), %min = 2  }
    else { return }
    var %process = $?!=" This will take about %min Minutes $crlf $crlf You have chosen the setting: $crlf %msg $crlf $crlf Are You Sure You Want to $crlf  Process this File Now? $crlf "
    if (%process) { 
      ip2c.data.verify %af
    }
  }
  ; [423] Benchmark Speed Test
  if ($did = 423) {
    ;ip2c.overhead.test engine
    ; Radio 411 412 & 415 No. of Cycles 422 & Result Area 424 425 426 & Go Button 423
    var %cyc = $did(%d,422), %cyc = $iif(%cyc isnum,$int($abs(%cyc)),100)
    if     ($did(%d,411).state == 1) { did -r %d 424 | ip2c.overhead.test engine %cyc 94.96.166.241 result }
    elseif ($did(%d,412).state == 1) { did -r %d 425 | ip2c.overhead.test alias  %cyc 94.96.166.241 result }
    elseif ($did(%d,415).state == 1) { did -r %d 426 | ip2c.overhead.test country  %cyc AE result }

    tokenize 32 $result
    if     ($did(%d,411).state == 1) { did -o %d 424 1 $1 lookups for $3 took $4 ms - Avg: $5 ms } 
    elseif ($did(%d,412).state == 1) { did -o %d 425 1 $1 lookups for $3 took $4 ms - Avg: $5 ms }
    elseif ($did(%d,415).state == 1) { did -o %d 426 1 $1 lookups for $3 took $4 ms - Avg: $5 ms }
  }
  ; [431,432,433,434,435,436] Load & Unload HASH files
  if ($did = 431) { ip2c.hash free | ip2c.LOOKUP.hash free }
  if ($did = 432) { ip2c.hash free  }
  if ($did = 433) { ip2c.LOOKUP.hash free }
  if ($did = 434) { ip2c.hash make | ip2c.LOOKUP.hash make }
  if ($did = 435) { ip2c.hash make }  
  if ($did = 436) { ip2c.LOOKUP.hash make }

  ; [441] Button for Deleting Personal Settings file
  if ($did = 441) {
    var %file = ip2country.lookup.personal.ini
    var %ffile = $+(",$scriptdir,%file,")
    var %ffile.del = $+(",$scriptdir,%file,.DELETE,")
    if (%ip2c.temp.delete.lookup.ini) {
      did -h %d 86,87
      did -o %d 441 1 Delete my own $crlf $+ Personal Settings File
      unset %ip2c.temp.delete.lookup.ini
    }
    elseif $exists(%ffile) {
      set %ip2c.temp.delete.lookup.ini $true
      did -v %d 86,87
      did -c %d 86
      did -o %d 441 1 Restore my own $crlf $+ Personal Settings File 
    }
  }
  ; [442] Help Button for Deleting Personal Settings file
  if ($did = 442) { 
    did -f %d 1006
    did -r %d 653
    var %line = $didwm(%d,652,*=PersonalSettings)
    did -c %d 651 %line
    ip2c.Dialog.HelpBox PersonalSettings %d 653
  }
  ; [443] Button for lookup.ini Integrity Check
  if ($did = 443) {
    var %process = $?!=" This will take about 1 Minute $crlf $crlf While the test is going on $crlf mIRC will freeze $crlf $crlf This is normal! $crlf $crlf Are You Sure You Want to $crlf  Process this File Now? $crlf "
    if (%process) { 
      ip2c.HASH.country.integrity.LOOKUP
    }
  }
  ; [444] Help Button for lookup.ini Integrity Check
  if ($did = 444) { 
    did -f %d 1006
    did -r %d 653
    var %line = $didwm(%d,652,*=CountryLookupIntegrity)
    did -c %d 651 %line
    ip2c.Dialog.HelpBox CountryLookupIntegrity %d 653
  }
  ; [532] 2nd Level Domains Main List Box - Selecting the right line
  if ($did = 532) {
    var %sel = $did(%d,532,1).sel
    did -c %d 530 %sel
    var %r.2nd = $did(%d,532).seltext
    var %r.cc = $did(%d,530).seltext
    did -o %d 534 1 %r.cc
    did -o %d 535 1 %r.2nd
  }
  ; [541] ADD Editbox to 2nd Level Domains Main Hidden List Box 531
  if ($did = 541) {
    var %add.2nd = $did(%d,535), %add.cc = $did(%d,534)
    var %add.2nd.TLD = $gettok(%add.2nd,$gettok(%add.2nd,0,46),46)
    if (%add.2nd == $null) || ($chr(32) isin %add.2nd) || (. !isin %add.2nd) || ($right(%add.2nd,1) == .) || ($left(%add.2nd,1) == .) || ($remove(%add.2nd,.) !isalnum) || ($numtok(%add.2nd,46) != 2)  { 
      noop $input(Invalid 2nd Level Domain Name,o) 
    }
    elseif ((%add.cc == $null) || (%add.cc !isalnum) || ($len(%add.cc) != 2)) { noop $input(Invalid Country Code,o) }  
    elseif (!$ip2c.verify.ip.TLD(%add.2nd.TLD result))  { noop $input(No Such TLD $crlf %add.2nd.TLD,o) }
    ;elseif ($readini($+(",$scriptdir\ip2country.lookup.ini,"),n,ip2c.top.level.domains,%add.2nd)) { noop $input(Duplicate Entry,o) }
    elseif ($didwm(%d,531,%add.2nd $+ *) != 0) { noop $input(Duplicate 2nd Level Domain Entry,o)  }
    elseif (!$ip2c.lookup.LOOKUP.hash(%add.cc)) { noop $input(No Such Country $crlf %add.cc,o) }
    else { 
      did -a %d 531 %add.2nd $upper(%add.cc)
      ; Redraw List Box 530 & 532  
      did -r %d 530 532
      ip2c.2ndLevelDomains.ListBox.Update %d
      var %line = $didwm(ip2cconfig,532,%add.2nd)
      did -c %d 530,532 %line
    }
  }  
  ; [542] DEL from Editbox to 2nd Level Domains Main Hidden List Box 531
  if ($did = 542) {
    var %sel = $did(%d,532,1).sel
    if (%sel != 0) {
      did -c %d 530 %sel
      var %r.2nd = $did(%d,532).seltext
      var %r.cc = $did(%d,530).seltext
      did -o %d 534 1 %r.cc
      did -o %d 535 1 %r.2nd
      did -d %d 531 %sel
      if (!$didwm(%d,533,%r.2nd $+ *)) { did -a %d 533 %r.2nd %r.cc }
      ip2c.2ndLevelDomains.ListBox.Update %d
    }
  }
  ; [555] Help for Update Domains
  if ($did = 555) { 
    did -f %d 1006
    did -r %d 653
    var %line = $didwm(%d,652,*Domains=2nd*)
    did -c %d 651 %line
    ip2c.Dialog.HelpBox 2ndLevel %d 653
  }
  ; [556] Rebuild Domains Overwriting Custom Entries
  if ($did = 556) { 
    ip2c.2ndLevelDomains.ListBox.Rebuild %d
  }
  ; [557] Help for Rebuild 2nd Level Domains
  if ($did = 557) { 
    did -f %d 1006
    did -r %d 653
    var %line = $didwm(%d,652,*Domains=2ndLevelRebuild*)
    did -c %d 651 %line
    ip2c.Dialog.HelpBox 2ndLevelRebuild %d 653
  }
  ; [614] Location of CSV file
  if ($did = 614) {
    var %dir = $sdir($scriptdir,Select Folder for Location of CSV file from MaxMind.com)
    if (%dir) { did -o %d 616 1 %dir }
  }
  ; [617] Download New CSV Database
  if ($did = 617) {
    var %url = http://geolite.maxmind.com/download/geoip/database/GeoIPCountryCSV.zip
    run %url
  }

  ; [651] Help Tab 1006 - Fill Help edit box 653 when item is clicked in list box 651 by finding topic in hidden list box 652
  if ($did = 651) {
    var %line = $did(%d,651,1).sel
    var %pointer = $did(%d,652,%line)
    var %topic = $gettok(%pointer,2,61)
    did -r %d 653
    ip2c.Dialog.HelpBox %topic %d 653
  }
  ; [1001] TAB = Options
  if ($did = 1001) {
    did -v %d 74
  }
  ; [1002] TAB = Advanced
  if ($did = 1002) {
    did -v %d 74
  }
  ; [1003] TAB = Update Database
  if ($did = 1003) {
    did -h %d 74
  }
  ; [1004] TAB = Utilities
  if ($did = 1004) {
    did -h %d 74
  }
}

ALIAS ip2c.GeoIP.file.selected.details {
  var %d = $1, %f = $did($1,312,1).sel
  if (%f) {
    var %fname =  $did($dname,312,%f)
    did -o %d 316 1 $ip2c.country.txt.file.info(%fname).fullname
    did -o %d 317 1 $ip2c.country.txt.file.info(%fname).modtime
    did -o %d 318 1 $ip2c.country.txt.file.info(%fname).size kb
  }
}

ALIAS ip2c.GeoIP.converting.message {
  ; [314]
  var %d =  ip2cConfig
  if $dialog(%d) {
    did -en %d 314
    did -o %d 314 1 $1-
    did -h %d 617
    did -v %d 315,621,622
  }
}
on *:DIALOG:ip2cConfig:edit:*: {
  if ($did == 41) {
    var %in = $did(41,0).text
    var %result = $Verify.Channel.Name(%in)
    if (%result == blank)  { did -r $dname 41 0 }
    if (%result == toolong) { did -o $dname 41 0 %ip2c.temp.chan.typed }
    if (%result == invalid)  { 
      did -o $dname 41 0 %ip2c.temp.chan.typed 
      did -f $dname 41 0 
    halt }
    set %ip2c.temp.chan.typed $did(41).text
    halt
  }
}

ALIAS Verify.Channel.Name {
  if (!$1) { return blank }
  if ($chr(32) isin $1 || $chr(7) isin $1 || $chr(44) isin $1) { return invalid }
  var %L = $asc($left($1,1))
  if ((%L != 35) && (%L != 38)) { return invalid }
  var %L = $len($1)
  if (%L > 200) { return toolong  }
  return valid 
}


ON *:DIALOG:ip2cConfig:dclick:*: { 
  ; [75] ip2c Web Page Link
  if ($did = 75) {  run %ip2c.Webpage }
  ; [221]
  if ($did = 221) { ip2c.Colour.Result $dname 31 221 }
  if ($did = 222) { ip2c.Colour.message $dname 32 222 }
  if ($did = 223) { ip2c.Colour.NotFound $dname 33 223 }
  if ($did = 35) { ip2c.colours.echo }
}

; Returns the Server name - ex. Undernet.org - of a Given connection. No parameter assumes connection One - 1
ALIAS ip2c.sn {
  var %id = $iif($1,$1,1) 
  ;var %s = $scid(%id).server, %nt  = $numtok(%s,46), %t  = $calc(%nt - 1) $+ - $+ %nt
  var %s = $scid(%id).server
  return $gettok(%s,-2-,46)
}

; ip2c.HelpBox.ipReply $dname 212 | ip2c.HelpBox.JoinsPartsQuits $dname 206 | ip2c.HelpBox.WindowOpens $dname 209 | ip2c.HelpBox.Others $dname 212

ALIAS ip2c.Dialog.HelpBox.Fill {
  var %d = $1
  var %f = did -a %d 652

  %f Channel ON Join=JoinsPartsQuits
  %f Channel ON PART=JoinsPartsQuits
  %f Channel ON QUIT=JoinsPartsQuits
  %f Show Short Country=JoinsPartsQuits
  %f Window Opens=WindowOpens
  %f PopUp=Others
  %f IAL=Others
  %f !ip=ipReply
  %f !country=countryReply
  %f Long IP Result=LongIPresult
  %f DNS=DNS
  %f /dns=DNS
  %f /ip=ip
  %f /ipdns=ipdns
  %f /ipdnsL=ipdns
  %f /ip2c=ip2c
  %f /ip2c.catch.countries=ip2c.catch.countries
  %f Not Found Logging=NotFound
  %f Not Found Message=NotFound
  %f Disable Check if Remote is on=NotFound
  %f 2nd Level Domans=2ndLevel
  %f Rebuild Domains=2ndLevelRebuild
  %f Common Channels=ComChan
  %f Whois & Who=Whois
  %f /whois & /who=Whois
  %f Bans & Unbans=Bans
  %f /ip2c.ban.check=BanCheck
  %f Feature Request=FeatureRequest
  %f Colour of Reply=ResultColour
  %f Colour of Messages=MessageColour
  %f Colour of Not Found=NotFoundColour
  %f Echo Place switch=EchoPlace
  %f Channel Auto Replies=ChannelNames
  %f Personal Settings=PersonalSettings
  %f Update Database=UpdateDatabase
  %f Update Domains=2ndLevel
  %f Itegrity of Lookup.ini=CountryLookupIntegrity
  %f All Nicks Details=AllNicksDetails
  %f Find Words in #=FindWord
  %f Version=Version
  %f Email=email
  %f Webpage=webpage

  var %lines = $did(%d,652).lines, %l = 1
  while (%l <= %lines) {
    var %index = $did(%d,652,%l)
    var %topic = $gettok(%index,1,61)
    var %pointer = $gettok(%index,1,61)
    did -a %d 651 %topic
    inc %l
  }

}
ALIAS ip2c.Dialog.HelpBox {
  var %m = $1, %d = $2, %id = $3, %t = $chr(9)
  var %e = did -a %d %id
  if (%m == JoinsPartsQuits) {
    %e Recommended: Joins/Parts/Quits ON $crlf
    %e Location: Options - Show Joins $crlf $crlf
    %e Adds the country name at the end of the $crlf
    %e Join Part Quit message. $+ $crlf
    %e $crlf
    %e Tries as hard as possible to follow your default settings in mIRC $crlf
    %e of how ( the colour and display format) and where (the place) $crlf
    %e the Join/Part/Quit messages are normally shown. $crlf $crlf
    %e Show Short Country Names $crlf
    %e ================= $crlf $crlf
    %e Show short country names is an option available if you have $crlf
    %e "Short joins and parts" ticked in mIRC Options/Options $crlf
    %e and then you wish to show only the short Country Code $crlf
    %e instead of the full Country Name. $crlf $crlf
    %e Example of Normal: United States $crlf
    %e Example of Short : US $crlf $crlf
    %e Examples of Normal join/part/quit: $crlf
    %e ----------------------------------------- $crlf $crlf
    %e Nick1 (nick1@92.103.192.112) from France has joined #Dubai $crlf $crlf
    %e Nick2 (~nick23@89.7.151.235) from Spain has left #Jazz $crlf $crlf
    %e Nick3 (nick3@77.28.167.175) (Macedonia) from #mIRC Quit (Ping timeout) $crlf $crlf
    %e Examples of Short: $crlf
    %e ----------------------- $crlf $crlf
    %e * Joins: Nick1 (nick1@92.103.192.112) (FR) $crlf $crlf
    %e * Parts #Jazz: Nick2 (~nick23@89.7.151.235) (ES) $crlf $crlf
    %e * Quits: Nick3 (nick3@77.28.167.175) (MK) (Ping timeout) $crlf $crlf
  }
  elseif (%m == WindowOpens) {
    %e Recommended: Query/Chat/DCC Files all ON $crlf
    %e Location: Options - Show on Query Open $crlf $crlf
    %e When a Message(Query) or DCC Chat window opens $crlf
    %e it shows in the Window, if available, the Country name $crlf
    %e the IP is from and the Common Channels that $crlf
    %e you and that Nick are in. $crlf $crlf
    %e DCC Files echos to the Status Window, $crlf
    %e the Country of the IP of a DCC File sender. $crlf $crlf
  }
  elseif (%m == Others) {
    %e Recommended: Popup & IAL to be ON $crlf
    %e Location: Options - Popup - Show Instant $crlf $crlf
    %e When right clicking on a nickname in the Nick List of a channel $crlf
    %e the country of the person (if available) is shown instantly in $crlf
    %e the Popup menu itself! $crlf $crlf
    %e IAL updating is to ensure mIRC has all the current $crlf
    %e information of all nicknames in a channel. $crlf
    %e Your IAL (Internal Address List) must be on for $crlf
    %e this to work. You can check if it is on by typing $crlf
    %e /IAL $crlf $crlf
    %e If it is off and you wish to put it on, type $crlf
    %e /IAL ON $crlf $crlf
  }
  elseif (%m == ipReply) {
    %e Recommended: !ip in Channel to be OFF $crlf
    %e Location: Options - Allow !ip in Channel $crlf $crlf
    %e Options that allow OTHERS to AUTOmaticaly get $crlf
    %e a country name reply from you by typing: $crlf 
    %e !ip - followed by an IP number $crlf $crlf
    %e These are OFF by default. $crlf
    %e Normally it's best to leave the $crlf
    %e "!ip in Channel" option off. $crlf $crlf
    %e The windows within which others can type !ip are: $crlf
    %e - in a #Channel, $crlf
    %e - in a Query window $crlf
    %e - in a DCC CHAT window $crlf
    %e - by /notice. $crlf $crlf
    %e They type: !ip followed by an IP number $crlf
    %e or also: !ip followed by a 2 letter country code $crlf $crlf
    %e ex: !ip 123.123.123.123 $crlf
    %e or $crlf
    %e !ip xx $crlf $crlf
  }
  elseif (%m == countryReply) {
    %e Recommended: !country to be OFF $crlf
    %e Location: Options - Reply !country xx $crlf $crlf
    %e Automatically replies to someone else who types $crlf
    %e !country - followed by a 2 digit country code $crlf
    %e within a #channel. Example: $crlf
    %e !country NL $crlf
    %e Example Reply: NL is from Netherlands $crlf $crlf
    %e This is OFF by default. $crlf $crlf
    %e This response is only given in Channels, $crlf
    %e not in private or other windows. $crlf
    %e When this setting is enabled, by default it works $crlf
    %e in all channels. To specify only certain channels, $crlf
    %e use the Channel Names area in the Advanced section. $crlf $crlf
    %e Note: !ip xx $crlf
    %e --------------- $crlf
    %e If the "Allow !ip in Channel" option above is enabled, $crlf
    %e others can always get a reply from you in a chanel $crlf
    %e of a country name of a 2 letter country code by typing: $crlf
    %e !ip xx $crlf $crlf
  }  
  elseif (%m == LongIPresult) {
    %e Recommended: Long IP Result to be OFF $crlf
    %e Location: Options - Long IP Result $crlf $crlf
    %e The normal reply to: /ip 222.222.222.222 will look like this: $crlf
    %e IP: 222.222.222.222 is from China (CN) $crlf $crlf
    %e The Long IP result reply looks like this: $crlf
    %e IP: 222.222.222.222 is in the $crlf
    %e NET-RANGE 222.168.0.0 - 222.223.255.255 $crlf
    %e and is from China (CN) - ( It took 0.015 seconds $crlf
    %e and 17 tries to get to line 132257 of 132355 ) $crlf $crlf
    %e This option is usually only used when $crlf
    %e such more detailed results are wanted. $crlf $crlf
  }  
  elseif (%m == DNS) {
    %e Recommended: Custom DNS - ON & Long Reply OFF $crlf
    %e Default: Both OFF $crlf
    %e Location: Options - Custom DNS reply $crlf $crlf
    %e The Custom DNS reply is quite interesting, and can $crlf
    %e actually be left ON if you do not use your DNS much $crlf
    %e in other scripts. $crlf $crlf 
    %e Try it, and /DNS an Alpha-Numerical IP. $crlf
    %e You might like it. It's quite nifty. $crlf $crlf
    %e The Long DNS Reply option might be a bit bothersome. $crlf
    %e It's more useful when doing $crlf
    %e Ex: /DNS google.com $crlf
    %e where you get many IP's back for one dns query. $crlf $crlf
    %e It is also useful for seeing the DNS list of: $crlf
    %e /dns eu.undernet.org $crlf
    %e /dns us.undernet.org $crlf $crlf
  }
  elseif (%m == ip) {
    %e Aliases /ip $crlf $crlf
    %e The way the script is most easily used. $crlf $crlf
    %e /ip 123.0.1.2 $crlf
    %e /ip NG $crlf
    %e /ip alpha.numeric.ip.za $crlf $crlf
  }
  elseif (%m == ipdns) {
    %e Aliases /ipdns & /ipdnsL $crlf $crlf
    %e These are 2 aliases that can be used even if $crlf
    %e Custom DNS & Long DNS reply are turned off. $crlf $crlf
    %e As can be expected: $crlf $crlf
    %e /ipdns is the Custom DNS reply $crlf
    %e /ipdnsL is the Long Custom DNS reply $crlf $crlf
    %e Example of Custom DNS reply: $crlf
    %e ------------------------------------- $crlf
    %e /ipdns google.com $crlf
    %e ------------------------------------- $crlf
    %e * Dns resolving google.com $crlf
    %e - $crlf
    %e * Dns resolved google.com to 64.233.181.103 (US) $crlf
    %e - $crlf $crlf
    %e Examples of Custom Long DNS reply: $crlf
    %e -------------------------------------------- $crlf
    %e /ipdnsL google.com $crlf
    %e -------------------------------------------- $crlf
    %e * Dns resolving google.com $crlf
    %e - $crlf
    %e Address queried: google.com $crlf
    %e Full Resolved list: 64.233.181.105,64.233.181.99,64.233.181.147,64.233.181.106,64.233.181.103,64.233.181.104 $crlf
    %e Queried Country: US $crlf
    %e - $crlf $crlf
    %e -------------------------------------------- $crlf
    %e /ipdnsL eu.undernet.org $crlf
    %e -------------------------------------------- $crlf
    %e * Dns resolving eu.undernet.org $crlf
    %e - $crlf
    %e Address queried: eu.undernet.org $crlf
    %e Full Resolved list: 130.237.188.216,195.144.12.5,195.47.220.2,195.18.164.194,195.197.175.21,194.109.20.90,82.196.213.250,94.125.182.255 $crlf
    %e Queried Country: SE BE NL NO FI HU $crlf
    %e - $crlf $crlf $crlf
  }
  elseif (%m == ip2c) {
    %e Alias /ip2c $crlf $crlf
    %e The /ip2c alias or the $ $+ ip2c identifier is a very useful $crlf
    %e part of this script. It can be used as follows: $crlf $crlf
    %e ip2c(%ip) %t %t -returns- % $+ ip CC Country $crlf
    %e and echos this reply: %t IP: 121.222.55.11 is from Australia (AU) $crlf $crlf
    %e $ $+ ip2c(%ip).result %t %t -returns- N1,N2,CC,Country $crlf
    %e $ $+ ip2c(%ip).cc %t %t -returns- CC $crlf
    %e $ $+ ip2c(%ip).country %t %t -returns- Country $crlf
    %e $ $+ ip2c(%ip).cccountry %t -returns- CC Country $crlf
    %e $ $+ ip2c(%ip).netblock %t %t -returns- N1,N2 $crlf $crlf
    %e % $+ ip %t is an IP number like 121.222.55.11 $crlf
    %e N1 %t is LongIP value of the start of a NetBlock $crlf
    %e N2 %t is LongIP value of the end of the NetBlock that started at N1 $crlf
    %e CC %t is a two letter country code, ex. US or CA or UK $crlf
    %e Country %t is a country name, ex. United States or Canada $crlf $crlf
    %e Example, typing this: //echo -gs $ $+ ip2c(121.222.55.11).result $crlf
    %e will echo to the status window: 2043674624,2044723199,AU,Australia $crlf $crlf
    %e This last example is most useful as it avoids multiple lookups: $crlf $crlf
    %e /var % $+ result %t = $ $+ ip2c(%ip).result $crlf
    %e /var % $+ cc %t %t = $ $+ gettok(%result,3,44) $crlf 
    %e /var % $+ country %t = $ $+ gettok(%result,4,44) $crlf 
    %e /var % $+ N1 %t = $ $+ gettok(%result,1,44) $crlf 
    %e /var % $+ N2 %t = $ $+ gettok(%result,2,44) $crlf $crlf
    %e The /ip2c alias & $ $+ ip2c identifier also correctly deals with the following: $crlf $crlf
    %e /ip2c ~H_U_M@62.150.126.89 $crlf
    %e /ip2c ~nik@ppp-94-65-31-140.home.otenet.gr $crlf
    %e /ip2c 
  }
  elseif (%m == ip2c.catch.countries) {
    %e ALIAS /ip2c.catch.countries $crlf $crlf
    %e For more advanced scripters, the following aliases are included: $crlf $crlf
    %e ALIAS ip2c.catch.countries $crlf 
    %e ALIAS ip2c.example.alias.for.ip2country.join.part.quit $crlf $crlf
    %e The ip2c.catch.countries alias will act at the time $crlf
    %e of JOIN or PART or QUIT on a list of country codes $crlf
    %e to carry out commands specified in another alias $crlf
    %e (sample provided): ip2c.example.alias.for.ip2country.join.part.quit $crlf $crlf
    %e Search for the Aliases in the script, and change the following: $crlf
    %e *- Comment out the "return" at the start of the alias $crlf
    %e *- Change the variable: %catch.countries PH ID MY TR MK MA RO NG $crlf
    %e --- (This is the list of countries you wish to take action upon) $crlf
    %e *- Change this to your own Alias: $crlf
    %e --- ip2c.example.alias.for.ip2country.join.part.quit $crlf $crlf
    %e The variables that are sent forward are: $crlf $crlf
    %e % $+ action = JOIN or PART or QUIT $crlf
    %e % $+ cc = 2 letter country code (if there was a country, otherwise blank) $crlf
    %e % $+ country = Full Country name (if there was a country, otherwise blank) $crlf
    %e % $+ nick = Nickname of whoever JOINed or PARTed or QUIT $crlf
    %e % $+chan = the #Channel this happened to or from $crlf
    %e % $+ address = Their address in the form $ $+ mask($fulladdress,3) $crlf
    %e % $+ common.channels = The common channels they are or were on with you $crlf
    %e % $+ message = The PART or QUIT message $crlf $crlf $crlf
  }

  elseif (%m == NotFound) {
    %e Recommended: Logging & Not Found to be OFF $crlf
    %e Location: Options - Logging Not Found $crlf $crlf
    %e If an IP is NOT FOUND in the database, $crlf
    %e it can be logged to a file. $crlf $crlf 
    %e Similarly, when that happens $crlf 
    %e a NOT FOUND message can be displayed $crlf
    %e in the Status Window. $crlf $crlf
    %e You can try and leave the "Echo Not Found msg" on, $crlf
    %e and switch it off if there are too many unfound IPs, $crlf
    %e or the messages get too irritating. $crlf $crlf
    %e Disable Check if Remote is on - should be left OFF $crlf
    %e ----------------------------------------------------------- $crlf $crlf
    %e This is only used if you are running the script $crlf
    %e with REMOTES Off $crlf $crlf
    %e In this unlikely event, there will be constant reminders $crlf
    %e to switch your remotes on. $crlf $crlf
    %e This reminder can be disabled by checking this tick box $crlf $crlf
  }
  elseif (%m == 2ndLevel) {
    %e Recommended: 2nd Level Domains to be ON $crlf
    %e Location: Options - 2nd Level Domains $crlf $crlf
    %e A Small database of 2nd Level Domains is available $crlf
    %e that have an associated country name. $crlf $crlf 
    %e Should one of these common IP's be seen, $crlf
    %e the associated country name will be shown. $crlf $crlf 
    %e This list can be added to in the Update Domains tab above. $crlf $crlf
    %e Example: $crlf
    %e ------------ $crlf
    %e Response to: !ip telia.net $crlf
    %e IP: TELIA.NET is from Sweden (SE) $crlf $crlf
    %e Update Domains $crlf
    %e ========== $crlf $crlf
    %e In the Update Domains section, you can add in your own $crlf
    %e 2nd Level Domains that you are aware of. $crlf $crlf
    %e When you ADD or DELete your own 2nd level domains information, $crlf
    %e this is not stored or deleted in the ip2country.lookup.ini file, but $crlf
    %e instead are kept and updated in a newly created file: $crlf
    %e ip2country.lookup.personal.ini $crlf $crlf
    %e This allows you to not loose your personal changes $crlf
    %e in case you update the ip2country script. $crlf $crlf
  }
  elseif (%m == 2ndLevelRebuild) {
    %e Rebuild Domains button (Overwriting my custom entries) $crlf
    %e Location: Options - 2nd Level Domains $crlf $crlf
    %e Once you rebuid the 2nd Level Domain entries, remember to $crlf
    %e Unload the Secondary Database - Utilities tab (lower half, left of center) $crlf
    %e followed by clicking the Save & Close button. $crlf $crlf
    %e Each new version of ip2country usually comes bundled with $crlf
    %e an updated 2nd Level Domain list in the ip2country.lookup.ini file. $crlf $crlf
    %e Since an option is available to add your own custom known 2nd Level Domains $crlf
    %e and these should not be lost - clicking this button allows you to merge your $crlf
    %e own added 2nd Level Domains from your ip2country.personal.lookup.ini $crlf
    %e with the new enties in the updated ip2country.lookup.ini file $crlf $crlf
    %e The only case where this may be bothersome is if you have $crlf
    %e DELETED an entry completely, or changed a Country Code $crlf
    %e from the originally supplied data in the ip2country.lookup.ini file. $crlf $crlf
    %e You will need to redo these changes if you made any. $crlf $Crlf
  }
  elseif (%m == ComChan) {
    %e Recommended: Common Channels to be ON $crlf
    %e Location: Options - Common Channels $crlf $crlf
    %e This adds the information to the IP country reply $crlf
    %e of the nicknames and Common Channels with you $crlf
    %e of those nicknames that have a matching IP $crlf
    %e to the one being looked for. $crlf $crlf $crlf
  }
  elseif (%m == Whois) {
    %e Recommended: Whois & Who to be ON $crlf
    %e Location: Options - Whois & Who shows country $crlf $crlf
    %e This adds the country information $crlf
    %e (should it be available) $crlf
    %e to the /whois & , /whowas & /who reply $crlf
    %e right after the user@host . $crlf $crlf $crlf
  }
  ;;
  elseif (%m == Bans) {
    %e Recommended: Bans & Unbans show Country to be OFF $crlf
    %e Location: Options - Bans/Unbans shows cc $crlf $crlf
    %e This adds the country information $crlf
    %e in the form of 2 letter country codes $crlf
    %e (should it be available) $crlf
    %e to the end of the Bans & Unban mode change $crlf
    %e that is shown in the channel. $crlf $crlf
    %e This is turned off by default as sometimes $crlf
    %e this list Country Code list can be quite long. $crlf $crlf
    %e This option is more useful for a moderator $crlf
    %e in a busy channel where there are a lot of bans. $crlf
    %e However be aware that if the ban range is large, $crlf
    %e the lookup time for the countries can cause lagging. $crlf $crlf 
    %e Example: $crlf
    %e * X sets mode: +b  *!*@210.9.* (AU) $crlf
    %e * X sets mode: +b  *!*@210.7.* (FJ NZ AU IN HK AP US SG SN GB NL JP) $crlf $crlf 
    %e For a useful Alias associated with this, check the help file for /ip2c.ban.check
  }
  elseif (%m == BanCheck) {
    %e Alias /ip2c.ban.check $crlf $crlf
    %e Receives a wildcard address $crlf
    %e Returns a space delimited string of Country Codes $crlf
    %e matching the range of IP addresses covered. $crlf $crlf
    %e This Alias was developed to enable returning the full range $crlf
    %e of countries covered by a wild card ban. $crlf $crlf
    %e Example 1: $crlf
    %e ------------- $crlf
    %e //echo -gs $ $+ ip2c.ban.check(*!*@210.9.*) $crlf
    %e AU $crlf $crlf
    %e Example 2: $crlf
    %e ------------- $crlf
    %e //echo -gs $ $+ ip2c.ban.check(*!*@210.7.*) $crlf
    %e FJ NZ AU IN HK AP US SG SN GB NL JP $crlf $crlf
    %e Although it's simpler to use Alias /ip2c, $crlf
    %e to allow this Alias to be comprehensive $crlf
    %e it also returns a Country Code for alpha numerical strings such as: $crlf $crlf
    %e //echo -gs $ $+ ip2c.ban.check(*!*@c-67-185-109-99.hsd1.wa.comcast.net ) $crlf
    %e US $crlf $crlf
  }  
  elseif (%m == FeatureRequest) {
    %e Request a feature! $crlf $crlf
    %e Something you feel the script is missing? $crlf
    %e Feel free to request that it is added. $crlf $crlf 
    %e You might find your request right here in the next release! $crlf $crlf
    %e Find the email address on the About Tab. $crlf $crlf
  }
  elseif (%m == ResultColour) {
    %e Recommended: Any Colour you like $crlf 
    %e Default: 9 (Bright Green) $crlf
    %e Location: Advanced - Result Colour $crlf $crlf
    %e This is the colour the result of /ip $crlf
    %e will be shown in. $crlf $crlf 
    %e If you change the colour number, you can $crlf
    %e double click the preview box to see the new colour $crlf
    %e or press the Preview button $crlf $crlf
  }
  elseif (%m == MessageColour) {
    %e Recommended: Any Colour you like $crlf
    %e Default: 2 (Dark Blue) $crlf
    %e Location: Advanced - Message Colour $crlf $crlf
    %e This is the colour of messages given by the script. $crlf $crlf 
    %e If you change the colour number, you can $crlf
    %e double click the preview box to see the new colour $crlf
    %e or press the Preview button $crlf $crlf
  }
  elseif (%m == NotFoundColour) {
    %e Recommended: Any Colour you like $crlf
    %e Default: 4 (Red) $crlf
    %e Location: Advanced - Not Found Colour $crlf $crlf
    %e This is the colour of IP not found $crlf
    %e and error messages given by the script. $crlf $crlf 
    %e If you change the colour number, you can $crlf
    %e double click the preview box to see the new colour $crlf
    %e or press the Preview button $crlf $crlf
  }
  elseif (%m == EchoPlace) {
    %e Recommended: Echo Place -gs $crlf
    %e Default: -gs $crlf
    %e Location: Advanced - /echo switch $crlf $crlf
    %e Please do NOT change this value if you $crlf
    %e do not know exactly what you are doing. $crlf $crlf
    %e -gs means the script will output messages $crlf
    %e to the Status Window, and that, if the $crlf
    %e Status Window is being logged, it will $crlf
    %e NOT include these messages in the Logs. $crlf $crlf
    %e A possible change is, if you wish $crlf
    %e all the messages to be logged, $crlf
    %e changed the switch to -s $crlf $crlf
    %e Putting an incorrect switch value here $crlf
    %e will break many parts of the script. $crlf $crlf
    %e Use /help /echo $crlf
    %e to see possible places you can choose $crlf
    %e if you want to change the place $crlf
    %e this script will display its messages. $crlf $crlf $crlf
  }
  elseif (%m == ChannelNames) {
    %e Recommended & Default: $chr(35) $crlf
    %e ( $chr(35) means ALL channels ) $crlf
    %e Location: Advanced - #Channel Names $crlf $crlf
    %e This list of channels applies only if $crlf
    %e you have enabled in the Options section, $crlf
    %e the option of either: $crlf
    %e ----------------------- $crlf
    %e Allow !ip in Channel $crlf
    %e Reply !country xx $crlf $crlf
    %e This list is then the channels within which $crlf
    %e there will be an Auto Response by this script $crlf
    %e to others typing: $crlf
    %e ------------------- $crlf
    %e !ip (followed by an IP number) $crlf
    %e !country (followed by a 2 digit country code) $crlf $crlf
    %e Some channels discourage such scripts being  $crlf
    %e active, so you can select only the channels $crlf
    %e you want individually, or disable these $crlf
    %e alltogether in the Options Tab. $crlf $crlf
  }
  elseif (%m == PersonalSettings) {
    %e The following file holds your Personal Settings: $crlf
    %e ------------------------------------------------ $crlf
    %e $scriptdirip2country.lookup.personal.ini $crlf $crlf
    %e This file is created the first time you $crlf
    %e Save & Close this Settings & Options dialog. $crlf $crlf
    %e The file has 2 purposes $crlf
    %e 1) To hold your Options & Settings if you Upgrade ip2country $crlf
    %e 2) To keep your own personal 2nd Level Domains list $crlf $crlf
    %e The file contains the following: $crlf
    %e - List of 2nd Level Domains $crlf
    %e - Display colour, & place to echo messages, variables $crlf
    %e - List of Options & their settings $crlf $crlf
    %e The 2nd Level Domains list is created from the initial list $crlf
    %e included in the ip2country.lookup.ini file, and then all $crlf
    %e additions or deletions are recorded in the Personal Settings file $crlf $crlf
    %e The Personal Settings file can be DELETED in the Utilities Section. $crlf
    %e There is no harm deleting this file, and the ip2country script $crlf
    %e will work perfectly without it. $crlf $crlf
    %e Usually thehe reason for deleting this file is that the saved settings $crlf
    %e and modified 2nd Level Domains list are not what is wanted anymore, $crlf
    %e or you want to take advantage of new 2nd Level Domains in an updated $crlf
    %e database - ip2country.lookup.ini $crlf $crlf
    %e When there is no Personal Setting file, a new one is auto created $crlf
    %e when this Settings & Options dialog is Saved & Closed. $crlf $crlf
    %e $crlf
  }
  elseif (%m == UpdateDatabase) {
    %e Location: Update Database $crlf $crlf
    %e ip2country works by looking up IP information in a database that is  $crlf
    %e slightly modified from the original database found at Maxmind.com  $crlf $crlf
    %e To use the new database, you will have to unload the old database, $crlf
    %e and load up the new one. These options appear automatically $crlf
    %e and it is strongly recommended you follow those instructions. $crlf $crlf
    %e In case you do not unload and re-load the database, $crlf
    %e this will happen automaticall the next time your start up mIRC. $crlf $crlf
    %e The new Maxmind database file (released monthly) is downloaded from: $crlf
    %e http://geolite.maxmind.com/download/geoip/database/GeoIPCountryCSV.zip $crlf $crlf
    %e (1) You get the new database by going to the Update Database Section $crlf 
    %e and clicking the "Update Database" button. $crlf
    %e Your Browser should open for the download. $crlf $crlf
    %e (2) Once the ZIP  file is received, it should be unzipped into $crlf
    %e this script's directory: $crlf
    %e Example: $scriptdir $crlf $crlf
    %e (3) Next, in the Update Database section, the newly unzipped file: $crlf
    %e GeoIPCountryWhois.csv must be found and selected. $crlf
    %e This is done by clicking the "Find Your downloaded CSV file" button $crlf $crlf
    %e (4) Next, the selected CSV file is converted into this script's database $crlf
    %e by pressing the - "Convert Selected File Now" - button $crlf $crlf
    %e The new database file created and used by this script is called: $crlf
    %e ip2country.txt $crlf $crlf
    %e (5) Wait patiently (up to 1 minute) - mIRC will freeze $crlf
    %e and when the database is ready, a button will appear $crlf
    %e on the top right that says: "UN-load Old Database Immediately" $crlf
    %e Click this button. $crlf $crlf
    %e (6) This same button will immediately say "RE-load New Database Now !!" $crlf 
    %e Click the button again, and the new database will be loaded. $crlf $crlf $crlf 
  }
  elseif (%m == CountryLookupIntegrity) {
    %e Location: Utilities - Lookup Data Integrity Check $crlf $crlf
    %e This is a Diagnostic Utility that you should not have to use. $crlf $crlf
    %e In case you do use it, mIRC will freeze for over 1 minute. $crlf $crlf
    %e The reason for using this is when a new country code appears in the $crlf
    %e ip2country.txt database , and the corresponding 2 letter country code $crlf
    %e is not in the file: $crlf
    %e ip2country.lookup.ini $crlf $crlf
    %e This integrity check goes through EVERY entry in the ip2country.txt database $crlf
    %e and checks that there is a corresponding Country Code in the $crlf
    %e ip2country.lookup.ini file.
    %e $crlf 
  }
  elseif (%m == AllNicksDetails) {
    %e Deatails of All Nickname's in a Channel $crlf
    %e Location: Right Click in a Channel (popup) $crlf
    %e ip2c / Settings & Options / Utilities / #Chan All Nick's Details $crlf $crlf
    %e This is a little fun utility that shows all the nicks in a channel $crlf
    %e and the country of origin of their IP if it's available. $crlf $crlf
    %e It also shows the common channels all nicks are in with you. $crlf $crlf
  }
  elseif (%m == FindWord) {
    %e Find Words in a Channel $crlf
    %e Location: Right Click in a Channel (popup) $crlf
    %e ip2c / Settings & Options / Info/Help/About / Fun/Useful Stuff $crlf $crlf
    %e Scans the channel buffer and outputs the result to a custom window. $crlf $crlf
    %e 1. Find Words in #Channel - finds any instances of a given word $crlf
    %e 2. Find words of Nick - finds any instances of a Nickname $crlf $crlf
  }
  elseif (%m == Version) {
    %e This version of ip2country is: $ip2c.version $crlf $crlf
    %e It is always recommended to use the latest version of mIRC $crlf
    %e and this script would run best in mIRC ver 7.1+ $crlf $crlf
    %e However the script should run fine in versions 6.01 and upwards, $crlf
    %e if the file ip2c.bmp is in the same directory as the script. $crlf
    %e (This is due to a smll mIRC bug in versions 6.35 and below) $crlf $crlf
    %e Your present version of mIRC is $version $crlf $crlf
  }
  elseif (%m == email) {
    %e You can email - Free - the author of this script at: $crlf
    %e $crlf
    %e free@much.net $crlf $crlf
  }
  elseif (%m == webpage) {
    %e The official web page for this script is: $crlf
    %e %crlf $crlf
    %e http://www.much.net/forums/viewforum.php?f=45 $crlf $crlf
    %e Double click the link below to go straight there. $crlf $crlf
  }

  ;
  /did -c %d %id 1
}

ALIAS ip2c.About.Load {
  tokenize 32 $1-
  var %d = $1, %id = $2, %f = $script, %l = 1
  var %line = $read(%f,n,%l)
  did -r %d %id
  while ($left(%line,2) == ;#) {
    var %line = $right(%line,-2), %line = $left(%line,-1), %line = $replace(%line,########,##)
    did -a %d %id %line $+ $crlf
    inc %l
    var %line = $read(%f,n,%l)
  }
}

;Database.convert.GeoIP.to.ip2c
ALIAS ip2c.find.GeoIP.file {
  var %directory = $did(ip2cConfig,616,1), %dir = $+(",%directory,")
  var %c = $findfile(%dir,*.csv,0,1)
  var %f = $findfile(%dir,GeoIPCountryWhois.csv,0,1)
  echo -gs = %c instances of the CSV files found in %directory
  echo -gs = %f instances of the GeoIPCountryWhois found in %directory
  if (%f > 0) {
    if (%f = 1) { echo -gs Please confirm you want to convert $findfile(%dir,GeoIPCountryWhois.csv,1,1) }
  }
}
ALIAS ip2c.country.txt.file.info {
  var %file = $iif($1,$1,$scriptdir $+ ip2country.txt)
  var %fn = $+(",%file,")
  if ($isfile(%fn)) {
    if (($prop == filename) || ($prop == fname)) { return $nopath(%fn) }
    elseif ($prop == fullname) { return %file }
    elseif ($prop == created) || ($prop == time) { return $asctime($file(%fn).ctime,yyyy-mm-dd TT HH:nn:ss) }
    elseif ($prop == modtime) || ($prop == mtime) { return $asctime($file(%fn).mtime,yyyy-mm-dd TT HH:nn:ss) }
    elseif ($prop == size) { return $file(%fn).size }
    else { return File: %file - Created: $asctime($file(%fn).ctime,yyyy-mm-dd TT HH:nn:ss) - Size: $file(%fn).size }
  }
}

ALIAS ip2c.update { 
  if ($dialog(ip2cConfig)) { 
    did -o ip2cConfig 47 1 Connecting 
    did -o ip2cConfig 48 1 to website ... 
    did -o ip2cConfig 49 1 Please wait ...
    did -r ip2cConfig 50
  }
  if $sock(ip2c) { .sockclose ip2c }
  ;  sockopen ip2c www.much.net 80 

  if (%ip2c.Versions.Url.Path.File == $null) { ip2c.default.webpage }
  var %site = $gettok(%ip2c.Versions.Url.Path.File,1,32)
  var %path = $gettok(%ip2c.Versions.Url.Path.File,2,32)
  var %file = $gettok(%ip2c.Versions.Url.Path.File,3,32)

  set -u30 %ip2c.temp.socket.fileinfo %site %path %file
  sockopen ip2c %site 80 
}

on *:sockopen:ip2c*: {
  if (ip2c* iswm $sockname) {
    if $dialog(ip2cConfig) {
      %ip2c.temp.t = connecting
      if ($sockname == ip2c)      { ip2c.update.version.read %ip2c.temp.t }
    }
    else { .sockclose $sockname | halt }

    var %site = $gettok(%ip2c.temp.socket.fileinfo,1,32)
    var %path = $gettok(%ip2c.temp.socket.fileinfo,2,32)
    var %file = $gettok(%ip2c.temp.socket.fileinfo,3,32)
    var %s = sockwrite -n $sockname
    %s GET %path $+ %file HTTP/1.1
    %s Cache-Control: no-cache
    %s Accept: */*
    %s Connection: close
    %s Host: %site $+ $crlf $+ $crlf
    .timerip2c.sockopen 1 30 ip2c.update.website.noreply $sockname
    .unset %ip2c.temp.socket.fileinfo
    set %ip2c.temp.sock.binary.read $false
  }
}



on *:sockread:ip2c*: {
  if ($sockerr) {
    var %ip2c.temp.t = sockerror
    if ($sockname == ip2c)      { ip2c.update.version.read %ip2c.temp.t }
    .sockclose $sockname
    if $timer(ip2c.sockopen) { .timerip2c.sockopen off } 
    halt
  }
  var %ip2c.temp.t, &ip2c.temp.t
  :nextread
  if ($sock($sockname)) {
    if (!%ip2c.temp.sock.binary.read) {
      sockread %ip2c.temp.t
      if (!%ip2c.temp.t) { 
        halt 
      }
      else {
        if (HTTP/* 404* iswm %ip2c.temp.t) {   
          ;  ip2c.update.version.read 404 File not found
          if ($sockname == ip2c)      { ip2c.update.version.read 404 }
          .sockclose $sockname
          if $timer(ip2c.sockopen) { .timerip2c.sockopen off } 
          halt
        }
        if (HTTP/* 200* iswm %ip2c.temp.t) {
          ; ip2c.update.version.read 200 - file found
          if ($sockname == ip2c)      { ip2c.update.version.read 200 }
          .timerip2c.sockopen 1 20 ip2c.update.website.noreply $sockname
          halt
        }
        if (HTTP/* 503* iswm %ip2c.temp.t) {
          ; ip2c.update.version.read 503 Service Unavailable
          if ($sockname == ip2c)      { ip2c.update.version.read 503 }
          .timerip2c.sockopen 1 20 ip2c.update.website.noreply $sockname
          halt
        }
        .timerip2c.sockopen 1 20 ip2c.update.website.noreply $sockname
        if ($sockname == ip2c)      { ip2c.update.version.read %ip2c.temp.t }
        goto nextread
      }
    }
    if ($sockbr > 0) { goto nextread }
  }
}

ALIAS ip2c.update.version.read {
  var %ip2c.temp.t = $1-, %finished
  var %ver = $iif(%ip2c.Version == $null,Version $ip2c.version,%ip2c.Version) 
  if ($dialog(ip2cConfig)) { 
    if (%ip2c.temp.t = connecting) {
      did -o ip2cConfig 47 1 Connected ...
      did -o ip2cConfig 48 1 Getting latest
      did -o ip2cConfig 49 1 information
      did -r ip2cConfig 50
      return
    }
    elseif (%ip2c.temp.t = sockerror) {
      did -o ip2cConfig 47 1 Connection to 
      did -o ip2cConfig 48 1 ip2c website
      did -o ip2cConfig 49 1 has failed !
      did -r ip2cConfig 50
      return
    }
    ; Service Unavailable
    elseif (%ip2c.temp.t = 503) {
      did -o ip2cConfig 47 1 The Website cannot be
      did -o ip2cConfig 48 1 reached or the website 
      did -o ip2cConfig 49 1 is down. Please try
      did -o ip2cConfig 50 1 again later.
      return
    }
    ; File Not Found
    elseif (%ip2c.temp.t = 404) {
      did -o ip2cConfig 47 1 The Versions file
      did -o ip2cConfig 48 1 is not available on
      did -o ip2cConfig 49 1 the website
      did -r ip2cConfig 50
      return
    }
    ; File Found
    elseif (%ip2c.temp.t = 200) {
      did -o ip2cConfig 47 1 Versions file found
      did -o ip2cConfig 48 1 Reading Data
      did -r ip2cConfig 49
      did -r ip2cConfig 50
      return
    }
    ; Reading Data
    elseif (%ip2c.temp.t = NoData) { 
      did -o ip2cConfig 47 1 The Requested File
      did -o ip2cConfig 48 1 does not contain
      did -o ip2cConfig 49 1 needed info!!
      did -r ip2cConfig 50
      return
    }
    ; No Reply
    elseif (%ip2c.temp.t = NoReply) { 
      did -o ip2cConfig 47 1 Websited Timed out
      did -o ip2cConfig 48 1 Either site down or 
      did -o ip2cConfig 49 1 no file or no proper 
      did -o ip2cConfig 50 1 data in file.
      return
    }
    ; New Version available at Website
    elseif (($gettok(%ip2c.temp.t,1,59) == ip2country) && ($gettok(%ip2c.temp.t,2,59) > %ver)) {
      did -o ip2cConfig 47 1 Update Time!
      did -o ip2cConfig 48 1 New Ver. $gettok(%ip2c.temp.t,2,59)
      did -o ip2cConfig 49 1 available on
      did -o ip2cConfig 50 1 the website!
      var %finished = $true
    }
    ; Versions are the same
    elseif (($gettok(%ip2c.temp.t,1,59) == ip2country) && ($gettok(%ip2c.temp.t,2,59) == %ver)) {
      did -o ip2cConfig 47 1 You have the latest
      did -o ip2cConfig 48 1 Version %ip2c.Version
      did -o ip2cConfig 49 1 No need to
      did -o ip2cConfig 50 1 update now!
      var %finished = $true
    }
    ; Version on website is older than this one
    elseif (($gettok(%ip2c.temp.t,1,59) == ip2country) && ($gettok(%ip2c.temp.t,2,59) < %ver)) {
      did -o ip2cConfig 47 1 Your Ver: %ip2c.Version
      did -o ip2cConfig 48 1 is newer 
      did -o ip2cConfig 49 1 than what is
      did -o ip2cConfig 50 1 on the website!!
      var %finished = $true
    }
    else {
    }
    if (%finished) {
      .sockclose ip2c
      if $timer(ip2c.sockopen) { .timerip2c.sockopen off } 
    }
  }
}

; Needs parameter of $sockname
ALIAS ip2c.update.website.noreply {
  if ($dialog(ip2cConfig)) { 
    if $did(ip2cConfig,448).isid {
      if $did(ip2cConfig,448,1) == Reading Data { 
        var %ip2c.temp.t = NoData
        if ($1 == ip2c)      { ip2c.update.version.read %ip2c.temp.t }
      }
    }
    else {
      var %ip2c.temp.t = NoReply
      if ($1 == ip2c)      { ip2c.update.version.read %ip2c.temp.t }
    }
  }
  if $sock($1) { .sockclose $1 }
}

/*

*/
