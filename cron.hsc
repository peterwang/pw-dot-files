#!load hamster.hsm
#!load hwindows.hsm

### Scheduler ###

AtClear
AtAdd( getMails, "07:00", "23:30", "1111111", 15, true)
AtAdd( getNews, "07:00", "23:30", "1111111", 30, true)
AtAdd( mailNotify, "07:00", "23:30", "1111111", 1, true)
AtExecute
quit

sub getMails
    HamWaitIdle
    HamMailExchange
endsub

sub getNews
    HamWaitIdle
    HamNewsJobsClear
    HamNewsJobsPostDef
    HamNewsJobsPullDef
    HamNewsJobsStart
endsub

sub mailNotify
    varset( $user, "admin")
    varset( $timeout, 50)
    var( $mailCount )
    var( $mailsList )
    var( $ok )
    $mailsList = ListAlloc
    ListFiles ( $mailsList, HamPath + "\Mails\" + $user + "\*.msg" )
    $mailCount = ListCount( $mailsList )
    if ( $mailCount > 0 )
       $ok = popupbox( "You've got " + $mailCount + " message(s)!", "New mail alert", 0x40, $timeout, 0x2)
       if ( $ok = 1 )
          HamResetCounters
       endif
    endif
    ListFree ( $mailsList )
endsub
