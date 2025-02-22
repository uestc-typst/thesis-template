#import "../utils/lib.typ": *
#import "../tools/lib.typ":*

#let 中文扉页(info: (:)) = [
  // for debug
  #set block(stroke: if info.at(info-keys.DEBUG) { red } else { none })

  #set block(inset: 0pt, outset: 0pt)
  #set grid(inset: 0pt)
  #set grid.cell(inset: 0pt)
  #set align(center)

  #block(height: 40pt, width: 100%)[
    #set text(size: font-size.小四)
    #set align(left)
    #grid(
      columns: (1fr, 1fr),
      rows: (2em, 2em),
      text("分类号") + fixed-width-underline(width: 15em, align(center, info.at(info-keys.分类号))),
      text("密级") + fixed-width-underline(width: 15em, align(center, info.at(info-keys.密级))),
      text()[UDC#super("注1")] + fixed-width-underline(width: 15em, align(center, info.at(info-keys.UDC))),
    )
  ]

  #v(3em)

  #block()[
    #text(size: font-size.小初, weight: "bold")[#fixed-width-text-justified(width: 7em, "学位论文")]
  ]

  #v(3em)

  #block()[
    #text(size: font-size.小二, weight: "bold")[
      // 这里去掉换行符
      #fixed-width-underline(width: auto, info.at(info-keys.论文中文标题).replace("\n", ""))
    ]
    #block()[
      #set text(size: font-size.小四)
      #fixed-width-text(width: 20em, align(center)[（题名和副题名）])
    ]
  ]

  #v(3em)

  #block(height: auto)[
    #block()[
      #set text(size: font-size.三号, weight: "bold")
      #fixed-width-underline(width: 7em, info.at(info-keys.作者中文名))
    ]
    #block()[
      #set text(size: font-size.小四)
      #fixed-width-text(width: 20em, align(center)[（作者姓名）])
    ]
  ]

  #v(3em)

  #block(
    height: 80pt,
  )[
    #block(
      )[
      #grid(
        rows: (1fr, 1fr, 1fr),
        justified-text-with-underline(
          4em,
          20em,
          "指导老师",
          align(center, text(weight: "bold", info.at(info-keys.指导老师中文名) + "   " + info.at(info-keys.指导老师职称中文))),
        ),
        justified-text-with-underline(4em, 20em, "", align(center, text(weight: "bold", info.at(info-keys.指导老师单位)))),
        justified-text-with-underline(
          4em,
          20em,
          "合作导师",
          align(center, text(weight: "bold", info.at(info-keys.合作导师中文名) + "   " + info.at(info-keys.合作导师职称中文))),
        ),
        block()[
          #set text(size: font-size.小四)
          #fixed-width-text-justified(width: 4em, "")
          #fixed-width-text(width: 20em, align(center)[（姓名、职称、单位名称）])
        ],
      )
    ]
  ]

  #v(3em)

  #let 论文提交以及答辩日期行 = grid(
    columns: (1fr, 1fr),
    justified-text-with-underline(6em, 12em, "论文提交时间", align(center, text(weight: "bold", info.at(info-keys.提交日期)))),
    justified-text-with-underline(6em, 12em, "论文答辩日期", align(center, text(weight: "bold", info.at(info-keys.答辩日期)))),
  )

  #let 授予单位与日期行 = justified-text-with-underline(
    9em,
    28em,
    "学位授予单位和日期",
    align(center, text(weight: "bold", info.at(info-keys.学位授予单位) + "   " + info.at(info-keys.学位授予日期))),
  )

  #let 答辩委员会主席行 = justified-text-with-underline(7em, 30em, "答辩委员会主席", align(center, text(weight: "bold", info.at(info-keys.答辩委员会主席))))

  #let 评阅人行 = justified-text-with-underline(
    3em,
    34em,
    "评阅人",
    align(center, text(weight: "bold", info.at(info-keys.答辩委员会成员).fold("", (prev, it) => { prev + it + "   " }))),
  )

  #block(
    height: 150pt,
  )[
    #if info.at(info-keys.学位类型) == "专业型" {
      grid(
        columns: (1fr),
        rows: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        grid(
          inset: 0pt,
          columns: (1fr, 1fr),
          justified-text-with-underline(6em, 12em, "申请学位级别", align(center, text(weight: "bold", info.at(info-keys.申请学位级别)))),
          justified-text-with-underline(6em, 12em, "专业学位类别", align(center, text(weight: "bold", info.at(info-keys.作者专业学位类别)))),
        ),
        justified-text-with-underline(6em, 31em, "专业学位领域", align(center, text(weight: "bold", info.at(info-keys.专业学位领域)))),
        论文提交以及答辩日期行,
        授予单位与日期行,
        答辩委员会主席行,
        评阅人行,
      )
    } else if info.at(info-keys.学位类型) == "学术型" {
      grid(
        columns: (1fr),
        rows: (1fr, 1fr, 1fr, 1fr, 1fr),
        grid(
          inset: 0pt,
          columns: (1fr, 1fr),
          justified-text-with-underline(6em, 12em, "申请学位级别", align(center, text(weight: "bold", info.at(info-keys.申请学位级别)))),
          justified-text-with-underline(4em, 12em, "学科专业", align(center, text(weight: "bold", info.at(info-keys.作者学科专业)))),
        ),
        论文提交以及答辩日期行,
        授予单位与日期行,
        答辩委员会主席行,
        评阅人行,
      )
    }
  ]

  // #block(
  //   height: 150pt,
  // )[
  //   #set align(left)
  //   #grid(
  //     columns: (1fr),
  //     rows: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  //     grid(
  //       inset: 0pt,
  //       columns: (1fr, 1fr),
  //       justified-text-with-underline(6em, 12em, "申请学位级别", align(center, text(weight: "bold", info.at(info-keys.申请学位级别)))),
  //       justified-text-with-underline(6em, 12em, "专业学位类别", align(center, text(weight: "bold", info.at(info-keys.作者专业学位类别)))),
  //     ),
  //     justified-text-with-underline(6em, 31em, "专业学位领域", align(center, text(weight: "bold", info.at(info-keys.专业学位领域)))),
  //     grid(
  //       columns: (1fr, 1fr),
  //       justified-text-with-underline(6em, 12em, "论文提交时间", align(center, text(weight: "bold", info.at(info-keys.提交日期)))),
  //       justified-text-with-underline(6em, 12em, "论文答辩日期", align(center, text(weight: "bold", info.at(info-keys.答辩日期)))),
  //     ),
  //     justified-text-with-underline(
  //       9em,
  //       28em,
  //       "学位授予单位和日期",
  //       align(center, text(weight: "bold", info.at(info-keys.学位授予单位) + "   " + info.at(info-keys.学位授予日期))),
  //     ),
  //     justified-text-with-underline(7em, 30em, "答辩委员会主席", align(center, text(weight: "bold", info.at(info-keys.答辩委员会主席)))),
  //     justified-text-with-underline(
  //       3em,
  //       34em,
  //       "评阅人",
  //       align(center, text(weight: "bold", info.at(info-keys.答辩委员会成员).fold("", (prev, it) => { prev + it + "   " }))),
  //     ),
  //   )
  // ]

  #v(2em)

  #block(width: 100%)[
    #set align(left)
    #text(size: font-size.五号)[注1:注明《国际十进分类法UDC》的类号。]
  ]

  #pagebreak(weak: true)
]