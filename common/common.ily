\include "custom-music-fonts/smufl/definitions.ily"


#(define RH rightHandFinger)
#(set-global-staff-size 23)


\paper {
  % where you enter your page settings, eg.:
  #(set-paper-size "letter")

  % ragged-bottom = ##t
%   ragged-right = ##t
  ragged-last = ##t
  ragged-last-bottom = ##t
  % page-count = 1 % <= 1 page only wanted
  two-sided = ##t
  outer-margin = 10
  binding-offset = 10
  top-margin = 15
  tagline =  ##f
%   annotate-spacing = ##t
  system-system-spacing = #'((stretchability . 3)
                        (basic-distance . 12)
                        (minimum-distance . 10)
                        (padding . 5))
%   oddFooterMarkup = "This page is copyrighted"
}

% Guitar specific settings.
\layout{
    \set Staff.fingeringOrientations = #'(left)
    % \set Staff.stringOrientations = #'(right)
    \set Staff.strokeFingerOrientations = #'(up down)
    \set TabStaff.restrainOpenStrings = ##t
    \context{
        \Staff
        \override StrokeFinger.font-size = -2
        \override StrokeFinger.staff-padding = #2
        \override StrokeFinger.avoid-slur = #'inside

        \override Fingering.font-size = -6
        \override Fingering.padding = 0.2
        % Fingerings appear inside staff when up/down

        \override Fingering.staff-padding = #'()

        \bravuraOn
    }
    \context{
        \Score
        \override Beam #'damping = #0.5
        % heavier appearance
        \override StaffSymbol #'thickness = #1.2
        \override Beam #'beam-thickness = #0.55
        % Heavier glissandro
        \override Glissando.thickness = #1.5

    }
}

mBreak = { \break }

  %% \ifDefinedThenElse symbol expression else-expression
  %%
  %% If the symbol is defined, returns the expression.
  %% Otherwise, returns the else-expression.

  ifDefinedThenElse =
  #(define-music-function (parser location sym music else) (symbol? ly:music? ly:music?)
    (if (defined? sym)
     music else))

  %% Example:
  %%
  %% \ifDefinedThen #'leadWords  \lyricsto lead \ifDefined #'leadWords


% nom/demon is time signature
%  beat defines how many beats per whole note(4 means beat every quarter note)
%  bars is total bars. tempo is bpm.
%  Example: \drumNote 3 4 4 2 120
drumTrack = 
  #(define-music-function 
        (nominator denom beat bars tempo)
        (number? number? number? number? number?)
  % make the music.
      (make-music
      'SequentialMusic
      'elements
      (list 
              (make-music
              'TimeSignatureMusic
              'beat-structure
              '()
              'denominator
              4
              'numerator
              3)
              (make-music
              'SequentialMusic
              'elements
              (list (make-music
                      'TempoChangeEvent
                      'metronome-count
                      tempo
                      'tempo-unit
                      (ly:make-duration 
                              (inexact->exact (round (/ (log denom) (log 2))))
                      )
                      'text
                      '())
                      (make-music
                      'ContextSpeccedMusic
                      'context-type
                      'Score
                      'element
                      (make-music
                          'PropertySet
                          'value
                          (ly:make-moment (inexact->exact (round (/ tempo denom)) ))
                          'symbol
                          'tempoWholesPerMinute))))
              (make-music
              'UnfoldedRepeatedMusic
              'elements
              '()
              'repeat-count
              (* bars nominator)
              'element
              (make-music
                  'SequentialMusic
                  'elements
                  (list (make-music
                          'NoteEvent
                          'drum-type
                          'bassdrum
                          'duration
                          (ly:make-duration 
                              (inexact->exact (round (/ (log beat) (log 2))))
                          )))))))
      )