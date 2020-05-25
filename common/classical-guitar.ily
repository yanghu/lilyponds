\include "barre.ily"

% Finger stroke symbols :
strokeUp = \markup\combine\override #'(thickness . 1.3) \draw-line #'(0 . 2)\raise #2 \arrow-head #Y #UP ##f
strokeDown = \markup\combine\arrow-head #Y #DOWN ##f \override #'(thickness . 1.3) \draw-line #'(0 . 2)

% Golpe symbol :
golpe = \markup {
  \filled-box #'(0 . 1) #'(0 . 1) #0
  \hspace #-1.6
  \with-color #white
  \filled-box #'(0.15 . 0.85) #'(0.15 . 0.85) #0
}

% Strokes, fingers and golpe command :
RHp = \rightHandFinger #1
RHi = \rightHandFinger #2
RHm = \rightHandFinger #3
RHa = \rightHandFinger #4
RHx = \rightHandFinger #5
RHu = \rightHandFinger \strokeUp
RHd = \rightHandFinger \strokeDown
RHg = \rightHandFinger \golpe

stringRight = \set stringNumberOrientations = #'(right)
fingerDown = 	\set fingeringOrientations = #'(down)
fingerUp = 	\set fingeringOrientations = #'(up)
fingerLeft = 	\set fingeringOrientations = #'(left)
fingerRight = 	\set fingeringOrientations = #'(right)

moveFingering = #(define-music-function (parser location shift) (pair?)
#{
	\once \override Fingering #'extra-offset = $shift
#})


moveStrokeFingering = #(define-music-function (parser location shift) (pair?)
#{
	\once \override StrokeFinger #'extra-offset = $shift
#})

% example: \moveStringNumber #'(0 . 1)
moveStringNumber = #(define-music-function (parser location shift) (pair?)
#{
	\once \override StringNumber #'extra-offset = $shift
#})


% Padding text
% \pad \markup{text}
pad = { \once \override TextScript.staff-padding = #2.5 }
padSpanner = { \once \override TextSpanner.staff-padding = #2.5 }

mute = \markup {\musicglyph "pedal.*"}


stringUp = \textSpannerUp
stringDown = \textSpannerDown
stringNeutral = \textSpannerNeutral

startString =
  #(define-event-function (StringNumber) (number?)
    #{
      \tweak style #'solid
      \tweak font-size #-5
      \tweak bound-details.right.attach-dir 1
      \tweak bound-details.left.stencil-align-dir-y #CENTER
      \tweak bound-details.right.padding 0.25
      \tweak bound-details.right-broken.padding 0
      \tweak bound-details.right-broken.text ##f
      \tweak bound-details.left.attach-dir -2
      \tweak bound-details.left.text
        \markup { \circle \number #(number->string StringNumber) }
      \startTextSpan
    #})

stopString = \stopTextSpan


startMinFret = #(define-music-function (fretnum) (number?)
  #{
      \set TabStaff.minimumFret = #fretnum
    #})

stopMinFret = \unset TabStaff.minimumFret