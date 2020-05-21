\version "2.20.0"
\include "common.ily"

% Only show the last few bars for easier typesetting.
% showFirstLength = R2*5
% showLastLength = R1*4

% Blank bars before starting the MIDI
% blank-before = {R1*3}
blank-before = {}

% Uncomment to add tab.
% withTab = 1

\header {
  title= "Le Petit Rien"
  subsubtitle = "Note the phrasing and dynamics."
  composer="Francois Couperin"
  tagline = ##f
}

global = {
    \tempo 4=160
    \key d \major
    \time 3/4
}

guitarA = {
    \relative{
        {
            d'4 a d |
            d2 r4|
            e a, e'|
            e2 r4|

            fis4 g8 fis e d|
            cis4 b8 cis a4| \mBreak

            b=4 c8 b a g|
            fis4 e8 fis d4|
            d'_\f a d|
            d2 r4|
            e4 a, e'|
            e2 r4| \mBreak

            fis4 g8 fis e d|
            cis4 b8 cis a4|
            b2 cis4|
            \once \override TextScript.padding = #2
            \once \override TextScript.X-offset = #1
            d2._\markup{\italic Fine}
        }
        \repeat volta 2 {
            a'='4-4^"II"_\p e-0 a|
            a2.| \mBreak

            g8 a g fis g e|
            fis4 e8 fis d4|
            a'='4 e a|
            a2.|

            g8 a g fis e d |
            e2.|


        }
    }
}

useGuitarB = 1
guitarB = {
    \relative{
        {
            d4 e fis|
            fis4 g8 fis e d|
            cis4 b cis|
            cis d8 cis b a|

            d4 cis b |
            a g fis | \mBreak

            g e a|
            d2.|

            d=4 e fis|
            fis g8 fis e d|
            cis4 b cis|
            cis d8 cis b a| \mBreak

            d4 cis b|
            a g fis|
            g e a|
            d2.|


        }
        \repeat volta 2 { 

            d4 e fis|
            fis8 g fis e fis d|
            g4 e a|
            d,=2 r4|
            d4 e fis|
            fis8 g fis e fis d|
            g8 fis e d cis b|
            a4 e a|
        }
    }
}

\include "guitar-template.ily"