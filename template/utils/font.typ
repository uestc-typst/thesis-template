#import "constant.typ":*

/**
 * 字体相关
*/
#let font-size = (
  初号: 42pt,
  小初: 36pt,
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
  小三: 15pt,
  四号: 14pt,
  中四: 13pt,
  小四: 12pt,
  五号: 10.5pt,
  小五: 9pt,
  六号: 7.5pt,
  小六: 6.5pt,
  七号: 5.5pt,
  小七: 5pt,
)

#let 获取宋体(info) = {
  return info.at(info-keys-private.字体).宋体
}

#let 获取黑体(info) = {
  return info.at(info-keys-private.字体).黑体
}

#let 获取等宽字体(info) = {
  return info.at(info-keys-private.字体).等宽
}