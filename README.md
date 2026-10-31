# 灵动嘻哈外传 · 集成版浏览器运行工程

使用 Ruffle 0.7.1 兼容运行原 SWF。保留原游戏逻辑、角色、关卡和动画；本工程提供本地网页播放器、资源服务、缩放、全屏与静音控制。

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

服务仅监听本机回环地址。Ctrl+C 停止服务。直接双击 HTML（file://）不能代替 HTTP 服务。

## 操作

- WASD 移动，J 攻击，K 跳跃，I 暂停/菜单。
- 先点击游戏画面取得键盘焦点；可通过游戏内设置修改按键。
- 重启会重新载入游戏，丢弃当前战斗进度。原游戏 SharedObject 可将部分设置和武器解锁保存到浏览器站点存储。
- 页面的“运行信息”列出元数据与已请求的 SWF 路径。

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
```

## 验证

```powershell
npm test
```

测试会在 18765 端口临时启动独立服务并在完成后停止，不需要停止当前试玩服务；可通过 `TEST_PORT` 覆盖测试端口。

2026-10-31：已在电脑浏览器验证启动、选角、第一关实际战斗、多批敌人、地图卷轴推进、死亡重生与暂停。用户也已自行试玩并反馈正常。尚未记录完整第一关 Boss 击败及过关结算证据；手机触控和手机性能尚未实测。

## 来源与许可范围

游戏原作和素材归原权利人所有，本仓库不将这些内容重新授权为开源游戏。主文件与角色文件来自 MHHF 原站，具体来源见 `assets-manifest.json`。Ruffle 的 MIT/Apache-2.0 许可保留在其发行包目录中；其许可不覆盖原游戏素材。

当前仅创建本地 Git 仓库和本地提交，未设置远程仓库或上传文件。
