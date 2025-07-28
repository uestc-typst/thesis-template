#import "../consts.typ": *

#let 目录(info: (:)) = [
  #set align(center)

  #show outline.entry.where(level: 1): it => {
    let prev-body = query(selector(heading.where(level: 1)))
      .filter(h => h.outlined)
      .filter(h => { h.location().page() <= it.element.location().page() })
      .last()

    let num-str = counter(heading).at(prev-body.location()).first()
    let title-with-num = it.body()

    if it.element.numbering != none {
      title-with-num = numbering(it.element.numbering, num-str) + h(0.5em) + it.body()
    }

    box(
      grid(
        columns: (auto, 1fr, auto),
        link(it.element.location())[
          #text(weight: "bold", font: info.at(info-keys.黑体字体))[ #title-with-num ]
        ],
        it.fill,
        it.page(),
      ),
    )
  }

  #heading("目 录")
  #outline(title: none, depth: 3, indent: 2em)

  #set page(header: none, footer: none)
  #pagebreak(weak: true)
  #if info.at(info-keys.打印模式) {
    pagebreak(weak: true, to: "odd")
  }
]
