#let figure-kind-code = "figure-kind-code"
#let figure-kind-pic = "figure-kind-pic"
#let figure-kind-tbl = "figure-kind-tbl"

#let figure-env-set(body) = {
  set block(breakable: true)

  show figure.where(kind: figure-kind-tbl): set figure.caption(position: top)

  // 显示的前后边距
  let figure-body(it) = {
    v(1em) 
    it
    v(1.5em)
  }

  // 每一个图片或者表格 计数器++
  // 图1-1 后变成图1-2
  let count-step(kind) = {
      let chapter-num = counter(heading.where(level: 1)).display()
      counter(kind + str(chapter-num)).step()
  }

  show figure: it => {
    set align(center)
    if it.kind == figure-kind-code {
      figure-body(it)
      count-step(figure-kind-code)
    } else if it.kind == figure-kind-pic {
      figure-body(it)
      count-step(figure-kind-pic)
    } else if it.kind == figure-kind-tbl {
      figure-body(it)
      count-step(figure-kind-tbl)
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

