# 灵动嘻哈外传 · 集成版浏览器运行工程

使用 Ruffle 0.7.1 兼容运行原 SWF。保留原游戏逻辑、角色、关卡和动画；本工程提供本地网页播放器、资源服务、缩放、全屏与静音控制。

在线试玩（手机建议横屏）：[https://solarecoding.github.io/MHHFPort/](https://solarecoding.github.io/MHHFPort/)。无需电脑开机或连接同一局域网。

## 启动

需要 Node.js 18 或更高版本，无需安装 npm 依赖。Ruffle 运行库和游戏文件已随仓库保存。

```powershell
cd D:\Codes\lingdong-hiphop-web
npm start
```

访问 http://127.0.0.1:8765/，点击“启动游戏”，跳过原版片头，选择角色并开始。

如果 8765 端口已经被此前试玩服务占用，可以为当前终端指定另一个端口：

```powershell
$env:PORT = '8766'
npm start
```

默认仅监听本机回环地址。Ctrl+C 停止服务。直接双击 HTML（file://）不能代替 HTTP 服务。

### 手机通过局域网访问

电脑和手机连接同一个局域网，在 PowerShell 中启动：

```powershell
$env:HOST = '0.0.0.0'
npm start
```

手机浏览器访问 `http://电脑的局域网IPv4:8765/`，例如本次检查时的 `http://192.168.88.148:8765/`。IP 可能变化，可运行 `ipconfig` 查看当前 Wi-Fi IPv4；不要使用手机自己的 `127.0.0.1` 或 `0.0.0.0`。若端口占用，设置 `$env:PORT = '8766'` 后重试，访问地址也改为 8766。停止已有服务再更换监听地址。

若连接失败，检查 Windows 防火墙对 Node.js 在专用网络的入站访问，以及路由器访客 Wi-Fi/AP 隔离。无需配置公网端口转发。恢复本机监听可在启动前运行 `Remove-Item Env:HOST -ErrorAction SilentlyContinue`。

电脑仅提供静态文件，游戏在手机浏览器的 Ruffle/WASM 中执行，手机性能决定游戏流畅度。已接入本地 NippleJS 1.0.4 触控，手机真机兼容性和性能仍需实测。

## 操作

普通连击支持“宽松（试验）/原版”切换，默认宽松。修改选择后点击“重新启动”应用，会丢失当前战斗进度。宽松版将三名角色的普通攻击段数清零阈值从15帧提高至30帧；方向组合必杀技、同帧按键要求与输入缓存未改，具体证据和限制见 [连击判定说明](docs/combo-window.md)。原始SWF保留不变，可运行 `npm run patch:combos` 重建试验资源。

- WASD 移动，J 攻击，K 跳跃，I 暂停/菜单。
- 先点击游戏画面取得键盘焦点；可通过游戏内设置修改按键。
- 手机建议横屏，左下摇杆八方向移动，右下攻击、其左上跳跃，暂停在工具栏；可以同时移动和攻击/跳跃。菜单直接点击画面。触控按原版默认 WASD/J/K/I 映射，若在游戏内改过键需恢复默认。
- 松手、触摸取消、切后台、改变窗口大小或重新启动时会释放触控按键；短点击至少保持70ms以覆盖原游戏25fps采样。全屏包含游戏与操作区，不支持浏览器全屏时使用页面大屏模式。
- 横屏两侧和底部保留手势留白，摇杆使用指针捕获，滑出圆盘仍接收移动。`touch-action` 与 `overscroll-behavior` 减少页面手势冲突，但不能屏蔽操作系统的返回/主页/退出全屏手势；请从摇杆中心起手，避免从屏幕边缘滑入。
- 重启会重新载入游戏，丢弃当前战斗进度。原游戏 SharedObject 可将部分设置和武器解锁保存到浏览器站点存储。
- 页面的“运行信息”列出元数据与已请求的 SWF 路径。
- 页面底部“触控”显示按键状态，方便排查卡键。运行库与摇杆全部由电脑本地提供，无外部 CDN 依赖。

## 文件布局

```text
public/                 网页界面
  game/a5b.swf           集成版主文件
  game/games/data/mhhf_w/
    1man.swf            Magic Wing
    2man.swf            Asura
    3man.swf            霸王丸
vendor/ruffle-0.7.1/     官方 self-hosted 发行包，包含 WASM 与许可文件
server.mjs              零第三方依赖的本地 HTTP 服务
assets-manifest.json    游戏文件与运行库来源、大小、SHA-256
tests/server.test.mjs   实际 HTTP 资源、MIME 与文件身份检查
docs/porting-notes.md   当前状态与后续移动端适配范围
docs/research/           早期移植方案调研
archive/lingdong-hiphop/ 原始文件、反编译结果、素材、工具与旧试玩工程
archive/migration-manifest.json  从jobhunting迁入时的逐文件哈希清单
```

## GitHub Pages 部署

本项目可部署为纯静态网站，无需在 GitHub 上运行 `server.mjs`。`npm run build` 会生成 `dist/`，只包含网页、游戏与 Ruffle，不包含归档、测试或本地日志；当前构建约63MB。不要手动修改 `dist/`，下次构建会重建该目录。

已配置 `.github/workflows/pages.yml`：提交推送至 `main` 后，运行测试、构建并部署。仓库已公开，Settings → Pages → Build and deployment → Source 已设为 **GitHub Actions**。2026-10-31 首次部署成功，地址为 https://solarecoding.github.io/MHHFPort/ 。后续也可以手动运行 Deploy GitHub Pages 工作流。

HTML 和游戏资源使用相对路径，支持 Pages 项目子目录，同时保持本地局域网入口可用。GitHub Pages 提供静态文件，玩家的手机仍执行游戏；不需要电脑持续开机。

官方说明：https://docs.github.com/en/pages/getting-started-with-github-pages/what-is-github-pages

## 调研和逆向资料

- [移植路线调研](docs/research/flash-android-port-options-2026-10-30.md)
- [原始SWF与采集记录](archive/lingdong-hiphop/README.md)
- [集成版静态分析与导出目录](archive/lingdong-hiphop/analysis-integrated/README.md)
- [归档目录说明](archive/README.md)

日常开发和启动使用仓库根目录的工程。归档保留历史资料原有相对结构；日志中的旧绝对路径属于原始分析证据，不是当前运行依赖。

## 验证

```powershell
npm test
```

测试会在 18765 端口临时启动独立服务并在完成后停止，不需要停止当前试玩服务；可通过 `TEST_PORT` 覆盖测试端口。

2026-10-31：已在电脑浏览器验证启动、选角、第一关实际战斗、多批敌人、地图卷轴推进、死亡重生与暂停。用户也已自行试玩并反馈正常。触控接入后，已在844×390浏览器视口验证摇杆驱动第一关角色移动，以及按键保持/释放逻辑；用户初步反馈可以操作，继续调整了左右下方操作区。尚未记录完整第一关 Boss 击败及过关结算证据；Android/iOS兼容性与性能未完成系统实测。

## 来源与许可范围

游戏原作和素材归原权利人所有，本仓库不将这些内容重新授权为开源游戏。主文件与角色文件来自 MHHF 原站，具体来源见 `assets-manifest.json`。Ruffle 的 MIT/Apache-2.0 许可保留在其发行包目录中；其许可不覆盖原游戏素材。

NippleJS 1.0.4 采用 MIT 许可，发行代码、来源说明和许可证保存在 `public/vendor/nipplejs-1.0.4/`。

远程仓库：https://github.com/SolareCoding/MHHFPort 。
