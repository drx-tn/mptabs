package tn.drx.mptabs
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.webkit.WebView
import android.webkit.WebViewClient
import android.webkit.WebChromeClient

class MPTabsActivity : AppCompatActivity() {
	private var mptabsView: WebView? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        mptabsView = WebView(this)
        setContentView(mptabsView)
        mptabsView!!.setWebChromeClient(WebChromeClient())
        mptabsView!!.getSettings().setJavaScriptEnabled(true)
        mptabsView!!.getSettings().setAllowFileAccessFromFileURLs(true)
        mptabsView!!.setWebViewClient(object : WebViewClient() {
            override fun shouldOverrideUrlLoading(view: WebView, url: String): Boolean {
                return false
            }
        })
		if (savedInstanceState == null) {
            mptabsView!!.loadUrl("file:///android_asset/index.html")
		}
    }
    override fun onSaveInstanceState(outState: Bundle?) {
        super.onSaveInstanceState(outState);
        mptabsView!!.saveState(outState);
    }
    override fun onRestoreInstanceState(savedInstanceState: Bundle?) {
        super.onRestoreInstanceState(savedInstanceState);
        mptabsView!!.restoreState(savedInstanceState);
    }
}
