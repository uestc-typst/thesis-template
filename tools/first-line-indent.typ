// reference: https://github.com/typst/typst/issues/311
// https://github.com/typst/typst/issues/311#issuecomment-2023038611
#let virtual-line(radio) = (context {
  let a = par(box())
  a
  v(radio * measure(2 * a).width)
})

#let set-first-line-indent(width, body) = {
  set par(first-line-indent: width)
  // show heading: it => it + virtual-line(-0.7)
  // show list: it => it + virtual-line(-0.7)
  // show enum: it => it + virtual-line(-0.7)
  // show align: it => it + virtual-line(-0.7)
  body
}