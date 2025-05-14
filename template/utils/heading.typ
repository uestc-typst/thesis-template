#import "../tools/lib.typ": *
#import "info.typ": *
#import "font.typ": *

#let supplement-中文摘要 = "中文摘要"
#let supplement-英文摘要 = "英文摘要"
#let supplement-目录 = "目录"
#let supplement-正文 = "正文"
#let supplement-致谢 = "致谢"
#let supplement-附录 = "附录"
#let supplement-参考文献 = "参考文献"
#let supplement-攻读学位期间取得成果 = "攻读学位期间取得成果"

#let set-global-heading(info, body) = {
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    set text(size: font-size.小三, font: get-hei-font(info))
    set align(center)
    v(24pt)
    it
    v(18pt)
  }

  show heading.where(level: 2): it => {
    set align(left)
    set text(size: font-size.四号, font: get-hei-font(info))
    v(18pt)
    it
    v(6pt)
  }

  show heading.where(level: 3): it => {
    set align(left)
    set text(size: font-size.四号, font: get-hei-font(info))
    v(12pt)
    it
    v(6pt)
  }

  show heading.where(level: 4): it => {
    set align(left)
    set text(size: font-size.小四, font: get-hei-font(info))
    v(12pt)
    it
    v(6pt)
  }

  body
}

#let set-中文摘要-heading(body) = {
  set heading(supplement: supplement-中文摘要, numbering: none, outlined: false)
  body
}

#let set-英文摘要-heading(body) = {
  set heading(supplement: supplement-英文摘要, numbering: none, outlined: false)
  body
}

#let set-目录-heading(body) = {
  set heading(supplement: supplement-目录, numbering: none)
  body
}

#let set-正文-heading(body) = {
  set heading(supplement: supplement-正文, outlined: true)
  set heading(
    numbering: (..nums) => {
      let n = nums.pos().len()
      if n == 1 {
        numbering("第一章", ..nums)
      } else {
        numbering("1.1.1", ..nums)
      }
    },
  )
  body
}

#let set-致谢-heading(body) = {
  set heading(supplement: supplement-致谢, numbering: none, outlined: true)
  body
}

#let set-附录-heading(body) = {
  set heading(supplement: supplement-附录, outlined: true)
  set heading(
    numbering: (..nums) => {
      let n = nums.pos().len()
      if n == 1 {
        numbering("附录A", ..nums)
      } else {
        numbering("1.1.1", ..nums)
      }
    },
  )
  body
}

#let set-参考文献-heading(body) = {
  set heading(supplement: supplement-参考文献, numbering: none, outlined: true)
  body
}

#let set-攻读学位期间获取成果-heading(body) = {
  set heading(supplement: supplement-参考文献, numbering: none, outlined: true)
  body
}
