# 灵动嘻哈外传 SWF 文件

采集日期：2026-10-30。文件来自 MHHF 灵动游戏原站运行页公开声明的 `gameUrl`，未执行游戏。

| 版本 | 本地文件 | 原站页面 | 直接下载地址 |
|---|---|---|---|
| 原版 | `lingdong-hiphop-original.swf` | https://www.mhhf.com/game/play/208 | https://www.mhhf.com/files/game/208/25b.swf |
| 集成版 | `lingdong-hiphop-integrated.swf` | https://www.mhhf.com/game/play/210 | https://www.mhhf.com/files/game/210/a5b.swf |

两份文件均为 CWS（zlib 压缩 SWF）。已成功解压，解压后长度与文件头声明一致，顶层标签边界有效并含 End 标签。原版 SWF 7，集成版 SWF 8，二者均为 AVM1 世代，帧率均为 25 fps；具体 AS1/AS2 编写方式尚未反编译确认。

`manifest.json` 保存精确字节数、SHA-256、来源和检查结果；`verify-swf.ps1` 可用 PowerShell 7 重复校验。HTML 文件保存了获取下载地址时的原站页面证据。

当前验证仅覆盖静态容器结构，没有验证全流程通关或离线运行。外部资源依赖仍需在后续脚本分析及运行测试中核对，不能将当前两个 SWF 视为已验证完整的离线游戏包。

## 集成版后续分析

已发现并补齐集成版的三个外部角色文件 `1man.swf`、`2man.swf`、`3man.swf`，保存于 `analysis-integrated/dependencies/`。主文件与角色文件的脚本、图片、音频和SVG形状均已导出；详见 [集成版静态分析](analysis-integrated/README.md) 和 [结构及哈希清单](analysis-integrated/swf-inventory.json)。离线运行和通关仍未验证；原先 `manifest.json` 保留最初下载时的检查记录。
