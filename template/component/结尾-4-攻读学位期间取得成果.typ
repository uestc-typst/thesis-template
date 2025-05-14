#import "../consts.typ": *

#let 攻读学位期间取得成果(info: (:)) = [
  #if (info.at(info-keys.攻读学位期间取得成果) == none) {
    return
  }

  #let str = "攻读"
  #if info.at(info-keys.学位类型) == "专业型" {
    str = str + "专业"
  } else if info.at(info-keys.学位类型) == "学术型" {
    str = str + "学术"
  }
  #if info.at(info-keys.申请学位级别) == "硕士" {
    str = str + "硕士"
  } else if info.at(info-keys.申请学位级别) == "博士" {
    str = str + "博士"
  }
  #let str = str + "学位期间取得的成果"

  #set par(first-line-indent: 0em)
  #set enum(numbering: "[1]")

  = #str
  #info.at(info-keys.攻读学位期间取得成果)
]
