#import "../utils/lib.typ": *
#let check(info: (:)) = {}

#let 目录(info: (:)) = [

  #set page(header: context{
    set align(center + bottom)
    set text(size: font-size.五号)
    block(inset: 0pt, height: 90%)[
      #text("目 录")
    ]
    block(inset: 0pt)[
      #line(length: 100%, stroke: 0.5pt)
    ]
  })

  #set align(center)

  #outline(title: block()[
    #v(1.5em)
    #text(font: font.黑体, size: font-size.小三, "目 录")
    #v(1em)
  ], depth: 3, indent: 2em)

  #show outline.entry.where(level: 1): it => {
    let prev-body = query(selector(heading.where(level: 1))).filter(h=>h.outlined).filter(h=>{ h.location().page() <= it.element.location().page() })

    let header-info = none

    if prev-body.last().numbering != none {
      header-info = numbering(prev-body.last().numbering, prev-body.len()) + " " + prev-body.last().body
    } else {
      // 附录、致谢、参考文献等没有编号
      header-info = prev-body.last().body
    }

    box(grid(
      columns: (auto, auto, auto),
      link(it.element.location())[#text(weight: "bold")[ #header-info ]],
      it.fill,
      it.page(),
    ))
  }

  #show outline.entry.where(level: 2): it => {
    it
  }

  #show outline.entry.where(level: 3): it => {
    it
  }

  #pagebreak()
]