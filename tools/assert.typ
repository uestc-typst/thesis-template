
#let is-array(item) = {
  return type(item) == type(("",))
}

#let is-str(item) = {
  return type(item) == type("")
}

#let is-dict(item) = {
  return type(item) == type((:))
}