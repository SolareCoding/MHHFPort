# Android 离线安装包

`android/` 是横屏 Android WebView 容器，包含当前战斗优化版、原版和 Ruffle。资源通过 AndroidX WebViewAssetLoader 从 APK 内加载；无需电脑服务、GitHub Pages、网络权限或存储权限。最低 Android 8.0，建议使用更新的 Android System WebView。

保留网页触摸按钮和连段；沉浸式横屏，返回键确认退出，切到后台暂停。系统手势排除区域仅在摇杆/按钮所在侧边下部，仍受 Android 系统限制。

## 构建

需要 Node.js 18+、JDK 17、Android SDK Platform 35 和 Build Tools 35。首次 Gradle 构建需要联网下载依赖。PowerShell 中设置当前终端的 `JAVA_HOME` 后运行：

```powershell
./scripts/build-android.ps1
```

SDK 默认位置为 `$env:LOCALAPPDATA/Android/Sdk`，可用 `-SdkPath` 指定。脚本生成 `artifacts/MHHFPort-0.3.0-debug.apk`；网页资源、SDK 路径、构建产物和签名私钥不进入版本控制。

当前 APK 使用 Android 默认调试签名，适合本机安装测试。正式发布时需另行配置长期保存的发布签名。不同电脑生成的调试签名通常不同，升级安装可能需要先卸载旧包。

APK 资源构建时指定 Ruffle 的 WebGL 渲染器，避免默认 wgpu 后端在部分图形环境下超出 shader uniform 上限。已在 Android 15 模拟器关闭 Wi-Fi/移动网络后验证游戏加载、横屏按钮布局和返回退出确认；真机性能和多点触控手感仍需手机测试。暂停返回后若出现中央播放图标，点击即可继续。

包名：`pub.solare.mhhf`。安装命令：`adb install -r artifacts/MHHFPort-0.3.0-debug.apk`。
