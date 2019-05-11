package tn.drx.mptabs
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.webkit.WebView
import android.webkit.WebViewClient
import android.webkit.WebChromeClient

class MPTabsActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val mptabsView = WebView(this)
        setContentView(mptabsView)
        mptabsView.setWebChromeClient(WebChromeClient())
        mptabsView.getSettings().setJavaScriptEnabled(true)
        mptabsView.getSettings().setAllowFileAccessFromFileURLs(true)
        /*
        mptabsView.settings.javaScriptEnabled = true
        mptabsView.settings.allowFileAccessFromFileURLs = true
        mptabsView.settings.allowUniversalAccessFromFileURLs = true
        mptabsView.settings.builtInZoomControls = true
        mptabsView.webChromeClient = WebChromeClient()
        */ mptabsView.setWebViewClient(object : WebViewClient() {
            override fun shouldOverrideUrlLoading(view: WebView, url: String): Boolean {
                return false// if (url.startsWith("file://")) {
                    // magic
                  //  true
                // } else false
            }
        })
        mptabsView.loadUrl("file:///android_asset/index.html")
    }
}
