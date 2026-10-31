# 《灵动嘻哈外传》移植 Android：方案调研

检索日期：2026-10-30。使用 Codex 内置浏览器核对官方工具文档。本文是路线评估，尚未取得并分析该游戏 SWF，也未运行任何移植原型。工具声明支持某种能力，不等于本游戏已经验证兼容。

## 结论

若目标是摆脱 Flash 执行环境、形成可继续维护和修改的安卓游戏工程，优先比较两条路线：**提取素材与规则，在 Godot 中重写**；或者 **在 OpenFL/Haxe 中迁移显示结构并重构游戏逻辑**。前者更适合重新组织游戏系统；后者值得在发现大量可复用 MovieClip/显示列表结构后做小型试验。以上是工程判断，最终选择取决于 SWF 中的代码版本、时间轴脚本密度和素材可恢复情况。

不存在本轮证据能够支持的“任意 SWF 自动无损转成原生安卓源码”方案。特别是把动画转成 HTML5、把 SWF 导出为 FLA、导入 SWF 素材库，都不等于完成游戏逻辑迁移。

## 路线比较

| 路线 | 可复用内容 | 需要人工处理 | 适用条件与判断 |
|---|---|---|---|
| FFDec 提取 + Godot 重写 | 图像、音频、可导出的动画帧、反编译代码中的规则与数值 | 战斗状态机、碰撞、输入、关卡、存档、时间轴事件、原版手感 | 推荐的长期维护路线；Godot 安卓导出能力已证实，但本游戏复原成本未知 |
| FFDec + OpenFL/Haxe | SWF 显示对象、部分 MovieClip/矢量结构；代码可作为迁移参考 | ActionScript 向 Haxe 的适配，帧脚本和未支持特性的重构 | 值得作为保留 Flash 显示结构的候选；不能直接执行原版全部逻辑 |
| FLA/ActionScript 工程 + HARMAN AIR | 可能保留更多 Flash 工程结构 | 代码版本、编译链、安卓输入/生命周期与性能适配 | 条件路线。本轮 AIR 官方站点连续超时，未完成当前支持矩阵和 AS1/2 限制核验，不能据此承诺本游戏直接发布 |
| Animate HTML5 Canvas + 安卓封装 | 图层、符号、库和部分动画 | ActionScript 逻辑改写为 JavaScript、特性差异和移动适配 | 可成为重新实现的载体，但 Adobe 官方明确说明转换不保留可执行的原 ActionScript |
| FFDec + libGDX 重写 | 通用导出的图像、音频及规则 | 与 Godot 路线相似，游戏系统以 Java 代码重建 | 想继续使用 Java/安卓开发栈时可选；更偏代码组织，仍需重写游戏逻辑 |

## 1. FFDec 是资产和规则恢复工具，不是安卓转换器

[JPEXS 官方 Features](https://github.com/jindrapetrik/jpexs-decompiler/wiki/Features)（页面显示更新于 2026-10-20）确认：

- 支持 AS1/2 和 AS3 SWF；可查看 SWF 头、形状、精灵、脚本、帧及显示深度等结构。
- 可导出 ActionScript、P-code、图像、声音、字体、动画帧等；例如 PNG、MP3/WAV 和部分 SVG 导出。
- 可导出 FLA/XFL，包含多种 Flash 文档版本和时间轴结构。
- 导出独立 ActionScript 项目有明确条件：AS3 内容，且主时间轴没有放置项目。
- 直接编辑 ActionScript 被标记为实验性；通过 Flex SDK 编辑 AS3 也被标记为不稳定。

因此可以恢复可分析、可处理的中间资料，但官方功能表没有承诺恢复原作者完整源码工程。导出后仍需逐项验证动画、脚本与资源关系，尤其不能以“FLA 能打开”作为“游戏能重新发布”的证据。

## 2. OpenFL/Haxe：保留 Flash 显示模型的迁移候选

[OpenFL 官方 Learn](https://www.openfl.org/learn/)说明其支持图形、声音、输入和资源管理，可为移动与桌面编译原生 C++。这支持其作为独立移动游戏工程的候选。

[Using SWF Assets 官方教程](https://www.openfl.org/learn/haxelib/tutorials/using-swf-assets/)说明 SWF 素材可在编译时转换为适用于原生和 HTML5 平台的形式，支持部分 Shapes、SimpleButtons、MovieClips，以及在可行情况下的遮罩、滤镜等。但该教程也明确列出限制：依赖 ActionScript 的帧脚本、TLF、反向运动学不支持；声音、形状补间与新式运动补间也列为不支持。该教程未显示明确更新日期，具体支持程度须以选定版本和实际素材测试为准。

工程推论：如果游戏将攻击判定、音效触发、角色状态切换写在 MovieClip 帧脚本里，导入动画后仍需迁移这些事件。OpenFL 并不是把 SWF 作为完整 Flash 游戏原样执行。此路线优势是保留相近的显示对象概念，而不是免除逻辑重构。

## 3. Animate HTML5 Canvas：官方明确的转换边界

主任务核验的 [Adobe HTML5 Canvas 文档](https://helpx.adobe.com/animate/desktop/interactivity/creating-publishing-html5-canvas-document.html)（页面日期 2026-06-09）在迁移现有内容章节说明：ActionScript 组件会移除，ActionScript 代码会被注释；转换脚本可复制图层、符号和库，但有不支持特性与场景处理限制。

所以这条路线可以帮助迁移视觉内容，却仍需将玩法逻辑改写为 JavaScript。它不能作为“转换一次就能完整玩”的依据。

## 4. Godot 和 libGDX：现代引擎重写

主任务核验的 [Godot 官方安卓导出文档源码](https://github.com/godotengine/godot-docs/blob/master/tutorials/export/exporting_for_android.rst)提供 Android 导出、APK/AAB 和 Gradle 构建资料。这里引用的是导出能力，不把 master 分支对应版本视为稳定发布版。工程判断：通用素材可整理为精灵帧、动画与音频，再在 Godot 中实现游戏系统；没有证据表明 Godot 能直接执行原版 ActionScript。

主任务核验的 [libGDX 官网](https://libgdx.com/)说明其是支持 Android 等平台的 Java 游戏框架，采用 Apache 2.0 许可。工程判断：熟悉 Java 的安卓开发者可以用它重建 2D 游戏，但素材和规则恢复之后，仍需重新实现 ActionScript 逻辑。

## 5. AIR：保留为条件路线

本轮尝试访问 [AIR SDK 文档](https://airsdk.dev/)及 [HARMAN AIR 官网](https://airsdk.harman.com/)，遇到超时，未取得足以引用的当前官方支持矩阵。未确认本游戏 ActionScript 版本，也没有原始 FLA/源码，因此不能断言通过 AIR 重新打包即可运行。下一轮应先确认 SWF 的 AVM/ActionScript 版本，再针对相应版本核对 AIR 编译和加载限制。

## 针对本游戏尚未解决的事实

已知原站有[原版](https://www.mhhf.com/game/detail/208)与[集成版](https://www.mhhf.com/game/detail/210)。历史资讯出现于 2005 年，集成版页面标发布于 2008 年；这些日期不能证明现在提供的 SWF 就是 AS2，必须检查实际文件。

在选技术栈之前，应先得到以下清单：

1. 原版与集成版 SWF 的大小、哈希、SWF 版本、AVM/ActionScript 类型、外部文件依赖。
2. 脚本数量与组织方式：主时间轴、MovieClip 帧脚本、独立类、动态创建对象等。
3. 角色和敌人的动画是否能完整导出，轴心、帧标签、嵌套变换与音效事件能否恢复。
4. 从原版建立第一关行为基准：移动、跳跃、攻击起手/有效/收招帧、受击、击退、连招、暂停、存档。
5. 使用同一角色和一名敌人做 Godot 与 OpenFL 的小型对照，再选主路线。原版可运行环境可作为行为对照，不作为最终安卓架构。

## 推荐的下一步

先做文件与代码清点，再产出一个可审阅的移植规格表，列出必须保留的战斗、装备、隐藏关卡和存档行为。随后完成“角色移动 + 一套攻击 + 一种敌人 + 命中反馈”的纵向切片；达到可对照的行为一致性后再扩展关卡。尚无文件分析和原型实测，因此本报告不提供成功率或工期数字。
