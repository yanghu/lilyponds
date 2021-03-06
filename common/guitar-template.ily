\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% \include "definitions.ily"
% \include "common.ily"


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

    \ifDefinedThenElse #'withTab  % code for the capo case
    {
        \new TabStaff {
            \clef moderntab
            \guitarA
        }
    }
    % else
    {}

    \ifDefinedThenElse #'useGuitarB
    {
        \new Staff \with{
            instrumentName = "Guitar" 
            midiInstrument = "acoustic guitar (nylon)"
        }{
            \global
            \clef "G_8"
            \guitarB
        }
    }
    {}
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
        % \set Staff.midiMaximumVolume = #0.5
        \set Staff.midiMaximumVolume = #0.7
        \blank-before
        \guitarA
    }

    \ifDefinedThenElse #'useGuitarB
    {
        \new Staff \with{
            % midiInstrument = "acoustic guitar (nylon)"
            % midiInstrument = "harmonica"
            midiInstrument = "acoustic grand"
            % midiInstrument = "piccolo"
            % midiInstrument = "acoustic guitar (steel)"
        }{
            \global
            \clef "G_8"
            % \set Staff.midiMinimumVolume = #0.7
            \blank-before
            \guitarB
        }
    }
    {}

 	\new DrumStaff <<
    \global
	  \drummode {
	    << {
        % \set Staff.midiMaximumVolume = #0.7
          \set Staff.midiMinimumVolume = #0.8
	      \repeat unfold 20 bd4\ff
	    } 
	   >>
	  }
	>>
    >>
}
\midi{
}
}
