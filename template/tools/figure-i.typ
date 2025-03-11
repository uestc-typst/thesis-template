#import "../consts.typ":*
#let figure-kind-code = "figure-kind-code"
#let figure-kind-pic = "figure-kind-pic"
#let figure-kind-tbl = "figure-kind-tbl"

#let figure-env-set(body) = {
  set block(breakable: true)

  show figure.where(kind: figure-kind-tbl): set figure.caption(position: top)
  show figure.caption: set text(size: font-size.五号)
  // 利用 box 的自动伸缩来实现
  // 只有一行的时候居中
  // 多行左对齐
  show figure.caption: it => box(box(align(left, it)), width: 80%)

  // 显示的前后边距
  let figure-body(it) = {
    v(1em)
    it
    v(1.5em)
  }

  // figure 计数器自增函数
  // 图1-1 后变成 图1-2
  let count-step(kind) = {
    let chapter-num = counter(heading.where(level: 1)).display()
    counter(kind + str(chapter-num)).step()
  }

  show figure: it => {
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

#let tbl-numering(_) = {
  let chapter-num = counter(heading.where(level: 1)).display()
  let type-num = counter(figure-kind-tbl + chapter-num).display()
  numbering("1", counter(heading.where(level: 1)).get().first()) + "-" + str(int(type-num) + 1)
}

#let pic-numering(_) = {
  let chapter-num = counter(heading.where(level: 1)).display()
  let type-num = counter(figure-kind-pic + chapter-num).display()
  numbering("1", counter(heading.where(level: 1)).get().first()) + "-" + str(int(type-num) + 1)
}

#let code-numering(_) = {
  let chapter-num = counter(heading.where(level: 1)).display()
  let type-num = counter(figure-kind-code + chapter-num).display()
  numbering("1", counter(heading.where(level: 1)).get().first()) + "-" + str(int(type-num) + 1)
}

#let table-figure(caption, table) = {
  figure(table, caption: caption, supplement: [表], numbering: tbl-numering, kind: figure-kind-tbl)
}

#let code-figure(caption, code) = {
  figure(code, caption: caption, supplement: [代码], numbering: code-numering, kind: figure-kind-code)
}

#let picture-figure(caption, picture) = {
  figure(picture, caption: caption, supplement: [图], numbering: pic-numering, kind: figure-kind-pic)
}

