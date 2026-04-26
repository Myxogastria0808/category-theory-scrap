#set page(width: auto, height: auto, margin: 5pt)
#import "@preview/commute:0.3.0": arr, commutative-diagram, node

#align(center)[#commutative-diagram(
  node((0, 1), $Y$),
  node((1, 0), $X_1$),
  node((1, 2), $X_2$),
  node((1, 1), $X_1 times X_2$),
  arr($Y$, $X_1 times X_2$, $f$),
  arr($X_1 times X_2$, $X_1$, $pi_1$, label-pos: left),
  arr($X_1 times X_2$, $X_2$, $pi_2$, label-pos: right),
  arr($Y$, $X_1$, $f_1$, label-pos: right),
  arr($Y$, $X_2$, $f_2$, label-pos: left),
)]

