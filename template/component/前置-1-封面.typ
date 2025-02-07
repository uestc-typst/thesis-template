#import "../utils/lib.typ": *
#import "../../tools/lib.typ":*

#let check(info: (:)) = {}

#let 封面(info: (:)) = [
  // for debug
  #set block(stroke: if info.at(info-keys.DEBUG) { red } else { none })

  #set align(center)

  #block(height: 50pt, inset: 0pt)[
    #text(size: font-size.二号)[
      电 子 科 技 大 学
      #linebreak()
    ]
    #text(size: font-size.小四)[
      UNIVERSITY OF ELECTRONIC SCIENCE AND TECHNOLOGY OF CHINA
      #linebreak()
    ]
  ]

  #block(height: 20pt)[#sym.space]

  #block(height: 70pt, inset: 0pt)[
    #text(size: font-size.初号)[ 专业学位硕士学位论文 ]
    #text(size: font-size.三号)[ MASTER THESIS FOR PROFESSIONAL DEGREE ]
  ]

  #block(height: 10pt)[#sym.space]

  #block(height: 160pt, inset: 0pt)[
    #image("../../pics/logo.svg", width: auto)
  ]

  #block(height: 70pt, inset: 0pt)[
    #set text(size: font-size.小二, weight: "bold")
    #set align(center + top)
    #box(height: 100%)[ 论文题目 ]
    #box(height: 100%)[
      #let title = info.at(info-keys.论文中文标题)
      #let after-split = title.split("\n")

      // 如果有换行符
      // 需要换行且每一行都有下划线
      #if after-split.len() > 1 {
        for str in after-split {
          fixed-width-underline(width: 20em, str)
        }
      } else if after-split.len() == 1 {
        fixed-width-underline(width: 20em, after-split.at(0))
      }
    ]
  ]

  #block(height: 20pt)[#sym.space]

  #block(
    height: 180pt,
    inset: 0pt,
  )[
    #set text(size: font-size.三号, weight: "bold")
    #justified-text-with-underline(6em, 16em, "专业学位类型", info.at(info-keys.作者专业学位类型))
    #justified-text-with-underline(6em, 16em, "学号", info.at(info-keys.作者学号))
    #justified-text-with-underline(6em, 16em, "作者姓名", info.at(info-keys.作者中文名))
    #justified-text-with-underline(6em, 16em, "指导老师", info.at(info-keys.指导老师中文名) + "   " + info.at(info-keys.指导老师职称中文))
    #justified-text-with-underline(6em, 16em, "学院", info.at(info-keys.作者学院))
  ]

  #pagebreak(weak: true)
]