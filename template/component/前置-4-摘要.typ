#import "../utils/lib.typ": *

#let abstruct-template(title, abstruct, keywords-title, keywords-split-char, keywords) = {
  heading(title)
  abstruct
  linebreak()
  if (keywords != none) {
    strong(keywords-title)
    str(keywords.fold("", (str, item)=> {
      if str == "" {
        str + item
      } else {
        str + keywords-split-char + item
      }
    }))
  }

  pagebreak()
}

#let 中文摘要(info: (:)) = [
  #let abstruct = info.at(info-keys.中文摘要)
  #let keywords = info.at(info-keys.中文摘要关键字)
  #if abstruct == none or keywords == none {
    return
  }
  #abstruct-template("摘要", abstruct, "关键词：", "，", keywords)
]

#let 英文摘要(info: (:)) = [
  #let abstruct = info.at(info-keys.英文摘要)
  #let keywords = info.at(info-keys.英文摘要关键字)
  #if abstruct == none or keywords == none {
    return
  }
  #abstruct-template("ABSTRACT", abstruct, "Keywords:", ",", keywords)
]