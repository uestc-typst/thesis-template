#import "constant.typ":*

#let roman-numbers-footer = context {
  set align(center)
  set text(size: font-size.小五)
  counter(page).display("I")
}

#let arabic-numerals-footer = context {
  set align(center)
  set text(size: font-size.小五)
  counter(page).display("1")
}

#let main-body-header = context {
  set align(center + bottom)
  set text(size: font-size.小五)
  block(
    inset: 0pt,
    height: 90%,
  )[
    #if calc.even(counter(page).get().first()) {
      "电子科技大学硕士学位论文"
    } else {
      let prev-body = query(selector(heading.where(level: 1))).filter(it=>it.outlined).filter(it=>{ it.location().page() <= here().page() })
      if prev-body.last().numbering != none {
        numbering(prev-body.last().numbering, prev-body.len()) + " " + prev-body.last().body
      } else {
        prev-body.last().body
      }
    }
  ]
  block(inset: 0pt)[
    #line(length: 100%, stroke: 0.5pt)
  ]
}