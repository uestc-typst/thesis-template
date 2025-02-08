#import "../utils/lib.typ": *
#import "../tools/lib.typ": *
#let check(info: (:)) = {}

#let 附录(info: (:)) = [
  #for item in info.at(info-keys.附录) {
    item
  }
]