#import "../utils/lib.typ": *

#let abstruct-template(info, title, abstruct, keywords-title, keywords-split-char, keywords) = {
  heading(title)
  abstruct
  v(2em)
  h(-2em)
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
  context{
    if info.at(info-keys.打印) and calc.odd(here().page()) {
      set page(header: none, footer: none, numbering: none)
      pagebreak(to: "odd")
      counter(page).update(n => n - 1)
    }
  }
}

#let 中文摘要(info: (:)) = [
  #let abstruct = info.at(info-keys.中文摘要)
  #let keywords = info.at(info-keys.中文摘要关键字)
  #if abstruct == none or keywords == none {
    return
  }
  #abstruct-template(info, "摘要", abstruct, "关键词：", "，", keywords)
]

#let 英文摘要(info: (:)) = [
  #set text(region: "en", lang: "en")
  #let abstruct = info.at(info-keys.英文摘要)
  #let keywords = info.at(info-keys.英文摘要关键字)
  #if abstruct == none or keywords == none {
    return
  }

  #abstruct-template(info, "ABSTRACT", abstruct, "Keywords: ", ", ", keywords)
]