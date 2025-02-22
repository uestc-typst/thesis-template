#import "../tools/lib.typ": *

/*
  有关字体定义
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

// #let font = (宋体: ("Times New Roman", "SimSun"), 黑体: ("Times New Roman", "SimHei"))
#let font = (宋体: ("Times New Roman", "Source Han Serif SC"), 黑体: ("Times New Roman", "Source Han Sans SC"))

/*
  信息常量
*/

/*
  这里是一些默认值

  在模板其他部分使用 info 时, 应该使用 info.at(info-keys.xxx) 的形式访问
  这样可以避免出现未设置的情况以及方便使用 LSP 提示
*/

#let info-keys = (
  DEBUG: "DEBUG",
  // 保密的真会使用这个模板么
  // 没准, 因为完全离线! 更安全嘞
  分类号: "分类号",
  密级: "密级",
  UDC: "UDC",
  // 论文基本信息
  论文中文标题: "论文中文标题",
  论文英文标题: "论文英文标题",
  // 作者信息
  作者中文名: "作者中文名",
  作者英文名: "作者英文名",
  作者学号: "作者学号",
  作者学院: "作者学院",
  作者学院英文: "作者学院英文",
  作者学位类型: "作者学位类型",
  作者学科专业: "作者学科专业", // 学术型填写
  作者学科专业英文: "作者学科专业英文", // 学术型填写
  作者专业学位类别: "作者专业学位类别", // 专业型填写
  作者专业学位类别英文: "作者专业学位类别英文", // 专业型填写
  申请学位级别: "申请学位级别",
  学位类型: "学位类型",
  专业学位领域: "专业学位领域",
  // 学院信息
  学位授予单位: "学位授予单位",
  学位授予日期: "学位授予日期",
  // 指导老师信息
  指导老师中文名: "指导老师中文名",
  指导老师英文名: "指导老师英文名",
  指导老师职称中文: "指导老师职称中文",
  指导老师职称英文: "指导老师职称英文",
  指导老师单位: "指导老师单位",
  合作导师中文名: "合作导师中文名",
  合作导师职称中文: "合作导师职称中文",
  // 日期
  提交日期: "提交日期",
  答辩日期: "答辩日期",
  // 答辩委员相关信息
  答辩委员会主席: "答辩委员会主席",
  答辩委员会成员: "答辩委员会成员",
  答辩委员会成员职称: "答辩委员会成员职称",
  // 一些可选参数
  打印: "打印",
  匿名: "匿名",
  // 章节参数
  附录: "附录",
  致谢: "致谢",
  参考文献: "参考文献",
  中文摘要: "中文摘要",
  中文摘要关键字: "中文摘要关键字",
  英文摘要: "英文摘要",
  英文摘要关键字: "英文摘要关键字",
  攻读学位期间取得成果: "攻读学位期间取得成果",
)

#let info-kv = (
  info-keys.DEBUG: false,
  info-keys.分类号: "TP309.2",
  info-keys.密级: "公开",
  info-keys.UDC: "004.78",
  // 论文基本信息
  info-keys.论文中文标题: "5G移动通信基站天线关键技术及其特征模分析方法研究",
  info-keys.论文英文标题: "Key Technologies and Characteristic Mode Analysis Methods for 5G Base Station Antennas",
  // 作者信息
  info-keys.作者中文名: "某同学",
  info-keys.作者英文名: "Student Xxx",
  info-keys.作者学号: "123456789012",
  info-keys.作者学院: "计算机科学与工程学院 (网络空间安全学院)",
  info-keys.作者学院英文: "School of Computer Science and Engineering(School of Cyberspace Security)",
  info-keys.作者专业学位类别: "计算机技术", // 专业型填写
  info-keys.作者专业学位类别英文: "Computer Science and Technology", // 专业型填写
  info-keys.作者学科专业: "电磁场与微波技术", // 学术型填写
  info-keys.作者学科专业英文: "Electromagnetic Field and Microwave Technology", // 学术型填写
  info-keys.申请学位级别: "硕士",
  info-keys.学位类型: "专业型",
  info-keys.专业学位领域: "通信工程",
  // 学院信息
  info-keys.学位授予单位: "电子科技大学",
  info-keys.学位授予日期: "2025/06/01",
  // 指导老师信息
  info-keys.指导老师中文名: "某老师",
  info-keys.指导老师英文名: "Teacher Xxx",
  info-keys.指导老师职称中文: "教授",
  info-keys.指导老师职称英文: "Prof.",
  info-keys.指导老师单位: "电子科技大学 成都",
  info-keys.合作导师中文名: "某合作老师",
  info-keys.合作导师职称中文: "某职称",
  // 日期
  info-keys.提交日期: "2025/06/01",
  info-keys.答辩日期: "2025/06/02",
  // 答辩委员相关信息
  info-keys.答辩委员会主席: "某主席老师",
  info-keys.答辩委员会成员: ("老师A", "老师B", "老师C", "老师D", "老师E"),
  info-keys.答辩委员会成员职称: "",
  // 一些可选参数
  info-keys.打印: true,
  info-keys.匿名: false,
  // 章节参数
  info-keys.中文摘要: none,
  info-keys.中文摘要关键字: none,
  info-keys.英文摘要: none,
  info-keys.英文摘要关键字: none,
  info-keys.附录: none,
  info-keys.致谢: none,
  info-keys.参考文献: none,
  info-keys.攻读学位期间取得成果: none,
)

#let info-check(info: (:)) = {
  let info = info
  for (key, value) in info-kv.pairs() {
    info = check-and-insert(info, key, value)
  }
  if info.at(info-keys.匿名) {
    info.insert(info-keys.作者中文名, "")
    info.insert(info-keys.作者英文名, "")
    info.insert(info-keys.作者学号, "")
    info.insert(info-keys.作者学院, "")
    info.insert(info-keys.作者学院英文, "")
    info.insert(info-keys.作者专业学位类别, "")
    info.insert(info-keys.作者专业学位类别英文, "")
    info.insert(info-keys.申请学位级别, "")
    info.insert(info-keys.专业学位领域, "")

    info.insert(info-keys.指导老师中文名, "")
    info.insert(info-keys.指导老师英文名, "")
    info.insert(info-keys.指导老师职称中文, "")
    info.insert(info-keys.指导老师职称英文, "")
    info.insert(info-keys.指导老师单位, "")
    info.insert(info-keys.合作导师中文名, "")
    info.insert(info-keys.合作导师职称中文, "")
  }
  return info
}
