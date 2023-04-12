//
//  ViewController.swift
//  test_scrollview
//
//  Created by Trung Dung Le Tran on 12/04/2023.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView1: AdjustedHeightTableView!
    
    @IBOutlet weak var tableView2: AdjustedHeightTableView!
    
    @IBOutlet weak var view1: UIView!
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView1.delegate = self
        tableView1.dataSource = self
        
        tableView2.delegate = self
        tableView2.dataSource = self
        
        webView = WKWebView(frame: view1.bounds, configuration: WKWebViewConfiguration())
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.navigationDelegate = self
        view1.addSubview(webView)
        
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        
    }


}

extension ViewController: WKNavigationDelegate {
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView2 {
            return 40
        }
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            cell.textLabel?.text = "Hello \(indexPath)"
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hi \(indexPath)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view1.isHidden = true
    }
}

extension ViewController: UIScrollViewDelegate {
    
}
