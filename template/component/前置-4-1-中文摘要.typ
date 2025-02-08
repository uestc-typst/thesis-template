#import "../utils/lib.typ": *

#let check(info: (:)) = {}

#let 中文摘要(info: (:)) = [
  #let abstruct = info.at(info-keys.中文摘要)
  #let keywords = info.at(info-keys.中文摘要关键字)
  #if abstruct == none or keywords == none {
    return
  }

  #heading("摘 要")
  #abstruct
  #linebreak()
  #if (keywords != none) {
    strong("关键词：")
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