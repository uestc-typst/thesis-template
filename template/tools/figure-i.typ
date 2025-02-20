#let figure-kind-code = "figure-kind-code"
#let figure-kind-pic = "figure-kind-pic"
#let figure-kind-tbl = "figure-kind-tbl"

#let figure-env-set(body) = {
  set block(breakable: true)

  show figure: it => {
    set align(center)
    if it.kind == figure-kind-code {
      v(1em)
      it.body
      it.supplement
      " " + it.counter.display(it.numbering)
      " " + it.caption.body
      v(1.5em)

      let chapter-num = counter(heading.where(level: 1)).display()
      counter(figure-kind-code + str(chapter-num)).step()
    } else if it.kind == figure-kind-pic {
      v(1em)
      it.body
      it.supplement
      " " + it.counter.display(it.numbering)
      " " + it.caption.body
      v(1.5em)

      let chapter-num = counter(heading.where(level: 1)).display()
      counter(figure-kind-pic + str(chapter-num)).step()
    } else if it.kind == figure-kind-tbl {
      v(1em)
      it.body
      it.supplement
      " " + it.counter.display(it.numbering)
      " " + it.caption.body
      v(1.5em)

      let chapter-num = counter(heading.where(level: 1)).display()
      counter(figure-kind-tbl + str(chapter-num)).step()
    } else {
      it.body
    }
  }

  body
}

#let tbl-num(_) = {
  let chapter-num = counter(heading.where(level: 1)).display()
  let type-num = counter(figure-kind-tbl + chapter-num).display()
  numbering("1", counter(heading.where(level: 1)).get().first()) + "-" + str(int(type-num) + 1)
}

#let pic-num(_) = {
  let chapter-num = counter(heading.where(level: 1)).display()
  let type-num = counter(figure-kind-pic + chapter-num).display()
  numbering("1", counter(heading.where(level: 1)).get().first()) + "-" + str(int(type-num) + 1)
}

#let code-num(_) = {
  let chapter-num = counter(heading.where(level: 1)).display()
  let type-num = counter(figure-kind-code + chapter-num).display()
  numbering("1", counter(heading.where(level: 1)).get().first()) + "-" + str(int(type-num) + 1)
}

#let table-figure(caption, table) = {
  figure(table, caption: caption, supplement: [表], numbering: tbl-num, kind: figure-kind-tbl)
}

#let code-figure(caption, code) = {
  figure(code, caption: caption, supplement: [代码], numbering: code-num, kind: figure-kind-code)
}

#let picture-figure(caption, picture) = {
  figure(picture, caption: caption, supplement: [图], numbering: pic-num, kind: figure-kind-pic)
}

