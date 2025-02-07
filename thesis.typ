#import "template/lib.typ": *
#import "tools/lib.typ":*

#let thesis(info: (:), body) = {
  assert(sys.version >= version(0, 13, 0), message: "本模板支持的最小版本为 0.13.0.")

  let info = info-check(info: info)

  show: show-cn-fakebold.with()
  show: figure-env-set.with()
  show: set-heading-style.with()

  set par(first-line-indent: (amount: 2em, all: true), justify: true, leading: 0.8em, spacing: 0.8em)
  set text(region: "cn", lang: "zh", font: font.宋体, size: font-size.小四)

  封面(info: info)
  中文扉页(info: info)
  英文扉页(info: info)
  独创性声明和论文使用授权(info: info)

  counter(page).update(1)
  set page(footer: roman-numbers-footer)
  中文摘要(info: info)
  英文摘要(info: info)
  目录(info: info)
  图表目录(info: info)
  缩略词表等注释表(info: info)

  counter(page).update(1)
  set page(header: main-body-header, footer: arabic-numerals-footer)
  body

  show: set-heading-style-ending-heading.with()
  致谢(info: info)
  参考文献(info: info)
  附录(info: info)
  攻读学位期间取得成果(info: info)
}
