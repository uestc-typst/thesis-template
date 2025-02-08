#import "../utils/lib.typ": *

#let 致谢(info: (:)) = [
  #if (info.at(info-keys.匿名)) {
    return
  }
  #if (info.at(info-keys.致谢) == none) {
    return
  }

  #info.at(info-keys.致谢)
]