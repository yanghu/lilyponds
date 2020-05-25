\version "2.20.0"  % necessary for upgrading to future LilyPond versions.
\include "custom-music-fonts/smufl/definitions.ily"

\include "classical-guitar.ily"
\include "common.ily"

#(define RH rightHandFinger)

numBars = 1
beatsPerBar = 4

blank-before = {R1*3}
global = {
    \tempo 4=160
    \key g \major
    \time 3/4
}

Over = {
%%%% just added
  \override DynamicTextSpanner.style = #'none
  \override Fingering.staff-padding = #'()
  \override Fingering.add-stem-support = ##t
  %try
%   \override StringNumber.add-stem-support = ##t
%   \override StrokeFinger.add-stem-support = ##t
  %done
  % \override DynamicText.self-alignment-X = #-1
  \override Glissando.minimum-length = #4
  \override Glissando.springs-and-rods = #ly:spanner::set-spacing-rods
  \override Glissando.thickness = #2
  \override Glissando.minimum-length = #4
%%%%%
  %\override TupletNumber.font-size = #.8
 % \override NoteColumn.ignore-collision = ##t
}


\paper {
  % where you enter your page settings, eg.:
  #(set-default-paper-size "letter")
  ragged-last-bottom = ##t
%   page-count = 1 % <= 1 page only wanted
  tagline =  ##f
%   oddFooterMarkup = "This page is copyrighted"
%   annotate-spacing = ##t 
}

\header {
  title= Minuet
%   subsubtitle = ""
  composer="J.S. Bach"
  tagline = ##f
}

guitarA = {
    \relative {
    \repeat volta 2 {
        <g-0-\RH i\3>8 b d g a, fis' |
        g4 g, g|
        g8 b d g a, fis' |
        g4 g, g|
        <>\pos "V"
        e'4 e e8 <g-4>|
        <d-3>4 <d-3> d8 g|
        c,4 d8 c b c|
        a2.|

        g8 b d g a, fis' |
        g4 g, g|
        g8 b d g a, fis' |
        g4 g, g|

        e'4 d8 c b a|
        d4 c8 b a g |
        \tuplet 3/2{a8 b c} d,4 fis|
        g2.
    }
    \repeat volta 2{
        g8 a b a g fis |
        g4 e e|
        g'8 fis e g fis e|
        fis4 b, b|
        g'8 fis e g fis e|
        fis4 b, e|
        \override TupletBracket.bracket-visibility = ##t
        % \override TupletBracket.padding = #2
        \override TupletBracket.positions = #'(-3 . -3)
        % \override TupletBracket.bracket-flare = #'( 0 . 0)

        \tuplet 3/2{fis8 g a} b,4 dis|
        e dis8 e fis4|
        g g8 fis e d|
        e4 e8 d c b|
        c4 c8 b a g |
        fis4 e8 fis d4|
        a' d, d|
        b' d, d|
        c' d8 c b c |
        a2.|

        g8 b d g a, fis' |
        g4 g, g|
        g8 b d g a, fis' |
        g4 g, g|

        e'4 d8 c b a|
        d4 c8 b a g |
        a8 b d,4 fis|
        g2.
    }
    }
}

guitarB = \relative{
    \repeat volta 2 {
        g2 d4|
        g,8 b d g d b|
        g2 d'4|
        g,8 b d g d b|

        c4 g' c,|
        b g' b,|
        a fis' g|
        d8 e fis d e fis|

        g2 d4|
        g,8 b d g d b|
        g2 d'4|
        g,8 b d g d b|
        c4 e g|
        b, d g|
        c, d d|
        g d g,|
    }    

    \repeat volta 2 {
        e'=4 dis b|
        e b e,|
        e' g b|
        b,8 dis fis b fis dis|
        e4 g b|
        b, a' g|
        a b b,|
        e2.|
        b=,4 d g|
        c,= d e|
        a, b c|
        d g d|
        fis8 d fis d fis d|
        g d g d g d|
        fis4 d g |
        d8 e fis d e fis|

        g2 d4|
        g,8 b d g d b|
        g2 d'4|
        g,8 b d g d b|
        c4 e g|
        b, d g|
        c, d d|
        g d g,|

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
\layout{
    \set Staff.fingeringOrientations = #'(left)
    \set Staff.strokeFingerOrientations = #'(up down)
    \set TabStaff.restrainOpenStrings = ##t
    \context{
        \Staff
        \override StrokeFinger.font-size = -1
        \bravuraOn
    }
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
        % {R1*2}
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
        % \unfoldRepeats 
        \guitarB
    }
    \drumTrack 3 4 4 20 100
    % \drumBg \global #(* numBars beatsPerBar)
    >>
}
\midi{
}
}
