# 普通连击计时阈值试验

2026-10-31。当前仅修改普通攻击段数的周期性清零阈值，不宣称已优化所有连招或特殊技。

## 原始证据

三个角色的 `characters-deobfuscated/{1,2,3}/scripts/frame_1/DoAction.as` 都有同样的根时间轴循环：暂停外每帧调用 `mc.onEnterFrameFunc()`，随后执行 `if (t < 15) t++; else { hitLeave = 0; t = 0; }`。

角色1的 `frame_1/PlaceObject2_72_10/CLIPACTIONRECORD onClipEvent(enterFrame).as` 根据 `hitLeave` 选择攻击1/2/3；其他角色有对应逻辑。游戏是25fps。这个计数器周期性运行，不应将原版描述为“从每次攻击起准确保留600ms”。按源码从t=0推演，清零周期为16次更新；提高阈值至30后为31次更新，约从640ms变为1240ms。暂停与实际运行步进会影响墙钟时间；在周期内开始攻击仍可能遇到较短剩余时间。

方向组合必杀技由各角色内部子时间轴的多个帧动作识别，例如角色1 `DefineSprite_74` 的方向顺序分支。这些窗口与同帧新按下要求均未修改，本版也未加入攻击输入缓存或自动连击。

## 补丁与回退

`npm run patch:combos` 校验原始文件SHA-256，解压CWS并定位唯一的AVM1指令序列：`Push constant51 (t); GetVariable; Push integer15; Less2`。验证它位于根DoAction且包含 `hitLeave` / `onEnterFrame` 上下文后，只把整数15改成30。没有重新编译整个反编译工程。每个角色的未压缩数据恰好改变一个字节，主文件与其他数据保持一致。

原始资源继续位于 `public/game/`，试验资源位于 `public/game/relaxed/`；其主文件是原版的相同字节副本，以保证原游戏相对加载路径正确。`patch-manifest.json` 记录新旧哈希与修改偏移。页面默认选择“普通连击：宽松（试验）”，可切回原版并点击重新启动，切换会丢弃当前战斗进度。

## 验证边界

- 自动检查三个角色的原始哈希、新文件哈希、解压后完整逐字节差异；原版资源HTTP身份测试保持通过。
- 使用FFDec 26.4.0、Corretto17重新导出补丁文件，核对根循环恢复为 `if(t < 30)`。
- 15项自动检查通过。浏览器已请求 `/game/relaxed/a5b.swf` 与 `/game/relaxed/games/data/mhhf_w/3man.swf`，进入第一关并通过攻击按钮推进对话；原版选择与重新启动流程通过。没有量化手机端连招成功率，也不保证方向必杀技更容易触发。

FFDec 来自仓库既有工具 `archive/lingdong-hiphop/tools/ffdec-26.4.0/`。REA没有适合本次AVM1 SWF修改的专用提供器，本次沿用已经导出的脚本、P-code及FFDec，未使用原生二进制解析器猜测SWF行为。
