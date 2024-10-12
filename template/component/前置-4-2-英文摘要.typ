#import "../utils/lib.typ": *
#let check(info: (:)) = {}
#let 英文摘要(info: (:)) = [
  #set page(header: context{
    set align(center + bottom)
    set text(size: font-size.五号)
    block(inset: 0pt, height: 90%)[
      #text("ABSTRACT")
    ]
    block(inset: 0pt)[
      #line(length: 100%, stroke: 0.5pt)
    ]
  })
  #align(center, text(size: font-size.小三, font: font.黑体,weight: "bold", "ABSTRACT"))

  #linebreak()
  #strong("Keywords:")
  #pagebreak()
]