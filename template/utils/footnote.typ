#import "constant.typ":*

#let set-footnote(body) = {
  set footnote(numbering: "①")
  set footnote.entry(indent: 0em)
  show footnote.entry:it => {
    set text(size: font-size.小五)
    set par(hanging-indent: 1.5em, first-line-indent: 0em)
    let loc = it.note.location()
    par(numbering(it.note.numbering, ..counter(footnote).at(loc)) + h(0.5em) + it.note.body)
  }
  body
}