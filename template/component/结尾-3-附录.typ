#import "../utils/lib.typ": *
#import "../../tools/lib.typ": *
#let check(info: (:)) = {}

#let 附录(info: (:)) = [
  #context {
    counter("附录").update(1)
  }

  #set heading(supplement: "附录")

  #show heading.where(level: 1): it => {
    pagebreak(weak: true)
    set text(size: font-size.小三, font: font.黑体)
    set align(center)
    v(1.5em)
    context {
      counter("附录").step()
      let chapter = counter("附录")
      chapter.display("附录A") + fixed-width-space(1em) + it.body
    }
    v(1em)
  }

  #for item in info.at(info-keys.附录) {
    text(item)
  }
]