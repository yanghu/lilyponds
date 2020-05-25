\version "2.20.0"
\include "common.ily"
\include "classical-guitar.ily"

% Only show the last few bars for easier typesetting.
% showFirstLength = R2*5
% showLastLength = R1*5

% mBreak = {}
% Blank bars before starting the MIDI
blank-before = {R2. R4}

% "sliding fingering"
RHmm = \rightHandFinger \markup{\italic "-m"}
% Uncomment to add tab.
% withTab = 1

% \mergeDifferentlyHeadedOn
% \mergeDifferentlyDottedOn
\header {
  title= "Españoleta"
%   subsubtitle = "Note the phrasing and dynamics."
  composer="Gaspar Sanz"
  tagline = ##f
}

global = {
    \tempo "Grazioso" 4=104-116
    \key c \major
    \time 3/4
}

arrowU = \markup{\musicglyph "arrowheads.open.11"}
arrowD = \markup{\musicglyph "arrowheads.open.1M1"}


melody = \relative{

        \slurNeutral
        \partial 2 <a-2\RHm>4 <b-0\RHa>|
        % m1
        \appoggiatura{c16-1 d-3}
        <c-1\RHm>4. b8\RHi c4\RHm |
        
        % m2
        \moveFingering #'(0 . -0.5)
        <d-4\RHi>4 e\RHm^\arrowU 
            \moveFingering #'(0 . -0.5)
            <f\RHi-1>|
        % m3

        \appoggiatura{e16-0 f-1}
        <e-0\RHm>4.
           \moveFingering #'(0 . -0.5)
           <d-4\RHi>8^\arrowD c4\RHm| 
        % m4
        e4\RHa^\arrowU f\RHm e\RHi| \mBreak
        % m5
        \once \override TextScript.staff-padding = #4
        <>\pos #3
        \moveStrokeFingering #'(0 . 1)
        <a-4\RHm>4. \moveStrokeFingering #'(0 . 1)
               <g-2\RHi>8 a4\RHm|  
        \once \override TextSpanner.staff-padding = #8
        <>\startModernFullBarre #3
        \moveStrokeFingering #'(0 . 2)
        <d,-1\RHm>4 
          <e-3\rightHandFinger \markup{\italic "-m"}> 
          <f-4\RHa>
        \tweak bound-details.right.padding #1
        \glissando |

        \stringRight
        \moveStrokeFingering #'(0 . 0.5)
        \moveStringNumber #'(0 . 0.75)
        <e-4\2\RHm>2. \stopBarre \bar "||"|

        % Part 2
        r4 c\RHi d\RHm|

        \appoggiatura{e16-0 f-1}
        e4.\RHa <d-4\RHm>8 c4\RHi|
        <e-0\RHa> <d-4\RHm> <c-1\RHi>| 
        \mBreak
        % Add a new top voice 
        <<
            {
                \shiftOn
                \slurNeutral
                \appoggiatura{b16-0 c-1}
            \moveStrokeFingering #'(-0.5 . 0)
                <b-0\RHm>4.
                \moveStrokeFingering #'(-1 . 0)
                <c-1\RHmm>8 b4\RHi | 

            \moveStrokeFingering #'(-0.5 . 0)
            <b-0\RHm> <c-1\RHi> 
                \moveStrokeFingering #'(-0.5 . -0.75)
              <d-3\RHm>| } 
        \\
        \new Voice{
            \voiceThree
            \shiftOff
            \fingerUp
            \moveStrokeFingering #'(0 . 1)
            <g='-4\RHa>2. | 
            \fingerLeft
            \moveStrokeFingering #'(0 . 1)
            <g-4\RHa>2 r4
            % \stemNeutral
        }
    >>

    \appoggiatura{c,16-1 d-4}
    c='4.\RHi b8\RHm <a-3\RHi>4^\arrowD|
    <b-0\RHm> <a-3\RHi>^\arrowD \fingerDown <gis-1\RHm>|
    \fingerLeft

    \set Staff.strokeFingerOrientations = #'(up)
    \partial 2 <a-3\RHi c-2\RHm e-0\RHa>2|
    \bar "||"
    \mBreak

    \set Staff.strokeFingerOrientations = #'(up down)
    \set Score.currentBarNumber = #15

    % Part 3
    \partial 4 <b-0\RHm>4|

    \appoggiatura{c16-1 d-4}
    <c-1\RHi>4. b8\RHm <a-2\RHi>4^\arrowD|
    \fingerUp 
    % \moveFingering #'(0 . -2)
    \moveStrokeFingering #'(0 . 1.5)
    <b-0\RHm>2 e4\RHa^\arrowU| \fingerLeft

    \moveStrokeFingering #'(0 . 1.5)
    <e-0\rightHandFinger \markup{\italic "-a"}>4. <d-4\RHm>8 <c-1\RHi>4|

    \appoggiatura{b16-0 c-1}
    <b-0\RHm>2. | \mBreak

    \appoggiatura{e16-0 f-1}
    e4.\RHa f8\RHm <g-4\RHi>4 | 

    \appoggiatura{f16-1 g-3}
    f4.\RHa e8\RHm <d-4\RHi>4^\arrowD|

    \appoggiatura{b16-0 c-1}
    b4.\RHm <a-3\RHi>8^\arrowD <gis-1\RHm>4|
    \partial 4 <a-3\RHi>4|

    \bar "|."
}

pedal = \relative{
    \partial 2 s2|
    % m1
    a,2.|
    <g-3>|
    <c-3>|
    c|
    % m5
    \moveStrokeFingering #'(-0.3 . 0.4)
    <f-1\RHp>|
    <b-2\RHi g,-1\RHp>2.|

    \stringRight
    \moveStringNumber #'(0 . -0.5)
    \moveStrokeFingering #'(0 . -1)
    <c-3\3\RHi  c,-1\tweak extra-offset #'(0.75 . 0)\5\RHp> |

    % Part 2
    s2.|
    <c,=-3>|
    <c-3>4 <b-2> <a-0>|
    <g-3>2. | 
    <g'=-0>| 
    a,2.|
    <e'=-2>|
    \partial 2 <a,=,-0>2|

    \partial 4 s4|
    a=,2.|
    \fingerDown 
    % \moveFingering #'(0.2 . 0.75)
    <gis'=-1\RHp>4 \fingerLeft <e-2>2|

    <a-2\RHi f-3\RHp>2.|
    \fingerDown
    <e-2>2 \fingerLeft <e,-0>4 |

    <c'=-3>2.|
    d|
    \fingerDown
    <e-2> |
    a,=,4|

}

guitarA = {

	\override Staff.StringNumber #'font-size = #-6
    <<
    \melody \\
    \pedal
    >>
}

% useGuitarB = 1
guitarB = {
    \relative{
        \repeat volta 2 { }
    }
}

\layout{
    \context{
        \Staff
        \override StrokeFinger.staff-padding = #3
    }
}
\include "guitar-template.ily"