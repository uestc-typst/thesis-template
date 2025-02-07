#import "../utils/lib.typ": *
#let check(info: (:)) = {}
#let 中文摘要(info: (:)) = [
  #set page(header: context{
    set align(center + bottom)
    set text(size: font-size.五号)
    block(inset: 0pt, height: 90%)[
      #text("摘要")
    ]
    block(inset: 0pt)[
      #line(length: 100%, stroke: 0.5pt)
    ]
  })

  #v(1.5em)
  #align(center, text(size: font-size.小三, font: font.黑体, weight: "bold", "摘  要"))
  #v(1em)

  #let abstruct = info.at(info-keys.中文摘要)
  #let keywords = info.at(info-keys.中文摘要关键字)

  #if (abstruct != none) {
    abstruct
  }

  #linebreak()
  #if (keywords != none) {
    strong("关键词：")
    str(keywords.fold("", (str, item)=> {
      if str == "" {
        str + item
      } else {
        str + "、" + item
      }
    }))
  }

  #pagebreak()
]