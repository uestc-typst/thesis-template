#import "component/lib.typ": *
#import "utils/lib.typ": *
#import "tools/lib.typ":*

#let thesis(info: (:), body) = {
  assert(sys.version >= version(0, 13, 0), message: "本模板支持的最小版本为 0.13.0, 当前版本为: " + str(sys.version))

  let info = info-check(info: info)

  show: show-cn-fakebold.with()
  show: figure-env-set.with()
  show: set-global-heading.with()
  show: set-footnote.with()
  show: set-ref.with()

  set par(first-line-indent: (amount: 2em, all: true), justify: true, leading: 1em, spacing: 1em)
  set text(region: "cn", lang: "zh", font: font.宋体, size: font-size.小四)

  封面(info: info)
  中文扉页(info: info)
  英文扉页(info: info)
  独创性声明和论文使用授权(info: info)

  // 此时到了摘要页，需要重置页码为 1
  counter(page).update(1)
  show: set-中文摘要-heading.with()
  show: set-中文摘要-page.with()
  中文摘要(info: info)

  show: set-英文摘要-heading.with()
  show: set-英文摘要-page.with()
  英文摘要(info: info)

  show: set-目录-heading.with()
  show: set-目录-page.with()
  目录(info: info)
  图表目录(info: info)
  缩略词表等注释表(info: info)

  // 此时到了正文页，需要重置页码为 1
  counter(page).update(1)
  show:set-正文-heading.with()
  show:set-正文-page.with()
  正文(info: info, body)

  show: set-致谢-heading.with()
  show:set-致谢-page.with()
  致谢(info: info)

  show: set-参考文献-heading.with()
  show: set-参考文献-page.with()
  参考文献(info: info)

  // 附录页, 从附录A开始重新计数
  counter(heading).update(0)
  show: set-附录-heading.with()
  show: set-附录-page.with()
  附录(info: info)

  攻读学位期间取得成果(info: info)
}
