#import "../utils/lib.typ":*
#import "../../tools/lib.typ":*

#let set-heading-style(body) = {
  set heading(numbering: (..nums) => {
    let n = nums.pos().len()
    if n == 1 {
      numbering("第一章", ..nums)
    } else {
      numbering("1.1.1", ..nums)
    }
  })

  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    set text(size: font-size.小三, font: font.黑体)
    set align(center)
    v(1.5em)
    it
    v(1em)
  }

  show heading.where(level: 2): it => {
    set align(left)
    set text(size: font-size.四号, font: font.黑体)
    it
  }

  show heading.where(level: 3): it => {
    set align(left)
    set text(size: font-size.四号, font: font.黑体)
    it
  }

  show heading.where(level: 4): it => {
    set align(left)
    set text(size: font-size.小四, font: font.黑体)
    it
  }

  body
}

#let set-heading-style-ending-heading(body) = {
  set heading(numbering: none)
  body
}