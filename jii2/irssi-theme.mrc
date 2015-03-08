the irssi theme script wasn't made by me (rdv/shane), but had been heavily modified
;;to work with the rest of the script.
;;;;Please do not remove this script or many things will break.
;;;;Feel free to modify the theme however


alias say irssi::message $active $1-
alias msg irssi::message $1-
alias me irssi::action $active $1-
alias notice irssi::notice $1-
alias ctcp irssi::ctcp $1-
alias ctcpreply irssi::ctcpreply $1-
alias away irssi::away $1-
alias dns irssi::dns $1-
alias describe me $1-
alias action ame $1-
alias amsg {
  if ($isid) return
  var %c = $chan(0)
  while (%c) {
    irssi::message $chan(%c) $1-
    dec %c
  }
}
alias ame {
  if ($isid) return
  var %c = $chan(0)
  while (%c) {
    irssi::action $chan(%c) $1-
    dec %c
  }
}
alias irssi::message {
  if ($isid) return
  !.msg $1-
  if ($show) {
    if ($1 ischan) {
      echo -ti $+ $calc($len($strip($timestamp)) + 3) $1 $+(14<15,$iif($left($nick($1,$me).pnick,1) isin $prefix,$v1,$chr(160)),00,$me,14>) $+(15,$2-,)
    }
    elseif ($query($1)) {
      echo -ti $+ $calc($len($strip($timestamp)) + 3) $1 $+(14<00,$me,14>) $+(15,$2-,)
    }
    elseif ($chat($1)) {
      echo -ti $+ $calc($len($strip($timestamp)) + 3) $+(=,$1) $+(14<00,$me,14>) $+(15,$2-,)
    }
    else {
      echo -ti $+ $calc($len($strip($timestamp)) + 3) 14[05message14(04 $+ $1 $+ 14)14] $+(15,$2-,)
    }
  }
}
alias irssi::action {
  if ($isid) return
  !.describe $1-
  if ($show) {
    if ($1 ischan) {
      echo -ti $+ $calc($len($strip($timestamp)) + 3) $1 00 * $me $+  $+(15,$2-,)
    }
    elseif ($query($1)) {
      echo -ti $+ $calc($len($strip($timestamp)) + 3) $1 00 * $me $+  $+(15,$2-,)
    }
    elseif ($chat($1)) {
      echo -ti $+ $calc($len($strip($timestamp)) + 3) $+(=,$1) 00 * $me $+  $+(15,$2-,)
    }
    else {
      echo -ti $+ $calc($len($strip($timestamp)) + 3) 14[05action14(04 $+ $1 $+ 14)14] $+(15,$2-,)
    }
  }
}
alias irssi::notice {
  if ($isid) return
  !.notice $1-
  if ($show) {
    echo -ti $+ $calc($len($strip($timestamp)) + 3) 14[05notice14(04 $+ $1 $+ 14)14] $+(15,$2-,)
  }
}
alias irssi::ctcp {
  if ($isid) return
  !.ctcp $1-
  if ($show) {
    echo -ati $+ $calc($len($strip($timestamp)) + 3) 14[05ctcp14(04 $+ $1 $+ 14)14] $+(15,$2,) $+(15,$3-,)
  }
}
alias irssi::ctcpreply {
  if ($isid) return
  !.ctcpreply $1-
  if ($show) {
    echo -ti $+ $calc($len($strip($timestamp)) + 3) 14[05notice14(04 $+ $1 $+ 14)14] $+(15,$2,) $+(15,$3-,)
  }
}
alias irssi::away {
  if ($isid) return
  !.away $1-
  if ($1-) {
    if ($read(files/away.txt,nw,$1-)) {
      write $+(-dl,$readn) files/away.txt
    }
    if ($lines(files/away.txt) > 5) {
      write $+(-dl,$v1) files/away.txt
    }
  }
}
alias irssi::awaylog {
  if (%::awaylog) {
    echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 00i: $+(00,%::awaylog,) 15new messages in awaylog:
    echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ --- Log opened $asctime(%::awayopened)
    if ($read(logs\awaylog.txt,nw,--- Log opened $asctime(%::awayopened))) {
      if ($fopen(awaylog)) .fclose $v1
      .fopen awaylog logs\awaylog.txt
      .fseek -l awaylog $readn
      while (!$feof) {
        var %fread = $fread(awaylog)
        if (%fread == --- Log closed $asctime(%::awayclosed)) break
        echo -s %fread
      }
      .fclose awaylog
    }
    echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ --- Log closed $asctime(%::awayclosed)
  }
  else {
    echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15No new messages in awaylog
  }
}
alias irssi::dns {
  if ($isid) return
  !.dns $1-
  if ($show) {
    var %host = $1
    if (-?* iswm $1) var %host = $2
    if ($ial(%host)) var %host = $v1
    if ($pos(%host,@)) var %host = $mid(%host,$calc($v1 + 1))
  }
}
alias irssi::scheme {
  if ($lof($+(files/scheme/,%scheme,.txt)) = 0) return
  if ($fopen(scheme)) .fclose $v1
  .fopen scheme $+(files/scheme/,%scheme,.txt)
  while (!$feof) {
    var %scheme = $fread(scheme)
    if (REM * iswm %scheme) || (;* iswm %scheme) || (#* iswm %scheme) || ($len(%scheme) = 0) continue
    if ($gettok(%scheme,1,32) isnum 0-15) {
      var %RGB = $gettok(%scheme,2,32)
      var %R = $base($mid(%RGB,1,2),16,10)
      var %G = $base($mid(%RGB,3,2),16,10)
      var %B = $base($mid(%RGB,5,2),16,10)
      color $v1 $rgb(%R,%G,%B)
    }
    else {
      color %scheme
    }
  }
  .fclose scheme
}
alias irssi::indent {
  var %indent = 1
  if ($gettok($readini($mircini,options,n4),12,44)) var %indent = %indent + $len($timestamp)
  if ($1 isnum) var %indent = %indent + $1
  return %indent
}
on *:START: {
  if (!%scheme) {
    set %scheme ansi
    clearall
  }
}
on *:CONNECT: {
  if (%::away) {
    away %::awaymsg
  }
}
on *:DISCONNECT: {
  unset %::join. [ $+ [ $cid ] $+ ] *
  unset %::query. [ $+ [ $cid ] $+ ] *
  unset %::whois. [ $+ [ $cid ] $+ ] *
  unset %::whowas. [ $+ [ $cid ] $+ ] *
}
on *:EXIT: {
  unset %::join.*
  unset %::query.*
  unset %::whois.*
  unset %::whowas.*
}
alias awaystuff {
}
alias tagg {
  if (@ isin $2) {
    var %l = 1
    var %i = $ial(*!*@* $+ $right($2,-1) $+ /*,0)
    while (%l <= %i) {
      var %nick = $j.getnick($ial(*!*@* $+ $right($2,-1) $+ /*,%l))
      var %host = $j.gethost($ial(*!*@* $+ $right($2,-1) $+ /*,%l))
      if (%nick ison $1) && (/bot/ !isin %host) { var %tag = %nick / %tag }
      inc %l
    }
    return $left(%tag,-1)
  }
}
on *:INPUT:*: {
  if ($away == $true) && ($left($1,1) != /) { raw -q away }
  .timeraway 1 3 $+ $r(550,600) scid -a away auto-away: send me a pm and I'll get back to you $date(mm/dd/yyyy h:nntt) $readini(main.ini,main,location)
  if ($left($1,1) == /) && (!$ctrlenter) return
  if ($halted) return
  haltdef
  var %str = $1-
  if ($me ison $active) {
    if ($left($1,1) == @) && ($tagg($active,$1) != $null) {
      irssi::message # addressed: $tagg($active,$1)
      var %str = $gettok(%str,2-,32)
    }
    irssi::message # %str
  }
  elseif ($query($active)) irssi::message $v1 %str
  elseif ($chat($mid($active,2))) irssi::message $+(=,$v1) %str
}
on ^&*:TEXT:*:*: {
  if (message isin $hget($network $+ . $+ $chan,ignore)) { halt }
  if ($halted) return
  haltdef
  if ($gettok($1-,0,3) >= 5) { var %msg = $strip($1-) }
  if ($gettok($1-,0,3) < 5) { var %msg = $1- }
  if (#) && ($chan != #services) {
    if ($me isin $1-) || ($anick isin $1-) {
      if (%::away) {
        inc %::awaylog
        write logs\awaylog.txt $timestamp $+(#,:) $+(14<,$+($+(15,$iif($left($nick(#,$nick).pnick,1) isin $prefix,$v1,$chr(160)),),$+(08,$nick,)),14>) $+(00,%msg,)
        window -g2 #
      }
      echo -lbfmti $+ $calc($len($strip($timestamp)) + $len($nick) + 4) # $+(14<15,$+($+(15,$iif($left($nick(#,$nick).pnick,1) isin $prefix,$v1,$chr(160)),),$+(11,$nick,)),14>) $+(00,%msg,)
    }
    else {
      echo -lbfmti $+ $calc($len($strip($timestamp)) + $len($nick) + 4) # $+(14<15,$+($iif($left($nick(#,$nick).pnick,1) isin $prefix,$v1,$chr(160)),3,$nick),14>) $+(00,$1-,)
    }
  }
  else {
    if (%::away) {
      .timer 1 2 window -g2 $nick
      inc %::awaylog
      write logs\awaylog.txt $timestamp $+(14<04,$nick,14>) $+(15,$1-,)
    }
    echo -bfmti $nick $+(14<04,$nick,14>) $+(15,$1-,)
  }
}
on ^&*:ACTION:*:*: {
  if ($chan != $null) { var %echo.to = $chan }
  if ($chan == $null) { var %echo.to = $nick }
  echo -i %echo.to $timestamp 00 * $nick $+  $+(15,$1-,)
  haltdef
  halt
}
;  if (join isin $hget($network $+ . $+ $chan,ignore)) { halt }
;  if ($halted) return
;  haltdef
;  if (#) {
;    echo -lbfmti # 00 * $nick $+  $+(15,$1-,)
;  }
;  else {
;    if (%::away) {
;      inc %::awaylog
;      write logs\awaylog.txt $timestamp 00 * $nick $+  $+(15,$1-,)
;      window -g2 $nick
;    }
;    echo -bfmti $chan $nick 00 * $nick $+  $+(15,$1-,)
;  }
;}
on ^&*:NOTICE:*:*: {
  if ($halted) return
  haltdef
  if ($nick == nickserv) && ($hget(lca.nickserv,$network) != $null) {
    if (access flag isin $1 $2) {
      if (o isin $3) { hadd -m op. $+ $network $5 op | var %lca = op }
      if (v isin $3) { hadd -m voice. $+ $network $5 voice | var %lca = voice %lca }
      if (F isincs $3) { hadd -m founder. $+ $network $5 founder | var %lca = founder %lca }
      if (f isincs $3) { hadd -m modify. $+ $network $5 modify | var %lca = edit-flags %lca }
      if (%lca != $null) { i.echo -s Channel access for $5 $+ : %lca }
    }
    haltdef | return | halt
  }
  if (#) {
    echo -bfmti $+ $calc($len($strip($timestamp)) + 3) # $+(14-13,$nick,14:06,#,14-) $+(15,$1-,)
  }
  else {
    echo -abfmti $+ $calc($len($strip($timestamp)) + 3) 14-13 $+ $nick $+ 14(06 $+ $address $+ 14)14- $+(15,$1-,)
    if ($query($nick)) {
      echo -bfmti $+ $calc($len($strip($timestamp)) + 3) $nick 14-13 $+ $nick $+ 14(06 $+ $address $+ 14)14- $+(15,$1-,)
    }
  }
}
on ^&*:JOIN:#: {
  if (join isin $hget($network $+ . $+ $chan,ignore)) { halt }
  if ($halted) return
  haltdef
  if ($nick == $me) {
    inc %::join. [ $+ [ $cid ] $+ . $+ [ # ] ]
  }
  echo -ti $+ $calc($len($strip($timestamp)) + 3) # 12♦ $+(11,$nick,) $+(14[10,$address,14]) 15has joined $+(00,#,)
}
on ^&*:PART:#: {
  if (part isin $hget($network $+ . $+ $chan,ignore)) { halt }
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) # 12♦ $+(10,$nick,) $+(14[15,$address,14]) 15has left $+(00,#,) $+(14[15,$1-,14])
}
on ^&*:TOPIC:#: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) # 12♦ $+(00,$nick,) 15changed topic of $+(00,#,) 15to: $+(15,$1-,)
}
on ^&*:RAWMODE:#: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) # 12♦ $+(15mode/10,#,) $+(14[15,$1-,14]) 15by $+(00,$nick,)
}
on ^&*:KICK:#: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) # 12♦ $+(10,$knick,) 15was kicked from $+(00,#,) 15by $+(00,$nick,) $+(14[15,$1-,14])
}
on ^&*:NICK: {
  if ($halted) return
  haltdef
  if ($nick == $me) {
    var %c = $chan(0)
    while (%c) {
      var %# = $chan(%c), %c = %c - 1
      echo -ti $+ $calc($len($strip($timestamp)) + 3) %# 12♦ 15You are now known as $+(00,$newnick,)
    }
  }
  else {
    var %c = $comchan($newnick,0)
    while (%c) {
      var %# = $comchan($newnick,%c), %c = %c - 1
      echo -ti $+ $calc($len($strip($timestamp)) + 3) %# 12♦ $+(10,$nick,) 15is now known as $+(11,$newnick,)
    }
  }
}
on ^&*:QUIT: {
  if ($halted) return
  haltdef
  var %c = $comchan($nick,0)
  while (%c) {
    var %# = $comchan($nick,%c), %c = %c - 1
    if (quit !isin $hget($network $+ . $+ %#,ignore)) { echo -ti $+ $calc($len($strip($timestamp)) + 3) %# 12♦ $+(10,$nick,) $+(14[15,$address,14]) 15has quit $+(14[15,$1-,14]) }
  }
  if ($query($nick)) {
    echo -ti $+ $calc($len($strip($timestamp)) + 3) $nick 12-15!12- $+(10,$nick,) $+(14[15,$address,14]) 15has quit $+(14[15,$1-,14])
  }
}
on ^&*:CHAT:*: {
  if ($halted) return
  haltdef
  if (ACTION ?* iswm $1-) {
    echo -bfmti $+ $calc($len($strip($timestamp)) + 3) =$nick 00 * $nick $+  $+(15,$mid($1-,9,-1),)
  }
  else {
    echo -bfmti $+ $irssi::indent($calc($len($nick) + 3)) =$nick $+(14<04,$nick,14>) $+(15,$1-,)
  }
}
on ^&*:INVITE: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(00,$nick,) 15invites you to $+(00,#,)
}
on ^&*:USERMODE: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15Mode change $+(14[15,$1-,14]) 15for user $+(00,$nick,)
}
on ^&*:SNOTICE:*: {
  if (o isin $usermode) { haltdef | return | halt }
  if ($halted) return
  haltdef
  echo -mti $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(03!,$nick,) $+(15,$1-,)
}
on ^&*:NOTIFY: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(00,$nick,) 15is now online
}
on ^&*:UNOTIFY: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(00,$nick,) 15is now offline
}
alias rdns {
  hadd -mu2 rdns $1 1
  dns $1
}
on &*:DNS: {
  if ($halted) return
  haltdef
  if ($dns(0)) {
    var %r = $v1
    while (%r) {
      var %dv = $dns($v1)
      var %dvip = $dns($v1).ip
      var %dvaddr = $dns($v1).addr
      if ($hget(rdns,%dv) != $null) {
        if ($remove(%dv,.) !isnum) { dns %dvip }
        if ($remove(%dv,.) isnum) { dns %dvaddr }
        ;hdel rdns %dv
      }
      if ($hget(dns,$remtok($dns(%r).ip $dns(%r).addr,$dns(%r),1,32)) == $null) {
        hadd -mu2 dns $remtok($dns(%r).ip $dns(%r).addr,$dns(%r),1,32) 1
        echo -tia $+ $calc($len($strip($timestamp)) + 3) 12♦ 00dns: 15Resolved $+(10,$dns(%r),) 15to $+(10,$remtok($dns(%r).ip $dns(%r).addr,$dns(%r),1,32),)
      }
      dec %r
    }
  }
  else {
    echo -tia $+ $calc($len($strip($timestamp)) + 3) 12♦ 00dns: 15Unable to resolve $+(10,$iif($address,$v1,$nick),)
  }
  else { halt }
}
on &*:CTCPREPLY:*: {
  if ($halted) return
  haltdef
  echo -tia $+ $calc($len($strip($timestamp)) + 3) 15CTCP $+(00,$1,) 15reply from $+(00,$nick,) $+ 15: $+(15,$2-,)
}
CTCP &*:*:*: {
  if ($1 == DCC) return
  if ($halted) return
  haltdef
  if (#) {
    echo -ti $+ $calc($len($strip($timestamp)) + 3) $+(09,$nick,) $+(14[03,$address,14]) 03requested CTCP $+(09,$1,) 03from $+(09,#,) $+ 15: $+(15,$2-,)
  }
  else {
    echo -ti $+ $calc($len($strip($timestamp)) + 3) $+(09,$nick,) $+(14[03,$address,14]) 03requested CTCP $+(09,$1,) 03from $+(09,$me,) $+ 15: $+(15,$2-,)
    if ($query($nick)) {
      echo -ti $+ $calc($len($strip($timestamp)) + 3) $nick $+(09,$nick,) $+(14[03,$address,14]) 03requested CTCP $+(09,$1,) 03from $+(09,$me,) $+ 15: $+(15,$2-,)
    }
  }
}
alias addnotify {
  var %a = 1
  var %b = $nick($1,0)
  while (%a <= %b) {
    if ($nick($1,%a) isop $1) { .notify $nick($1,%a) }
    inc %a
  }
}
raw 598:*:{
  if ($window(@notify) == $null) { window -ne @notify }
  echo -ts 14[5 $+ $1 6/13away14]0 $1 is away: $5-
  hadd -m away $1 $4
  haltdef
}
raw 599:*:{
  if ($window(@notify) == $null) { window -ne @notify }
  echo -ts 14[5 $+ $1 6/13unaway14]0 $1 is no longer away 14(13Duration6:00 $duration($calc($ctime - $hget(away,$1)),1) $+ 14)
  echo -t @notify 14[5 $+ $1 6/13unaway14]0 $1 is no longer away 14(13Duration6:00 $duration($calc($ctime - $hget(away,$1)),1) $+ 14)
  hdel away $1
  haltdef
}
raw 600:*:{
  if ($window(@notify) == $null) { window -ne @notify }
  echo -ts 14[5 $+ $1 14[5 $+ $1 6/13logon14]0 $1 is now on IRC
  echo -t @notify 14[5 $+ $1 6/13logon14]0 $1 is now on IRC
  hdel away $1
  haltdef
}
raw 609:*:{
  if ($window(@notify) == $null) { window -ne @notify }
  echo -ts 14[5 $+ $1 14[5 $+ $1 6/13lcurrent14]0 $1 is on IRC [away]
  echo -t @notify 14[5 $+ $1 6/13logon14]0 $1 is on IRC [away]
  hadd -m away $1 $4
  haltdef
}
raw 601:*:{
  if ($window(@notify) == $null) { window -ne @notify }
  echo -ts 14[5 $+ $1 14[5 $+ $1 6/13logoff14]0 $1 has quit IRC
  echo -t @notify 14[5 $+ $1 6/13logoff14]0 $1 has quit IRC
  hdel away $1
  haltdef
}
raw 324:*: {
  if ($halted) return
  haltdef
  if (%::join. [ $+ [ $cid ] $+ . $+ [ $2 ] ]) {
    echo -ti $+ $calc($len($strip($timestamp)) + 3) $iif($2 ischan,$v1) 12♦ 00irc: 15Join to $+(00,$2,) 15was synced in $+(00,$calc(($ticks - %::join. [ $+ [ $cid ] $+ . $+ [ $2 ] ]) / 1000),) 15secs
    dec %::join. [ $+ [ $cid ] $+ . $+ [ $2 ] ]
    if (%::join. [ $+ [ $cid ] $+ . $+ [ $2 ] ] = 0) unset %::join. [ $+ [ $cid ] $+ . $+ [ $2 ] ]
  }
  echo -ti $+ $calc($len($strip($timestamp)) + 3) $iif($2 ischan,$v1) 12♦ $+(15mode/10,$2,) $+(14[15,$3-,14])
}
raw 329:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) $iif($2 ischan,$v1) 12♦ 15Channel $+(10,$2,) 15created $asctime($3) $+ 
}
raw 367:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(00,$2,) $+ 15: 15ban $+(10,$3,)
}
raw 368:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15End of Channel Ban List
}
raw 404:*: {
  if ($halted) return
  haltdef
  if ($3- != $null) { var %why = $+(14[03,$3-,14]) }
  echo -ati $+ $calc($len($strip($timestamp)) + 3) 12♦ 15Unable to message $+(00,$2,) %why
}
raw 482:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(00,$2,) 15You're not channel operator
}
raw 396:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(00,$2,) 15is now your hidden host
}
raw 451:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15Register first!
}
raw 311:*: {
  if ($halted) return
  haltdef
  if (%::query. [ $+ [ $cid ] $+ . $+ [ $2 ] ]) {
    echo -ti $+ $calc($len($strip($timestamp)) + 3) $2 12♦ $+(00,$2,) $+(14[,$+(15,$3,),15@,$+(15,$4,),14])
    echo -ti $+ $irssi::indent(6) $2 2╳15  15ircname  $fixw(8,7) 15: $+(15,$6-,)
  }
  else {
    if (%::whois. [ $+ [ $cid ] ]) {
      echo -ati $+ $calc($len($strip($timestamp)) + 3) 12♦ 15End of WHOIS
    }
    inc %::whois. [ $+ [ $cid ] ]
    echo -ati $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(00,$2,) $+(14[,$+(15,$3,),15@,$+(15,$4,),14])
    echo -ati $+ $irssi::indent(6) 2╳15  15ircname  $fixw(8,7) 15: $+(15,$6-,)
  }
}
raw 319:*: {
  if ($halted) return
  haltdef
  if (%::query. [ $+ [ $cid ] $+ . $+ [ $2 ] ]) {
    echo -ati $+ $irssi::indent(7) $2 2╳15  15channels 15: $+(15,$sorttok($3-,32,c),)
  }
  else {
    echo -ati $+ $irssi::indent(7) 2╳15  15channels 15: $+(15,$sorttok($3-,32,c),)
  }
}
raw 312:*: {
  if ($halted) return
  haltdef
  if (%::query. [ $+ [ $cid ] $+ . $+ [ $2 ] ]) {
    echo -ati $+ $irssi::indent(6) $2 2╳15  15server $fixw(8,6) 15: $+(15,$3,) $+(14[15,$4-,14])
  }
  else {
    echo -ati $+ $irssi::indent(6) 2╳15  15server $fixw(8,6) 15: $+(15,$3,) $+(14[15,$4-,14])
  }
}
raw 378:*: {
  if ($halted) return
  haltdef
  if (%::query. [ $+ [ $cid ] $+ . $+ [ $2 ] ]) {
    echo -ati $+ $irssi::indent(6) $2 2╳15  15realip $fixw(8,6) 15: $+(15,$3,)
  }
  else {
    echo -ati $+ $irssi::indent(6) 2╳15  15realip $fixw(8,6) 15: $+(15,$6-,)
  }
}
alias fixw {
  var %a = $1
  var %b = $2
  var %c = $calc($calc(%a - %b) - 1)
  return $str( $+ $chr(32) $+ ,%c)
}
raw 320:*: {
  if ($halted) return
  haltdef
  if (%::query. [ $+ [ $cid ] $+ . $+ [ $2 ] ]) {
    echo -ati $+ $irssi::indent(6) $2 2╳15  15tag $fixw(8,7) 15: $+(15,$3-,)
  }
  else {
    echo -ati $+ $irssi::indent(6) 2╳15  15tag $fixw(8,3) 15: $+(15,$3-,)
  }
}

raw 336:*: {
  if ($halted) return
  haltdef
}
raw 379:*: {
  if ($halted) return
  haltdef
  if (%::query. [ $+ [ $cid ] $+ . $+ [ $2 ] ]) {
    echo -ati $+ $irssi::indent(6) $2 2╳15  15modes $fixw(8,5) 15: $+(15,$3-,)
  }
  else {
    echo -ati $+ $irssi::indent(6) 2╳15  1modes $fixw(8,5) 15: $+(15,$3-,)
  }
}
raw 671:*: {
  if ($halted) return
  haltdef
  if (%::query. [ $+ [ $cid ] $+ . $+ [ $2 ] ]) {
    echo -ati $+ $irssi::indent(6) $2 2╳15  15SSL $fixw(8,3) 15: $+(15,$3-,)
  }
  else {
    echo -ati $+ $irssi::indent(6) 2╳15  15SSL $fixw(8,3) 15: $+(15,$3-,)
  }
}
raw 330:*: {
  if ($halted) return
  haltdef
  if (%::query. [ $+ [ $cid ] $+ . $+ [ $2 ] ]) {
    echo -ati $+ $irssi::indent(6) $2 2╳15  15auth $fixw(8,4) 15: $+(15,$3,)
  }
  else {
    echo -ati $+ $irssi::indent(6) 2╳15  15auth $fixw(8,4) 15: $+(15,$3,)
  }
}
raw 338:*: {
  if ($halted) return
  haltdef
  if (%::query. [ $+ [ $cid ] $+ . $+ [ $2 ] ]) {
    echo -ati $+ $irssi::indent(6) $2 2╳15  15realip $fixw(8,6) 15: $+(15,$4-,) $+(14[15,$3,14])
  }
  else {
    echo -ati $+ $irssi::indent(6) 2╳15  15realip $fixw(8,6) 15: $+(15,$4-,) $+(14[15,$3,14])
  }
}
raw 313:*: {
  if ($halted) return
  haltdef
  if (%::query. [ $+ [ $cid ] $+ . $+ [ $2 ] ]) {
    echo -ati $+ $irssi::indent(6) $2 2╳15  15oper $fixw(8,4) 15: $+(00,$5-,)
  }
  else {
    echo -ati $+ $irssi::indent(6) 2╳15  15oper $fixw(8,4) 15: $+(00,$5-,)
  }
}
raw 317:*: {
  if ($halted) return
  haltdef
  if (%::query. [ $+ [ $cid ] $+ . $+ [ $2 ] ]) {
    echo -ati $+ $irssi::indent(6) $2 2╳15  15idle $fixw(8,4) 15: $+(15,$duration($3),) 14[15signon: $+(15,$asctime($4),) $+ 14]
  }
  else {
    echo -ati $+ $irssi::indent(6) 2╳15  15idle $fixw(8,4) 15: $+(15,$duration($3),) 14[15signon: $+(15,$asctime($4),) $+ 14]
  }
}
raw 318:*: {
  if ($halted) return
  haltdef
  if (%::whois. [ $+ [ $cid ] ]) {
    echo -ati $+ $calc($len($strip($timestamp)) + 3) 12♦ 15End of WHOIS
    dec %::whois. [ $+ [ $cid ] ]
    if (%::whois. [ $+ [ $cid ] ] = 0) unset %::whois. [ $+ [ $cid ] ]
  }
  elseif (%::query. [ $+ [ $cid ] $+ . $+ [ $2 ] ]) {
    echo -ati $+ $calc($len($strip($timestamp)) + 3) $2 12♦ 15End of WHOIS
    dec %::query. [ $+ [ $cid ] $+ . $+ [ $2 ] ]
    if (%::query. [ $+ [ $cid ] $+ . $+ [ $2 ] ] = 0) unset %::query. [ $+ [ $cid ] $+ . $+ [ $2 ] ]
  }
}
raw 301:*: {
  if ($halted) return
  haltdef
  if (%::whois. [ $+ [ $cid ] ]) {
    echo -ati $+ $calc($len($strip($timestamp)) + 3) 2╳15  15away     15: $+(15,$3-,)
  }
  elseif (%::query. [ $+ [ $cid ] $+ . $+ [ $2 ] ]) {
    echo -ati $+ $calc($len($strip($timestamp)) + 3) $2 2╳15  15away     15: $+(15,$3-,)
  }
  elseif (%::whowas. [ $+ [ $cid ] ]) {
    echo -ati $+ $calc($len($strip($timestamp)) + 3) 2╳15  15away     15: $+(15,$3-,)
  }
  else {
    echo -ati $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(00,$2,) 15is away: $+(15,$3-,)
  }
}
raw 314:*: {
  if ($halted) return
  haltdef
  inc %::whowas. [ $+ [ $cid ] ]
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(00,$2,) $+(14[,$+(15,$4,)15,@,,$+(15,$4,),14])
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 2╳15  15was      15: $+(15,$6-,)
}
raw 353:*: {
  if ($halted) return
  haltdef
  ; echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15Names on $+(00,$3,) $+ 15: $+(15,$4-,)
}
raw 355:*: {
  if ($halted) return
  haltdef
  ; echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15Names on $+(00,$3,) $+ 15: $+(15,$4-,)
}
raw 331:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) $iif($2 ischan,$v1) 12♦ $+(00,$2,) $+ 15: 15No topic set
}
raw 332:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) $iif($2 ischan,$v1) 12♦ 15Topic for $+(10,$2,) $+ 15: $+(15,$3-,)
}
raw 333:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) $iif($2 ischan,$v1) 12♦ 15Topic set by $+(00,$3,) $+(14[15,$asctime($4),14])
}
raw 441:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 14[05invite14(04 $+ $2 $+ 14)14] $+(15,$3,)
}
raw 443:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(00,$2,) 15is already on $+(00,$3,)
}
raw 352:*: {
  if ($chr(42) isin $7) && ($me ison $2) { cline 8 $2 $6 | hadd -mu10 ircops $2 $6 $hget(ircops,$2) }
  if ($hget(ialwho,$2) != $null) || ($hget(mass,who) != $null) { halt }
  if ($hget(sendwho,$2) != $null) { halt }
  if ($halted) return
  haltdef

  echo -sti $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(10,$2,) $+(00,$6,) $+(15,$7,) $+(15,$3,) $+ @ $+ $+(15,$4,) $+(14[00,$strip($9-),14])
  hinc -mu15 whocount. $+ $network $2 1
}
raw 315:*: {
  ;if ($hget(ircops,$2) != $null) { echo -ti $2 3⋚⋛ 2IRCops14:15 $ifmatch }
  if ($hget(ialwho,$2) != $null) { hdel ialwho $2 | halt }
  if ($halted) return
  haltdef
  if ($hget(whocount. $+ $network,$2) != $null) { var %a = 14(12 $+ $ifmatch users $+ 14) }
  echo -ati $+ $calc($len($strip($timestamp)) + 3) 12♦ 15End of /WHO list %a $+ 
}
raw 305:*: {
  if ($halted) return
  haltdef
  if (%::away == $!true) {
    echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ $2-
    set %::away $!false
    set %::awaymsg $awaymsg
    set %::awaytime $awaytime
    set %::awayclosed $ctime
    write logs\awaylog.txt --- Log closed $asctime(%::awayclosed)
    irssi::awaylog
  }
}
raw 306:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ $2-
  if (%::away == $!true) return
  set %::away $!true
  set %::awaymsg $awaymsg
  set %::awaytime $awaytime
  set %::awaylog 0
  set %::awayopened $ctime
  set %::awayclosed 0
  write logs\awaylog.txt --- Log opened $asctime(%::awayopened)
}
raw 421:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(15,$2,) 15Unknown command
}
raw 433:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15Nick $+(00,$2,) 15is already in use
}
raw 471:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15Cannot join to channel $+(00,$2,) 15(Channel is full)
}
raw 473:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15Cannot join to channel $+(00,$2,) 15(You must be invited)
}
raw 474:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15Cannot join to channel $+(00,$2,) 15(You are banned)
}
raw 475:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15Cannot join to channel $+(00,$2,) 15(You need a key)
}
raw 477:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15Cannot join to channel $+(00,$2,) 15(Registered only)
}
raw 401:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15There is no such nick $+(15,$2,)
}
raw 406:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15There is no such nick $+(15,$2,)
}
raw 403:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(00,$2,) $+ 15: 15No such channel
}
raw 251:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15There are $+(15,$4,) 15users and $+(15,$7,) 15invisible on $+(15,$10,) 15servers
}
raw 252:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(15,$2,) 15operator(s) online
}
raw 253:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(15,$2,) 15unknown connection(s)
}
raw 254:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(15,$2,) 15channels formed
}
raw 255:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15I have $+(15,$4,) 15clients and $+(15,$7,) 15servers
}
raw 001:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15Welcome to the Internet Relay Network, $+(15,$8,)
  .timer 1 10 ns.lchans $me
}
raw 002:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15Your host is $+(15,$left($5,-1),) $+ 15, running version $+(15,$8,)
}
raw 003:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ 15This server was created $+(15,$6-,)
}
raw 004:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(15,$2,) $+(15,$3,) $+(15,$4,) $+(15,$5,)
}
raw 005:*: {
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ $+(15,$deltok($2-,-5-,32),) 15are supported by this server
}
raw *:*: {
  if ($numeric == 321) || ($numeric == 322) || ($numeric == 323) return
  if ($halted) return
  haltdef
  echo -ti $+ $calc($len($strip($timestamp)) + 3) 12♦ $2-
}
