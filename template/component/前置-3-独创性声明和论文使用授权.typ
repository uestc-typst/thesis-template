#import "../utils/lib.typ": *
#import "../tools/lib.typ":*

#let 独创性声明和论文使用授权(info: (:)) = [
  // for debug
  #set block(stroke: if info.at(info-keys.DEBUG) { red } else { none })

  #set par(first-line-indent: 2em, justify: true, leading: 1.5em, linebreaks: "optimized", spacing: 2em)
  #set text(size: font-size.四号)

  #block(
    )[
    #block(width: 100%, align(center, text(size: font-size.小二, weight: "bold")[独创性声明]))

    #h(2em)本人声明所呈交的学位论文是本人在导师指导下进行的研究工作及取得的研究成果。据我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得电子科技大学或其它教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。

    #align(
      right,
    )[作者签名：#fixed-width-underline(width: 7em, "") #fixed-width-space(2em) 日期：#fixed-width-space(2em)年#fixed-width-space(2em)月#fixed-width-space(2em)日]
  ]

  #v(2em)
  #block(
    )[
    #block(width: 100%, align(center, text(size: font-size.小二, weight: "bold")[论文使用授权]))
    #h(2em)本学位论文作者完全了解电子科技大学有关保留、使用学位论文的规定，同意学校有权保留并向国家有关部门或机构送交论文的复印件和数字文档，允许论文被查阅。本人授权电子科技大学可以将学位论文的全部或部分内容编入有关数据库进行检索及下载，可以采用影印、扫描等复制手段保存、汇编学位论文。

    （涉密的学位论文须按照国家及学校相关规定管理，在解密后适用于本授权。）

    #align(
      right,
    )[作者签名：#fixed-width-underline(width: 7em, "") #fixed-width-space(2em) 导师签名：#fixed-width-underline(width: 7em, "")]
    #align(right)[日期：#fixed-width-space(2em)年#fixed-width-space(2em)月#fixed-width-space(2em)日]
  ]

  #pagebreak()
]
