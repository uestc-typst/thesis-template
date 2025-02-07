<div align="center">
<strong>
<samp>

参考例子以及构建开始点：[电子科技大学毕业论文 Typst 例子](https://github.com/qujihan/uestc-typst-thesis-example)

</samp>
</strong>
</div>


# 电子科技大学毕业论文模板
> [!CAUTION]
> 本模板支持的最小 [Typst](https://typst.app/home/) 版本为 `0.13.0`
> 
> 请使用 `cargo install typst-cli@0.13.0-rc1` 按照 Typst.
> 本模板使用了 `0.13.0` 的新功能




# 为什么使用 Typst?
> [!IMPORTANT]  
> 学校文件里并没有说明必须使用 Word/LaTex, 只要格式正确既可.
> 
> **发布学位论文撰写规范的主要目的是统一学位论文的最终呈现形式，对于要求格式的具体实现方式不作要求。同学们亦可根据自身情况，使用其他文字编辑软件，例如LaTeX、WPS等，遵照本规范所作要求，结合本文档示例，撰写学位论文，确保论文格式规范。**

Typst有以下优点：
- 支持**增量**编译, 编译速度快.
- 下载Typst极其依赖只需要**MB**级别的文件, 反观LaTex需要**GB**级别的文件.
- 原生支持Unicode(UTF-8).
- (个人项)Typst是一个有意思且语言, 而LaTeX...

# 参考
> [学校要求](https://gr.uestc.edu.cn/xiazai/114/3917)
> 
> [视觉形象识别系统](https://vi.uestc.edu.cn/)

# TODO
- [x] 基本框架完成
- [ ] 打印模式.
- [ ] 盲审模式.
- [ ] 目录.
    - [ ] 0.13.0 outline breaking change.
    - [ ] 附录在目录中 按照写作顺序 显示为附录A, 附录B, 附录C. (Wait for Typst 0.13.0)
    - [ ] 图表目录.
- [ ] 添加对 info 信息的assert(包含类型以及取值).
- [ ] 添加对 (本 or 专/学-硕 or 专/学-博) 进行封面自动区分.
- [ ] 参考文献优化.
- [ ] 针对中文的第一段进行特殊处理 (Wait for Typst 0.13.0).


# 微信交流群
[欢迎加群讨论](https://github.com/qujihan/uestc-thesis-typst-template/issues/1)