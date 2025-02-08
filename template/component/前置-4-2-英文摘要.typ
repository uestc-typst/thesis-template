#import "../utils/lib.typ": *

#let check(info: (:)) = {}

#let 英文摘要(info: (:)) = [
  #let abstruct = info.at(info-keys.英文摘要)
  #let keywords = info.at(info-keys.英文摘要关键字)
  #if abstruct == none or keywords == none {
    return
  }

  #heading("ABSTRACT")
  #abstruct
  #linebreak()
  #if (keywords != none) {
    strong("Keywords: ")
    str(keywords.fold("", (str, item)=> {
      if str == "" {
        str + item
      } else {
        str + "、" + item
      }
    }))
  }

  #pagebreak()
]