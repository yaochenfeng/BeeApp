//
//  WebViewController.swift
//  beeApp
//
//  Created by 姚晨峰 on 2019/4/15.
//  Copyright © 2019 jyc99. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: BaseViewController {
    convenience init(_ url: URL?) {
        self.init()
        self.reqURL = url
        if let url = reqURL {
            self.webview.load(URLRequest(url: url))
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview([webview, progressView])
        webview.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self.view)
            make.top.equalTo(self.view).priority(.medium)
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(self.webview)
            make.left.right.equalTo(self.view)
            make.height.equalTo(2)
        }
        self.webview.rx.observe(String.self, "title").subscribe(onNext: {  title in
            self.navigationItem.title = title
        }).disposed(by: disposeBag)
        self.webview.rx.observe(Double.self, "estimatedProgress").subscribe(onNext: { _ in
            self.progressView.alpha = 1
            self.progressView.setProgress(Float(self.webview.estimatedProgress), animated: true)
            if self.webview.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseOut, animations: {
                    self.progressView.alpha = 0
                }, completion: { [weak self] _ in
                    self?.progressView.setProgress(0, animated: true)
                })
            }
        }).disposed(by: disposeBag)
    }
    var reqURL: URL? {
        didSet {
            if let url = reqURL {
                self.webview.load(URLRequest(url: url))
            }
        }
    }
    var webview: WKWebView = {
        let userContent = WKUserContentController()
        let config = WKWebViewConfiguration()
        config.userContentController = userContent
        let web = WKWebView(frame: .zero, configuration: config)
        if #available(iOS 9.0, *) {
            //            web.customUserAgent = Constants.App.useragent
        } else {
            // Fallback on earlier versions
        }
        return web
    }()
    var progressView: UIProgressView = {
        let prossview = UIProgressView(progressViewStyle: .bar)
        prossview.progressTintColor = UIColor(hex: "#6ff3ff")
        return prossview
    }()
}
