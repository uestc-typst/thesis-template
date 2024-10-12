#let check-and-insert(info, key, value) = {
  assert(type(info) == "dictionary")
  if not (key in info) {
    info.insert(key, value)
  }
  return info
}