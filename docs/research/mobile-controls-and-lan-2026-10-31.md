# 移动触摸控制与局域网运行调研

研究日期：2026-10-31。已检查仓库源码和第一方项目页面；尚未在 Android / iPhone 真机试玩。

## 结论

优先沿用当前 SWF + Ruffle 0.7.1，在页面上增加触摸控制层。左侧固定摇杆映射 W/A/S/D，右侧攻击 J、跳跃 K、暂停 I。摇杆库只解决手指坐标与方向；需要另外实现持续按键、多键同时按下和松键处理。局域网访问可用于手机验证，游戏仍在手机浏览器执行，电脑负责发送文件。

## 已核实开源方案

推荐 [nipplejs 官方仓库](https://github.com/yoannmoinet/nipplejs)：原生 JavaScript 虚拟摇杆，MIT 许可证，页面当前主分支显示版本更新至 1.0.4。提供 static / dynamic / semi 模式、threshold、move（vector / force）、end、plain 双轴方向以及 destroy / reposition 接口。可直接 script 引入，不强制引入前端框架。

本项目可从 static 模式开始：摇杆区域位置固定；用 move 向量做死区和八方向转换，end 释放 W/A/S/D。README 当前示例通过事件对象的 evt.data 取得事件数据，应按选定版本接口实现并固定版本。static 模式“不支持 multitouch”指同一个摇杆区域内创建多个摇杆，不代表不能同时触摸独立攻击按钮。独立按钮仍须自行管理 pointerId 与按下状态。上述 API 均来自[官方 README](https://github.com/yoannmoinet/nipplejs#readme)，许可证见[官方 LICENSE](https://github.com/yoannmoinet/nipplejs/blob/master/LICENSE)。

joystick-controller 候选本轮未完成可信的官方仓库与许可证核验，不作为已验证推荐列出。

## Ruffle 输入桥

本仓库 `vendor/ruffle-0.7.1/ruffle.js` 中 `virtualKeyboardInput()` 本身就对 `this.element` 派发 `new KeyboardEvent`，分别发送 keydown 和 keyup，携带 key 与 bubbles。因此不能一概认定合成键盘事件被 Ruffle 拒绝，也没有证据要求修改 WASM。

建议首先在当前播放器元素上验证 `dispatchEvent(new KeyboardEvent('keydown', {key:'w', code:'KeyW', bubbles:true}))` 与相应 keyup，保持播放器焦点。此代码是待验证的接入方向，不是已验证的公开 sendKey API。Ruffle 内置 virtualKeyboard 是文字输入支持，逐字立即按下再松开，不适合直接替代动作游戏摇杆。官方源码归属见 [Ruffle 播放器目录](https://github.com/ruffle-rs/ruffle/tree/master/web/packages/core/src/internal/player)，本次判断具体依据为仓库自带的 0.7.1 字节，不把 master 视为同版本证明。

按键状态应独立于摇杆 UI：只有从未按下变为按下时发 keydown，从按下变为未按下时发 keyup；不能把每次 move 都当作新按键。方向与 J/K 可以同时保持。pointercancel、失焦、切后台、重新加载、触摸控制关闭时应释放全部键，避免角色持续走动。原版按键在游戏内可以改，触摸映射后续需要与之同步。

## 局域网访问

本项目是 Node 静态文件服务器，默认监听 127.0.0.1；现在支持 HOST 环境变量。PowerShell 在项目目录运行：

```powershell
$env:HOST = '0.0.0.0'
npm start
```

手机连接同一可互通网络，访问 `http://电脑局域网IPv4:8765`。手机的 localhost / 127.0.0.1 指手机自身。网络隔离、Windows 防火墙或端口被其他程序占用可能阻止访问；只需针对实际失败排查。本机以 Wi-Fi IP:18766 请求页面得到 HTTP 200，但这不是手机端测试结果。默认端口和 HOST 行为依据当前 `server.mjs`；用户可另设 PORT。

Ruffle 自带包包含 WebGL / Canvas 等渲染路径，不能把 WebGPU 的 HTTPS 条件当作整个游戏必须 HTTPS 的理由。普通局域网 HTTP 的完整加载、渲染和输入仍需目标手机实测；本轮没有证明所有功能均无需 secure context / 跨源隔离。全屏、横屏锁定和音频启动也应单独验证，不能把它们当作基本页面可访问的前提。

## 最小验证清单

1. 先用合成事件确认 W/A/S/D、J/K、同时移动攻击、长按与松键实际改变游戏状态。
2. 加固定摇杆及独立动作按钮；游戏区域设置合适的触摸手势控制，防止操作引发页面滚动。
3. Android Chrome 与 iOS Safari 各测加载、开始按钮触发声音、第一关、方向加攻击/跳跃、后台恢复、暂停和存档。
4. 横屏布局保持原游戏 4:3 画面比例，触控区域避开系统安全区，记录实际帧率、加载时间和触摸响应后再判断是否需要运行库调整。
