\version "2.20" %% <= still a pretty stable version

#(set-global-staff-size 18) %% size "18" could be the right for one full page

\paper {
  % where you enter your page settings, eg.:
  #(set-default-paper-size "letter")
  ragged-last-bottom = ##f
  page-count = 1 % <= 1 page only wanted
  oddFooterMarkup = "This page is copyrighted"
%   annotate-spacing = ##t 
}

\header {
  title = "24 exercices très faciles" % <= are they?
  composer = "Fernando SOR (1778-1839)"
  piece = "No. 22"
  opus = "Op. 35"
  % etc.
}

global = {
  \clef "treble_8" 		% <= for guitar, basic
  % This is better, it overrides the default settings.
  % See: http://lilypond.org/doc/v2.18/Documentation/notation/beams#Known-issues-and-warnings-61
    \overrideTimeSignatureSettings
      3/4               % timeSignatureFraction
      1/8               % baseMomentFraction
      #'(2 2 2)           % beatStructure
      #'()		% beamExceptions  
  \time 3/4		% <= for example
  % To have 2 2 2 beaming.
%   \set Timing.beamExceptions = #'()
  \key b\minor 	% <= 'cose I love it!
  \tempo 4 = 108
}

FirstVoice = {
  | % mes.1
    <d'-2>2 4
  | % mes.2
    <fis'-1>2 4
  | % mes.3
    s2. 
  | % mes.4
    s2.
  | % mes.5
    s2.
  | % mes.6
    s2.
  | % mes.7
    s2.
  | % mes.8
    s2.
  | % mes.9
    s2.
  | % mes.10
    s2.
  | % mes.11
    s2. 
  | % mes.12
    s2.
  | % mes.13
    s2.
  | % mes.14
    s2.
  | % mes.15
    s2.
  | % mes.16
    s2.
  \repeat volta 2 {
    | % mes.17
      s2. 
    | % mes.18
      s2. 
    | % mes.19
      s2.
    | % mes.20
      s2.
    | % mes.21
      s2.
    | % mes.22
      s2.
    | % mes.23
      s2.
    | % mes.24
      s2.
    | % mes.25
      s2. 
    | % mes.26
      s2.
    | % mes.27
      s2.
    | % mes.28
      s2. 
    | % mes.29
      s2.
    | % mes.30
      s2.
    | % mes.31
      s2.
    | % mes.32
      s2.
    | % mes.33
      s2. 
    | % mes.34
      s2. 
    | % mes.35
      s2.
    | % mes.36
      s2.
    | % mes.37
      s2.
    | % mes.38
      s2. 
    | % mes.39
      s2.
    | % mes.40
      s2. 
    | % mes.41
      s2.
    | % mes.42
      s2. 
    | % mes.43
      s2.
    | % mes.44
      s2.
    | % mes.45
      s2. 
    | % mes.46
      s2.
    | % mes.47
      s2.
    | % mes.48
      s2.
  }
}

SecondVoice = {
  | % mes.1
  % Move the B out of the main column so notes in voices 1 and 3 can be merged. 
  % Since voice 1 is ON, voice 3 is OFF, we need to shift using Onn so voice 2 doesn't collide with either.
    \shiftOnn b,2.~  
  | % mes.2
    2.
  | % mes.3
    s2. 
  | % mes.4
    s2.
  | % mes.5
    s2.
  | % mes.6
    s2.
  | % mes.7
    s2.
  | % mes.8
    s2.
  | % mes.9
    s2.
  | % mes.10
    s2.
  | % mes.11
    s2. 
  | % mes.12
    s2.
  | % mes.13
    s2.
  | % mes.14
    s2.
  | % mes.15
    s2.
  | % mes.16
    s2.
  \repeat volta 2 {
    | % mes.17
      s2. 
    | % mes.18
      s2. 
    | % mes.19
      s2.
    | % mes.20
      s2.
    | % mes.21
      s2.
    | % mes.22
      s2.
    | % mes.23
      s2.
    | % mes.24
      s2.
    | % mes.25
      s2. 
    | % mes.26
      s2.
    | % mes.27
      s2.
    | % mes.28
      s2. 
    | % mes.29
      s2.
    | % mes.30
      s2.
    | % mes.31
      s2.
    | % mes.32
      s2.
    | % mes.33
      s2. 
    | % mes.34
      s2. 
    | % mes.35
      s2.
    | % mes.36
      s2.
    | % mes.37
      s2.
    | % mes.38
      s2. 
    | % mes.39
      s2.
    | % mes.40
      s2. 
    | % mes.41
      s2.
    | % mes.42
      s2. 
    | % mes.43
      s2.
    | % mes.44
      s2.
    | % mes.45
      s2. 
    | % mes.46
      s2.
    | % mes.47
      s2.
    | % mes.48
      s2.
  }
}

ThirdVoice = {
  % Not needed, since we set the time beam exception globally only once.
  % See: http://lilypond.org/doc/v2.18/Documentation/notation/beams#Known-issues-and-warnings-61
  % \overrideTimeSignatureSettings 3/4 1/4 #'(1 1 1) #'()
  % \set fingeringOrientations = #'(left)
  % For better merging noteheads. Voice 3 default is UP, but that prevents merging noteheads with voice 1.
  \stemNeutral

  | % mes.1
    d'8  <b-4> <fis-3> b d'8 b
  | % mes.2
    fis'8 d' fis d' fis' d'
  | % mes.3
    s2. 
  | % mes.4
    s2.
  | % mes.5
    s2.
  | % mes.6
    s2.
  | % mes.7
    s2.
  | % mes.8
    s2.
  | % mes.9
    s2.
  | % mes.10
    s2.
  | % mes.11
    s2. 
  | % mes.12
    s2.
  | % mes.13
    s2.
  | % mes.14
    s2.
  | % mes.15
    s2.
  | % mes.16
    s2.
  \repeat volta 2 {
    | % mes.17
      s2. 
    | % mes.18
      s2. 
    | % mes.19
      s2.
    | % mes.20
      s2.
    | % mes.21
      s2.
    | % mes.22
      s2.
    | % mes.23
      s2.
    | % mes.24
      s2.
    | % mes.25
      s2. 
    | % mes.26
      s2.
    | % mes.27
      s2.
    | % mes.28
      s2. 
    | % mes.29
      s2.
    | % mes.30
      s2.
    | % mes.31
      s2.
    | % mes.32
      s2.
    | % mes.33
      s2. 
    | % mes.34
      s2. 
    | % mes.35
      s2.
    | % mes.36
      s2.
    | % mes.37
      s2.
    | % mes.38
      s2. 
    | % mes.39
      s2.
    | % mes.40
      s2. 
    | % mes.41
      s2.
    | % mes.42
      s2. 
    | % mes.43
      s2.
    | % mes.44
      s2.
    | % mes.45
      s2. 
    | % mes.46
      s2.
    | % mes.47
      s2.
    | % mes.48
      s2.
  }
}

FourthVoice = {
  | % mes.1
    s4 fis2
  | % mes.2
    s4 fis2
  | % mes.3
    s2. 
  | % mes.4
    s2.
  | % mes.5
    s2.
  | % mes.6
    s2.
  | % mes.7
    s2.
  | % mes.8
    s2.
  | % mes.9
    s2.
  | % mes.10
    s2.
  | % mes.11
    s2. 
  | % mes.12
    s2.
  | % mes.13
    s2.
  | % mes.14
    s2.
  | % mes.15
    s2.
  | % mes.16
    s2.
  \repeat volta 2 {
    | % mes.17
      s2. 
    | % mes.18
      s2. 
    | % mes.19
      s2.
    | % mes.20
      s2.
    | % mes.21
      s2.
    | % mes.22
      s2.
    | % mes.23
      s2.
    | % mes.24
      s2.
    | % mes.25
      s2. 
    | % mes.26
      s2.
    | % mes.27
      s2.
    | % mes.28
      s2. 
    | % mes.29
      s2.
    | % mes.30
      s2.
    | % mes.31
      s2.
    | % mes.32
      s2.
    | % mes.33
      s2. 
    | % mes.34
      s2. 
    | % mes.35
      s2.
    | % mes.36
      s2.
    | % mes.37
      s2.
    | % mes.38
      s2. 
    | % mes.39
      s2.
    | % mes.40
      s2. 
    | % mes.41
      s2.
    | % mes.42
      s2. 
    | % mes.43
      s2.
    | % mes.44
      s2.
    | % mes.45
      s2. 
    | % mes.46
      s2.
    | % mes.47
      s2.
    | % mes.48
      s2.
  }
}

%% The score:
\score {
  % "with" clause configures settings for this Staff instance only.
  % see: http://lilypond.org/doc/v2.18/Documentation/notation/changing-context-default-settings#changing-just-one-specific-context
  \new Staff \with {
    instrumentName = "Guitar" %% <= of course!
  }
  { 
  \global
  \mergeDifferentlyHeadedOn
  \mergeDifferentlyDottedOn
  <<
    \new Voice { \voiceOne \FirstVoice }
    \new Voice { \voiceTwo \SecondVoice }
    \new Voice { \voiceThree \ThirdVoice }
    \new Voice { \voiceFour \FourthVoice }
  >>
  }
  \layout { 	
    system-count = 10 % <= this should fit. Number of rows.
    % Setup default values for all "Staff"s
    % See http://lilypond.org/doc/v2.18/Documentation/notation/changing-context-default-settings
    \context{
      \Voice
      fingeringOrientations = #'(left)
    }
  }
}
  \midi { 		% <= if mid output is needed
     \tempo 4 = 108 
  }