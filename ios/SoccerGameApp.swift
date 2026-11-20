import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []
        
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.scrollView.isScrollEnabled = false
        webView.scrollView.bounces = false
        webView.isOpaque = false
        webView.backgroundColor = .black
        
        // 앱 번들에 포함된 champions-football.html 및 국가/아이콘 리소스 로드
        if let htmlURL = Bundle.main.url(forResource: "champions-football", withExtension: "html") {
            webView.loadFileURL(htmlURL, allowingReadAccessTo: htmlURL.deletingLastPathComponent())
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

@main
struct SoccerGameApp: App {
    var body: some Scene {
        WindowGroup {
            WebView()
                .ignoresSafeArea()
                .statusBarHidden(true)
        }
    }
}
