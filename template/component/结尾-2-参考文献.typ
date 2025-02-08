#import "../utils/lib.typ": *
#import "../../tools/lib.typ":*
#let check(info: (:)) = {}

#let 参考文献(info: (:)) = [
  #if info.at(info-keys.参考文献) == none {
    return
  }
  #set pagebreak(weak: true)
  #set text(lang: "en")
  #set heading(supplement: "参考文献")

  #let prefix-path = "../../../"
  #let bibs = info.at(info-keys.参考文献)
  #let path = if type(bibs) == str {
    prefix-path + bibs
  } else if type(bibs) == array {
    bibs = bibs.map((item) => { prefix-path + item })
  }

  #bibliography(bibs, full: true, title: "参考文献")
]