
#(define RH rightHandFinger)
#(set-global-staff-size 23)


\paper {
  % where you enter your page settings, eg.:
  #(set-default-paper-size "letter")
  ragged-bottom = ##t
%   ragged-right = ##t
%   ragged-last = ##t
%   ragged-last-bottom = ##f
  page-count = 1 % <= 1 page only wanted
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
    \set Staff.strokeFingerOrientations = #'(up down)
    \set TabStaff.restrainOpenStrings = ##t
    \context{
        \Staff
        \override StrokeFinger.font-size = -1
        % \bravuraOn
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