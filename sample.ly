\version "2.20.0"
\include "common.ily"

% Only show the last few bars for easier typesetting.
% showFirstLength = R2*5
% showLastLength = R1*5

% Blank bars before starting the MIDI
blank-before = {R1*3}

% Uncomment to add tab.
% withTab = 1

\header {
  title= "Title"
%   subsubtitle = "Note the phrasing and dynamics."
  composer="Anonymous"
  tagline = ##f
}

global = {
    \tempo 4=160
    \key c \major
    \time 4/4
}

guitarA = {
    \relative{
        \partial 8 c8
        \repeat volta 2 {
            c'
        }
    }
}

% useGuitarB = 1
guitarB = {
    \relative{
        \repeat volta 2 { }
    }
}

\include "guitar-template.ily"