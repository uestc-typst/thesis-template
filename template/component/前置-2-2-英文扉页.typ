#import "../utils/lib.typ": *
#import "../tools/lib.typ":*

#let check(info: (:)) = {}

#let 英文扉页(info: (:)) = [
  #set block(stroke: if info.at(info-keys.DEBUG) { red } else { none })
  #set block(inset: 0pt, outset: 0pt)
  #set grid(inset: 0pt)
  #set grid.cell(inset: 0pt)
  #set align(center)

  #v(4em)

  #block()[
    #set align(center)
    #set text(font: font.黑体, size: font-size.小二, weight: "bold")
    #info.at(info-keys.论文英文标题)
  ]

  #v(16em)

  #block()[
    #set align(center)
    #set text(font: font.黑体, size: font-size.小三)
    A Master Thesis Submitted to University of Electronic Science and Technology of China
  ]

  #v(16em)

  #block(
    height: 140pt,
  )[
    #set align(center)
    #grid(
      columns: (1fr),
      rows: (1fr, 1fr, 1fr, 1fr, 1fr),
      fixed-text-with-underline(
        7em,
        28em,
        align(right)[Discipline:],
        align(center, text(weight: "bold", info.at(info-keys.作者专业学位类型英文))),
      ),
      fixed-text-with-underline(7em, 28em, align(right)[Student ID:], align(center, text(weight: "bold", info.at(info-keys.作者学号)))),
      fixed-text-with-underline(7em, 28em, align(right)[Author:], align(center, text(weight: "bold", info.at(info-keys.作者英文名)))),
      fixed-text-with-underline(
        7em,
        28em,
        align(right)[Supervisor:],
        align(center, text(weight: "bold", info.at(info-keys.指导老师英文名) + "  " + info.at(info-keys.指导老师职称英文))),
      ),
      fixed-text-with-underline(7em, 28em, align(right)[School:], align(center, text(weight: "bold", info.at(info-keys.作者学院英文)))),
    )
  ]
  #pagebreak(weak: true)
]