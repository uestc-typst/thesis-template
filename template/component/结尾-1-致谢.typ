#import "../utils/lib.typ": *
#let check(info:(:)) = {
  
}

#let 致谢(info:(:)) = [
  #set heading(supplement: "致谢")
  #info.at(info-keys.致谢)
]