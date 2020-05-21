\version "2.20" %% <= still a pretty stable version
\include "bending.ily"


#(set-global-staff-size 18) %% size "18" could be the right for one full page

\paper {
  % where you enter your page settings, eg.:
  #(set-default-paper-size "letter")
%   ragged-last-bottom = ##f
  page-count = 1 % <= 1 page only wanted
  tagline =  ##f
%   oddFooterMarkup = "This page is copyrighted"
%   annotate-spacing = ##t 
}

\header {
  title = "Daily exercices" % <= are they?
%   composer = "Fernando SOR (1778-1839)"
  arranger = "Yang Hu"
  % etc.
}

lhwalkingtips = \markup{
    \column{
        \box \line{\large \bold  {Left hand walking}}
        \small  {
            \line{Tips}
            \line {1. Striving for \bold consistency, not speed.}
            \line {2. Move quickly between notes, avoiding gaps between sound. (but \bold {play slow})}
            \line {3. Repeat for each finger.}
        }
    }
}

lhwalking = \relative{
   \repeat volta 2 {<f,-1>4 <ais-1> <dis-1>  <gis-1> <c-1> 
    <f-1> <c-1> <gis-1> <dis-1> <ais-1> }
   \repeat volta 2 {<fis-2>4 <b-2> <e-2>  <a-2> <cis-2> 
    <fis-2> <cis-2> <a-2> <e-2> <b-2> } 
    {s4\mark "Repeat for other fingers" s s s}
}

lhwalkingtwo = \relative{
   \repeat volta 2 {<f,-1>4 <ais-2> <dis-1>  <gis-1> <c-2> 
    <f-1> <c-2> <gis-1> <dis-2> <ais-1> }
   \repeat volta 2 {<fis-2>4 <b-3> <e-2>  <a-3> <cis-2> 
    <fis-3> <cis-2> <a-3> <e-2> <b-3> } 
    {s4\mark "Repeat for other fingers" s s s}
}
% Alternative Rhythmic variations
altrhythm = \relative{
    \xNote{g16 8 16 \tuplet 3/2 {8 8 8}}
}

\layout{
    \context{
        \Staff
        fingeringOrientations = #'(left)
    }
    ragged-right = ##f
}
\lhwalkingtips

\score{
    <<
    \new Staff{
        \clef "G_8"
        \time 10/4
        \lhwalking
    }
    \new TabStaff{
        \clef moderntab
        \lhwalking
    }
    >>
}

\markup{\bold \large \box \line {Left hand walking w/ alternating fingers}}
\markup{Note the difference in LH fingerings.}
\score{
    \new Staff{
        \clef "G_8"
        \time 10/4
        \lhwalkingtwo
    }
}

\markup{
    \box
    \bold 
    \line{Alternative Rhythmic Variations to use for all practices.}
}
\score{
    {
        \time 2/4
        \xNote{ 
            {<>^"Variation1" g'16 8 16 16 8 16} |
            {\tuplet 3/2 {8^\markup{Variation 2} 8 8} \tuplet 3/2 {8 8 8 }} |
            {8.^\markup{Variation 3} 16 8. 16} |
            {16^\markup{Variation 4} 8. 16 8.} |
        }
    }
}

\score{
    \relative{
        \unfoldRepeats \repeat volta 12 \tuplet 3/2 {c''8(^\markup{\small H} d^\markup{\halign #-4 \small P} c) }
        %  \override TextScript.padding = 3
        \override TextScript.font-size = -2 
        \override TextScript.avoid-slur = #'outside
        \override TextScript.X-offset = 1.5 
        \unfoldRepeats \repeat volta 12 \tuplet 3/2 {c8(^"H" d)-(^"P" c) }
    }
}