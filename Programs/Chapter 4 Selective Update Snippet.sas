/* "Chapter 4 Selective Update Snippet.sas" from the SAS Press book
      Data Management Solutions Using SAS Hash Table Operations:
      A Business Intelligence Case Study
*/

data _null_ ;
  dcl hash H (multidata:"Y", ordered:"N") ;
  H.definekey ("K") ;
  H.definedata ("D") ;
  H.definedone () ;
  do K = 1, 2, 2, 3, 3, 3 ;
    q + 1 ;
    D = char ("ABCDEF", q) ;
    H.ADD() ;
  end ;
  h.output(dataset: "AsLoaded") ;
  put "Enumerate to update D=(D,F) with D=(X,Z):" ;
  do RC_enum = H.FIND(KEY:3) by 0 while (RC_enum = 0) ;
    D = translate (D, "XZ", "DF") ;
    RC_updt = H.REPLACEDUP() ;
    RC_enum = H.FIND_NEXT() ;
  end ;
  put +3 RC_updt= ;
  put "Enumerate again to check result:" ;
  do RC_enum = H.FIND(KEY:3) by 0 while (RC_enum = 0) ;
    put +3 RC_enum= D= ;
    RC_enum = H.FIND_NEXT() ;
  end ;
  stop ;
run ;
