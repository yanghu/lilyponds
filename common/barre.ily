#(define-markup-command (posText layout props fretnum)
  (number?)
  (interpret-markup layout props
    #{
        %% Two options: Roman numeral, or "Pos. x".
        \markup {  #(format #f "~@r" fretnum)}
        % \markup \concat {"Pos." #(number->string fretnum)}
    #}))

#(define-markup-command (fretTextMarkup layout props text)
  (markup?)
  (interpret-markup layout props
    #{
        % \tweak font-size #-1
        \markup \smaller \bold { #text }
        #}))

% Fret position (no span)
% #(define (pos str) \markup \posm str)
pos=#(define-event-function (parser location fretnum) (number?)
         #{^\markup \fretTextMarkup
                 \halign #-0.25 
                 \raise #3
                 \posText #fretnum #})


barrePrefixLetter = \markup {
  %% uncomment/comment these lines for C, C slashed, B or B slashed prefix :
  % \roman C
%   \sans C
  %\combine \roman C \translate #'(0.65 . -0.25) \override #'(thickness . 1.2) \draw-line #'(0 . 1.8)
  \roman B
  %\combine \roman B \translate #'(0.65 . -0.25) \override #'(thickness . 1.2) \draw-line #'(0 . 1.8)
  %%%%%%%%%%%%
  \hspace #0.2
}

#(define-markup-command (barrePrefix layout props string-qty) (integer?)
  (interpret-markup layout props 
    (if (member string-qty (iota 4 2 1))
        #{
           \markup { 
             \override #'(font-family . typewriter)
             \concat {
               \fontsize #-4 {
                   \raise #.5 #(number->string string-qty)
                   \hspace #-.2
                   \raise #.2 "/"
                   \hspace #-.2
                   "6" 
                 }
            %    For partial barre, strike through
               \combine \barrePrefixLetter \translate #'(0.8 . -0.25) \override #'(thickness . 1.2) \draw-line #'(0 . 1.8)
             }
           }
        #}
        #{ \markup\barrePrefixLetter #})))

% Defining the text for barre functions.
#(define-markup-command (barreText layout props fretnum partial)
  (number? number?)
  (interpret-markup layout props
    #{ 
        \markup {
            \concat{
                \barrePrefix #partial
                #(format #f "~@r" fretnum)
                % C.
                % #(number->string fretnum) 
                % \hspace #.2
                % \lower #.3 \fontsize #-2 #(number->string partial) 
                % \hspace #.5
            }
        }  
     #})
)

startSpanLine = 
#(define-event-function (parser location line-style) 
   (symbol?)
    #{
    %   \tweak font-size -1
      \tweak font-shape #'upright
      \tweak style #line-style
      \tweak dash-fraction #0.3
      \tweak dash-period #1 
      \tweak minimum-length #5
      \tweak bound-details.left.stencil-align-dir-y #0.35
      \tweak bound-details.left.padding 0.25
      \tweak bound-details.left.attach-dir -1
      \tweak bound-details.left-broken.text ##f
      \tweak bound-details.left-broken.attach-dir -1
      %% adjust the numeric values to fit your needs:
      \tweak bound-details.left-broken.padding 1.5
      \tweak bound-details.right-broken.padding 0
      \tweak bound-details.right.padding 0.25
      \tweak bound-details.right.attach-dir 2
      \tweak bound-details.right-broken.text ##f
      \tweak bound-details.right.text
        \markup
          \with-dimensions #'(0 . 0) #'(-.3 . 0) 
          \draw-line #'(0 . -1)
      \startTextSpan 
   #})

startPos = 
#(define-event-function (parser location fretnum) (number?)
  #{
      \tweak bound-details.left.text
        \markup 
            \fretTextMarkup { \posText #fretnum }
        % \markup 
        %   \small \bold \concat { \posText #fretnum }
      \startSpanLine dashed-line
      #})

startModernBarre = 
#(define-event-function (parser location fretnum partial) 
   (number? number?)
    #{
      \tweak bound-details.left.text
        \markup 
          \fretTextMarkup { \barreText #fretnum #partial }
        %   \small \bold \concat { \barreText #fretnum #partial }
      \startSpanLine line
   #})


startModernFullBarre = 
#(define-event-function (parser location fretnum) 
   (number?)
    #{\startModernBarre #fretnum #6 #})

stopBarre = \stopTextSpan

stopPos = \stopTextSpan
