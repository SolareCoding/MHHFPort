package pub.solare.mhhf;

import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.Color;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.webkit.ConsoleMessage;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import androidx.webkit.WebViewAssetLoader;
import java.io.ByteArrayInputStream;
import java.util.Arrays;

public final class MainActivity extends Activity {
    private static final String ORIGIN = "appassets.androidplatform.net";
    private WebView web;
    private FrameLayout root;
    private View customView;
    private WebChromeClient.CustomViewCallback customCallback;
    private boolean resumed;
    private AlertDialog exitDialog;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        root = new FrameLayout(this);
        root.setBackgroundColor(Color.rgb(21,23,25));
        setContentView(root);
        web = new WebView(this);
        web.setBackgroundColor(Color.rgb(21,23,25));
        root.addView(web,new FrameLayout.LayoutParams(-1,-1));
        WebSettings settings = web.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setAllowFileAccess(false);
        settings.setAllowContentAccess(false);
        settings.setMediaPlaybackRequiresUserGesture(true);
        settings.setMixedContentMode(WebSettings.MIXED_CONTENT_NEVER_ALLOW);
        settings.setSupportZoom(false);
        web.setOverScrollMode(View.OVER_SCROLL_NEVER);
        web.setHorizontalScrollBarEnabled(false);
        web.setVerticalScrollBarEnabled(false);
        WebView.setWebContentsDebuggingEnabled((getApplicationInfo().flags & 2) != 0);

        WebViewAssetLoader.AssetsPathHandler assets = new WebViewAssetLoader.AssetsPathHandler(this);
        WebViewAssetLoader loader = new WebViewAssetLoader.Builder().addPathHandler("/assets/", path -> {
            WebResourceResponse response = assets.handle(path);
            if (response != null) {
                if (path.endsWith(".wasm")) response.setMimeType("application/wasm");
                if (path.endsWith(".js")) response.setMimeType("application/javascript");
                if (path.endsWith(".swf")) response.setMimeType("application/x-shockwave-flash");
            }
            return response;
        }).build();
        web.setWebViewClient(new WebViewClient() {
            @Override public WebResourceResponse shouldInterceptRequest(WebView view,WebResourceRequest request) {
                if (!local(request.getUrl())) return blocked();
                WebResourceResponse response = loader.shouldInterceptRequest(request.getUrl());
                return response != null ? response : blocked();
            }
            @Override public boolean shouldOverrideUrlLoading(WebView view,WebResourceRequest request) {
                return !local(request.getUrl());
            }
        });
        web.setWebChromeClient(new WebChromeClient() {
            @Override public boolean onConsoleMessage(ConsoleMessage message) {
                if (message.messageLevel() == ConsoleMessage.MessageLevel.ERROR)
                    Log.e("MHHFWeb",message.message()+" @ "+message.lineNumber());
                return true;
            }
            @Override public void onShowCustomView(View view,CustomViewCallback callback) {
                if (customView != null) { callback.onCustomViewHidden(); return; }
                customView=view; customCallback=callback; web.setVisibility(View.GONE);
                root.addView(view,new FrameLayout.LayoutParams(-1,-1)); immersive();
            }
            @Override public void onHideCustomView() { hideCustom(); }
        });
        root.setOnApplyWindowInsetsListener((view,insets) -> {
            if (Build.VERSION.SDK_INT>=28 && insets.getDisplayCutout()!=null) {
                var cutout=insets.getDisplayCutout();
                root.setPadding(cutout.getSafeInsetLeft(),cutout.getSafeInsetTop(),cutout.getSafeInsetRight(),cutout.getSafeInsetBottom());
            }
            return insets;
        });
        web.addOnLayoutChangeListener((view,l,t,r,b,ol,ot,or,ob) -> {
            if (Build.VERSION.SDK_INT>=29) {
                int band=(int)(200*getResources().getDisplayMetrics().density);
                int edge=(int)(32*getResources().getDisplayMetrics().density);
                int width=web.getWidth(),height=web.getHeight(),top=Math.max(0,height-band);
                web.setSystemGestureExclusionRects(Arrays.asList(new Rect(0,top,Math.min(edge,width),height),
                    new Rect(Math.max(0,width-edge),top,width,height)));
            }
        });
        if (Build.VERSION.SDK_INT>=33)
            getOnBackInvokedDispatcher().registerOnBackInvokedCallback(0,this::requestExit);
        immersive();
        web.loadUrl("https://appassets.androidplatform.net/assets/web/index.html");
    }
    private static boolean local(Uri uri) {
        return "https".equals(uri.getScheme()) && ORIGIN.equals(uri.getHost()) && uri.getPath()!=null && uri.getPath().startsWith("/assets/");
    }
    private static WebResourceResponse blocked() {
        return new WebResourceResponse("text/plain","UTF-8",403,"Blocked",java.util.Collections.emptyMap(),new ByteArrayInputStream(new byte[0]));
    }
    private void immersive() {
        if (Build.VERSION.SDK_INT>=30) {
            getWindow().setDecorFitsSystemWindows(false);
            WindowInsetsController controller=getWindow().getInsetsController();
            if(controller!=null){controller.hide(WindowInsets.Type.systemBars());controller.setSystemBarsBehavior(WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE);}
        } else getWindow().getDecorView().setSystemUiVisibility(5894);
    }
    private void hideCustom() {
        if(customView==null)return;
        root.removeView(customView);customView=null;web.setVisibility(View.VISIBLE);
        if(customCallback!=null){customCallback.onCustomViewHidden();customCallback=null;}
        immersive();
    }
    private void pauseGame(boolean pause) {
        if(web==null)return;
        web.evaluateJavascript("(()=>{window.dispatchEvent(new Event('blur'));const p=document.querySelector('ruffle-player');if(p){p.ruffle()."+(pause?"suspend":"play")+"();}})()",null);
    }
    private void requestExit() {
        if(customView!=null){hideCustom();return;}
        if(exitDialog!=null&&exitDialog.isShowing())return;
        pauseGame(true);
        exitDialog=new AlertDialog.Builder(this).setTitle("退出游戏？")
            .setMessage("退出后当前战斗进度不会保留。")
            .setNegativeButton("继续游戏",(dialog,which)->{})
            .setPositiveButton("退出",(dialog,which)->finish()).create();
        exitDialog.setOnDismissListener(dialog->{if(!isFinishing()&&resumed)pauseGame(false);});
        exitDialog.show();
    }
    @Override public void onBackPressed(){requestExit();}
    @Override public void onWindowFocusChanged(boolean focused){super.onWindowFocusChanged(focused);if(focused)immersive();}
    @Override protected void onPause(){resumed=false;pauseGame(true);web.onPause();web.pauseTimers();super.onPause();}
    @Override protected void onResume(){super.onResume();resumed=true;if(web!=null){web.onResume();web.resumeTimers();pauseGame(false);}immersive();}
    @Override protected void onDestroy(){if(web!=null){root.removeView(web);web.destroy();}super.onDestroy();}
}
