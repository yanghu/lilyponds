
\version "2.20.0"
\include "common.ily"
\include "classical-guitar.ily"

% Only show the last few bars for easier typesetting.
% showFirstLength = R2*5
% showLastLength = R1*5

% Blank bars before starting the MIDI
blank-before = {R2 R4}

% Uncomment to add tab.
% withTab = 1

% \mergeDifferentlyHeadedOn
% \mergeDifferentlyDottedOn
\header {
  title= "O Susana"
%   subsubtitle = "Note the phrasing and dynamics."
  composer="Stephen Foster"
  tagline = ##f
}

global = {
    \tempo 4=70
    \key c \major
    \time 4/4
}

guitarA = {
    \relative{
        \partial 4 g4 |
        b d d e |
        d b g a |
        b b a g |
        a2. a4|
        b d d e|
        d b2 a4|
        b b a a |
        g1|
        c2 c|
        e4 e2 e4|
        d d b g|
        a2. a4|
        b d d e|
        d b g a|
        b b a a |
        \partial 2. g2.|

    }
}

useGuitarB = 1
guitarB = {
    \relative{
        \partial 4 s4 |
        \chordmode{
            g,1 |
            g, |
            g, |
            d,1 |
            g,1|
            g,|
            g,2 d,2|
            g,1|
            c,|
            c,|
            g,|
            d,|

            g,1|
            g,|
            g,2 d,2|
            \partial 2. g,2.|
        }
    }
}

\include "guitar-template.ily"