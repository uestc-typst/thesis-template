// https://csimide.github.io/cuti-docs/zh-CN/
#import "@preview/cuti:0.3.0": show-cn-fakebold
#import "../consts.typ":*

#let get-song-font(info) = {
  return info.at(info-keys-private.字体).宋体
}

#let get-hei-font(info) = {
  return info.at(info-keys-private.字体).黑体
}

#let get-mono-font(info) = {
  return info.at(info-keys-private.字体).等宽
}

#let set-font(info, body) = {
  let song = get-song-font(info)
  let hei = get-hei-font(info)
  if song == default-info.at(info-keys.宋体字体) or hei == default-info.at(info-keys.黑体字体) {
    show: show-cn-fakebold.with()
  }
  body
}