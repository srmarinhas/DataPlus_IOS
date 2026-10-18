import SwiftUI
import WebKit

@main
struct DataPlusApp: App {
    var body: some Scene {
        WindowGroup { DataPlusWebView().ignoresSafeArea(.container, edges: .bottom) }
    }
}

struct DataPlusWebView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator { Coordinator() }
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.websiteDataStore = .default()
        let view = WKWebView(frame: .zero, configuration: config)
        view.navigationDelegate = context.coordinator
        view.uiDelegate = context.coordinator
        view.allowsBackForwardNavigationGestures = true
        view.load(URLRequest(url: URL(string: "https://oficinaplus.pt/software/data_plus_mobile/login.php")!))
        return view
    }
    func updateUIView(_ view: WKWebView, context: Context) {}
    class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate {
        func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            if navigationAction.targetFrame == nil { webView.load(navigationAction.request) }
            return nil
        }
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            guard let url = navigationAction.request.url else { decisionHandler(.cancel); return }
            if ["http", "https", "about"].contains(url.scheme ?? "") { decisionHandler(.allow) }
            else { if UIApplication.shared.canOpenURL(url) { UIApplication.shared.open(url) }; decisionHandler(.cancel) }
        }
    }
}
