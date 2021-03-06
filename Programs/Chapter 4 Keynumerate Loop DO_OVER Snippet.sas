/* "Chapter 4 Keynumerate Loop DO_OVER Snippet.sas" from the SAS Press book
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
  call missing (K, D, RC) ;
  put "Before Enumeration:" ;
  put +3 (RC K D) (=) ;
  put "During Enumeration:" ;
  do while (H.DO_OVER(KEY:3) = 0) ;
    put +3 (K D) (=) ;
  end ;
  put "After Enumeration:" ;
  put +3 (RC K D) (=) ;
  stop ;
run ;
