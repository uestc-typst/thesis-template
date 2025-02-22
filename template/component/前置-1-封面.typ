#import "../utils/lib.typ": *
#import "../tools/lib.typ":*

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

  #let title-chinese = ""
  #let title-english = ""
  #if info.at(info-keys.申请学位级别) == "硕士" {
    if info.at(info-keys.学位类型) == "学术型" {
      title-chinese = "硕士学位论文"
      title-english = " MASTER THESIS "
    } else if info.at(info-keys.学位类型) == "专业型" {
      title-chinese = "专业学位硕士学位论文"
      title-english = " MASTER THESIS FOR PROFESSIONAL DEGREE "
    }
  } else if info.at(info-keys.申请学位级别) == "博士" {
    if info.at(info-keys.学位类型) == "学术型" {
      title-chinese = "博士学位论文"
      title-english = " DOCKTORAL DISSERTATION "
    } else if info.at(info-keys.学位类型) == "专业型" {
      title-chinese = "专业学位博士学位论文"
      title-english = " DOCTORAL DISSERTATION FOR PROFESSIONAL DEGREE "
    }
  }
  #block(height: 70pt, inset: 0pt)[
    #text(size: font-size.初号)[#title-chinese]
    #linebreak()
    #text(size: font-size.三号)[#title-english]
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
    #if info.at(info-keys.学位类型) == "专业型" {
      justified-text-with-underline(4em, 16em, box(width: 6em, scale(x: 66.6%, "专业学位类型")), info.at(info-keys.作者专业学位类别))
    } else if info.at(info-keys.学位类型) == "学术型"{
      justified-text-with-underline(4em, 16em, "学位类型", info.at(info-keys.作者专业学位类别))
    }
    #justified-text-with-underline(4em, 16em, "学号", info.at(info-keys.作者学号))
    #justified-text-with-underline(4em, 16em, "作者姓名", info.at(info-keys.作者中文名))
    #justified-text-with-underline(4em, 16em, "指导老师", info.at(info-keys.指导老师中文名) + "   " + info.at(info-keys.指导老师职称中文))
    #justified-text-with-underline(4em, 16em, "学院", info.at(info-keys.作者学院))
  ]

  #pagebreak(weak: true)
]