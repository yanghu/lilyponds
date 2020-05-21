\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% \include "definitions.ily"
\include "../common/common.ily"

% Only show the last few bars for easier typesetting.
% showFirstLength = R2*5
% showLastLength = R1*5

% Default staff size is 20
#(set-global-staff-size 20)


mBreak = {\break} 
blank-before = {R1*2 r2 r4 r8}
global = {
    \tempo 4=65
    \key e \minor
    \time 2/4
}


\header {
  title= "Erster Verlust"
%   subsubtitle = "Note the phrasing and dynamics."
  composer="Robert Schumann"
  tagline = ##f
}

guitarA = {
    \relative {
    \repeat volta 2 {
        \partial 8 <g'-3\RH i\1>8|
        % 1
        fis e dis e|
        b4. e8|
        c4. e8|
        b4. b8|
        % 5
        c c b a|
        g g fis e |
        dis4. e8|
        dis4. g'8|  \mBreak
        % 9
        fis e dis e|
        b4. e8|
        c4. e8|
        b4. b8|
        % 13
        c c b a|
        g g fis e |
        dis4. fis8 |
        \partial 4. e4.| \mBreak
    }
    \repeat volta 2{
        \partial 8 e'8|
        % 17
        d c b c|
        a b c e|
        d c b c|
        e,= dis e r|
        r4 r8 g'='|
        fis e dis e|
        d! c b c|
        b a g g'='|
        fis e dis e|
        b4. e8|
        c4. e8|
        b4. e,=8|
        d'!='8 c r e,=|
        c'=' b a g|
        g4 dis|
        \partial 4. g4 r8|
    }
    }
}


guitarB = {
    \relative {
    \repeat volta 2 {
        \partial 8 r8 |
        R2|
        r8 g= e4|
        r8 a= e4|
        r8 g e4|
        r8 fis[ dis fis]|
        r8 e[ a, ais]|
        r8 ais b4~|
        b8[ b b] r|

        R2|
        r8 g' e4|
        r8 a= e4|
        r8 g e4|
        r8 fis[ dis fis]|
        r e[ a, ais]|
        r ais b a!|
        \partial 4. g e[ e]| 
    }
    \repeat volta 2{
        \partial 8 r8|

        % 17
        r4. e'8|
        f[ d c] r|
        r4 r8 a'|
        c a e g|
        <<
        % main voice
        {
            fis8 e dis e|
            b4. g'8|
            fis e dis e|
            d! c b <dis a'>|
        } \\
        { c=2| b| a~| a4 b|}
        >>
        <e g>2|

        r8 g e4|
        r8 a e4|
        r8 g e4|
        <gis b>8 <a c> r e|
        dis e a,-. ais-.|
        b4 b|
        \partial 4. g8[ e'] e,|

    }
    }
}


\score{
\new StaffGroup{
    <<
    \new Staff \with{
        instrumentName = "Guitar" 
        midiInstrument = "acoustic guitar (nylon)"
    }{
        \global
        \clef "G_8"
        \guitarA
    }

    % \new TabStaff \with{
		% \clef moderntab
        % \guitarA
    % }

    \new Staff \with{
        instrumentName = "Guitar" 
        midiInstrument = "acoustic guitar (nylon)"
    }{
        \global
        \clef "G_8"
        \guitarB
    }
    >>
}

}

% Midi output of both guitar, with 2 measures drum before starting.
\score{
\new StaffGroup{
    << 
    \new Staff \with{
        midiInstrument = "acoustic guitar (nylon)"
        % midiInstrument = "acoustic guitar (steel)"
    }{
        \global
        \clef "G_8"
        \blank-before
        % \guitarA
    }
    \new Staff \with{
        midiInstrument = "acoustic guitar (nylon)"
        % midiInstrument = "acoustic guitar (steel)"
    }{
        \global
        \clef "G_8"
        \set Staff.midiMinimumVolume = #0.7
        \blank-before
        \unfoldRepeats 
        \guitarB
    }
 	\new DrumStaff <<
        \global
	  \drummode {
	    << {
        \set Staff.midiMaximumVolume = #0.7
	      \repeat unfold 72 bd4\ff
	    } 
	   >>
	  }
	>>
    >>
}
\midi{
}
}
