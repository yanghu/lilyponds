\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

#(define RH rightHandFinger)

\header {
  title=Morning
  subsubtitle = "Note the phrasing and dynamics."
  composer="Anton Diabelli\n(1781-1858)"
}

guitarA = \relative{
    \time 4/4
    <g-0-\RH m>4_\p\( <a-1-\RH i> b c |
    b a g2\)   |
    g4\( a b c |
    d b g2 \)  | \break

    e'4\( d c b |
    a\< b c d\!|
    c\> b a b \!|
    c2 \) r2| \break

    d4\mp\( b a g |
    e' d c2\) |
    f4\mf\( d e c |
    d b g2 \) | \break

    e'4_\f\( d c b |
    a b c d |
    c\> b a b \!|
    c2\)_\p r2 |
}

guitarB = \relative{
    \time 4/4
    <c~ e>1 |
    <c f> |
    <c~ e>1 |
    <c f> |

    <c e>1 |
    f2 d |
    g g,|
    c r |

    <g~ b>1|
    <g c> |
    << {g1_~| g}\\
    \new Voice {
        \shiftOff d'2 c | 
        b  \once \override Rest.staff-position = #0 r

        }
    >>
    c2 e |
    f d |
    g g, |
    c r|
}

\score{
\new StaffGroup{
    <<
    \new Staff {
        \clef "G_8"
        \guitarA
    }
    \new Staff{
        \clef "G_8"
        \guitarB
    }
    % \new TabStaff{
	% 	\clef moderntab
    % }
    >>
}
\layout{
    \set Staff.fingeringOrientations = #'(left)
    \set Staff.strokeFingerOrientations = #'(up down)
    \set TabStaff.restrainOpenStrings = ##t
    \context{
        \Staff
        \override StrokeFinger.font-size = -1
    }
}
}


% Midi output of both guitar, with 2 measures drum before starting.
\score{
\new StaffGroup{
    \tempo 4=120
    << 
    \new Staff {
        \clef "G_8"
        {R1*2}
        \guitarA
    }
    \new Staff{
        \clef "G_8"
        \set Staff.midiMaximumVolume = #0.7
        {R1*2}
        \guitarB
    }
 	\new DrumStaff <<
	  \drummode {
	    << {
	      \repeat unfold 28 bd4\ff
	    } 
	     >>
	  }
	>>
    >>
}
\midi{}
}
