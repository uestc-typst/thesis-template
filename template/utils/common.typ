#import "info.typ": *
#import "font.typ": *

// 字体 段落 加粗信息等设置
#let common-set(info, body) = {
  set par(first-line-indent: (amount: 2em, all: true), justify: true, leading: 1em, spacing: 1em)
  set text(region: "cn", lang: "zh", font: info.at(info-keys-private.字体).宋体, size: font-size.小四)
  set strong(delta: info.at(info-keys.加粗粗度))
  body
}
