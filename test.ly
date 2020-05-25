\version "2.20.0"  % necessary for upgrading to future LilyPond versions.
\include "common.ily"
\include "classical-guitar.ily"

\displayMusic  #(open-output-file "display.txt") { 
    % \tempo 8=120
    % \repeat unfold 10 \drummode{bd4}
    % \drumTrack 3 4 4 2 120
    \relative {c'' \startModernBarre #2 #4 d e f\stopBarre|
     <>\startPos #7  c d e \stopBarre f |
     
    <>\startString #4 g a b c,\pos #4 |
     d,\stopString e^\mute f g |
    %  <>  \startModernFullBarre #5
     \padSpanner
     <>\startString #3
     a, b c d\stopString |
     \padSpanner
     e' \startString #2 
      f g8\stopString f e d
     
     }
    % {\drumNote 2}
}
