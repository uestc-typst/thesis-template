#import "constant.typ":*

#let footer-罗马数字页码 = context{
  set align(center)
  set text(size: font-size.小五)
  counter(page).display("I")
}
#let footer-阿拉伯数字页码 = context{
  set align(center)
  set text(size: font-size.小五)
  counter(page).display("1")
}

#let header-with-text(s) = context{
  assert(type(s) == str)
  set align(center + bottom)
  set text(size: font-size.五号)
  block(inset: 0pt, height: 90%)[
    #text(s)
  ]
  block(inset: 0pt)[
    #line(length: 100%, stroke: 0.5pt)
  ]

  // 在Typst中默认footnote编号是连续的, 也就是第一页如果有1 2 3, 那么第二页就会从4开始
  // 学校要求每一页单独计数, 所以这里需要手动重置一下footnote编号
  counter(footnote).update(0)
}

#let header-中文摘要 = header-with-text("摘 要")

#let header-英文摘要 = header-with-text("ABSTRACT")

#let header-目录 = header-with-text("目 录")

#let header-正文 = context{
  set align(center + bottom)
  set text(size: font-size.小五)
  block(inset: 0pt, height: 90%)[
    #if calc.even(counter(page).get().first()) {
      "电子科技大学硕士学位论文"
    } else {
      let prev-body = query(selector(heading.where(level: 1))) // 找到所以一级标题
      .filter(it=>it.outlined) // 过滤掉没有大纲的标题(从正文开始计入大纲)
      .filter(it=>{ it.location().page() <= here().page() })

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

  // 在Typst中默认footnote编号是连续的, 也就是第一页如果有1 2 3, 那么第二页就会从4开始
  // 学校要求每一页单独计数, 所以这里需要手动重置一下footnote编号
  counter(footnote).update(0)
}

#let set-global-page(body) = {
  set page(paper: "a4", header: none, footer: none)
  body
}

#let set-中文摘要-page(body) = {
  set page(header: header-中文摘要, footer: footer-罗马数字页码)
  body
}

#let set-英文摘要-page(body) = {
  set page(header: header-英文摘要, footer: footer-罗马数字页码)
  body
}

#let set-目录-page(body) = {
  set page(header: header-目录, footer: footer-罗马数字页码)
  body
}

#let set-正文-page(body) = {
  set page(header: header-正文, footer: footer-阿拉伯数字页码)
  body
}

#let set-致谢-page(body) = set-正文-page(body)
#let set-附录-page(body) = set-正文-page(body)
#let set-参考文献-page(body) = set-正文-page(body)