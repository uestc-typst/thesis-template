#let set-ref(body) = {
  show ref: it => {
    let ele = it.element
    if ele == none {
      it
    } else if ele.func() == math.equation {
      // 如果引用的数学公式
      // 显示数学公式自带的方式
      link(ele.location(), numbering(ele.numbering, ..counter(math.equation).at(ele.location())))
    } else if ele.func() == heading {
      // 如果引用的是标题
      // 显示 1.1.1 节这种格式
      link(ele.location(), numbering("1.1.1节", ..counter(heading).at(ele.location())))
    } else if ele.func() == figure {
      // 图1-1, 表1-1 之类的
      it
    } else {
      it
    }
  }
  body
}