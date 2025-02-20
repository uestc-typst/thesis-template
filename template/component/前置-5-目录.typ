#import "../utils/lib.typ": *

#let 目录(info: (:)) = [
  #set align(center)

  #show outline.entry.where(level: 1): it => {
    let prev-body = query(selector(heading.where(level: 1)))
    .filter(h=>h.outlined)
    .filter(h=>{ h.location().page() <= it.element.location().page() })
    .last()

    let num-str = counter(heading).at(prev-body.location()).first()
    let title-with-num = it.body()

    if it.element.numbering != none {
      title-with-num = numbering(it.element.numbering, num-str) + h(0.5em) + it.body()
    }

    box(grid(
      columns: (auto, 1fr, auto),
      link(it.element.location())[
        #text(weight: "bold")[ #title-with-num ]
      ],
      it.fill,
      it.page(),
    ))
  }

  #heading("目 录")
  #outline(title: none, depth: 3, indent: 2em)
  #pagebreak(weak: true)
]