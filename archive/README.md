# 历史资料归档

2026-10-31 从 `D:\Documents\jobhunting` 迁入本仓库：

- `artifacts/lingdong-hiphop/` → 本目录的 `lingdong-hiphop/`。
- `research/flash-android-port-options-2026-10-30.md` → `../docs/research/flash-android-port-options-2026-10-30.md`。

`migration-manifest.json` 记录整个原资料目录迁移前的逐文件大小和 SHA-256，迁移后逐项重新核对；调研笔记也单独核对哈希。原资料目录和原笔记已移出 jobhunting。

## 内容

- 原版与集成版SWF、原站HTML快照、采集清单和校验脚本。
- `analysis-integrated/`：三个角色依赖、原始与去混淆脚本、P-code、图片、SVG、声音、结构清单和静态预览。
- `tools/`：FFDec 26.4.0便携工具及下载归档。
- `ruffle-desktop/`：最初的试玩工程快照；当前可维护版本在仓库根目录。

原有相对结构保留，因此 `analysis-integrated/inspect_swf.py` 等脚本仍可按相对路径定位原文件。原日志和JSON中的历史绝对路径保留，避免改写原始证据。后续分析应在当前仓库中记录新的输出路径。

分析导出日志纳入Git；旧工程的临时 `node_modules` 和运行请求日志保留在本地归档，但按 `.gitignore` 排除，不作为可复现工程的依赖。固定的运行库、SWF和分析工具均有独立归档。
