#import "assert.typ":*

#let check-and-insert(info, key, value) = {
  assert(is-dict(info), message: "info's type is " + str(type(info)))
  if not (key in info) {
    info.insert(key, value)
  }
  return info
}