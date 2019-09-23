//
//  VkLoginViewController.swift
//  Vkontakte App
//
//  Created by Dmitry Andreyanov on 9/18/19.
//  Copyright © 2019 light. All rights reserved.
//

import UIKit
import WebKit
import Alamofire

class VkLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  
      
        
        //Количество фото
//        Alamofire.request("https://api.vk.com/method/photos.get?count&access_token=4d8a9cb553bc1608fa1145612aa884a7d4977bf61143b44b7857336cfd7361bd85aca2fc19c6f7ea197d9&v=5.101").responseJSON { response in
//
//            print(response.value ?? "")

//        }

//    Alamofire.request("https://api.vk.com/method/friends.get?count&access_token=4d8a9cb553bc1608fa1145612aa884a7d4977bf61143b44b7857336cfd7361bd85aca2fc19c6f7ea197d9&v=5.101").responseJSON { response in
//
//             print(response.value ?? "")
//
//                }


func loadExample() {
    Alamofire.request("https://api.vk.com/method/groups.get?extended=1&access_token=da82571779818a873330e1634444ddeb6784b3d159d5341ea2ef860e276cc5342aad86edb924d87036e04&v=5.101").responseJSON { response in
       
        guard let data = response.value else { return }
        
    
//
                do {
                    let groups = try JSONDecoder().decode([Root].self, from: data as! Data)
                    print(groups)
                } catch {
                    print(error)
                }

            }

//    print(response.value ?? "")
    

    
        
        }
       
        
//
        
        
        
        //
//        URLSession.shared.dataTask(with: "https://api.vk.com/method/groups.get?extended=1&access_token=da82571779818a873330e1634444ddeb6784b3d159d5341ea2ef860e276cc5342aad86edb924d87036e04&v=5.101") { data, response, error in
//
//                             func loadExample() {
//                                let url = URL(string: "https://api.vk.com/method/groups.get?extended=1&access_token=da82571779818a873330e1634444ddeb6784b3d159d5341ea2ef860e276cc5342aad86edb924d87036e04&v=5.101")!
//
////
////
////
//                URLSession.shared.dataTask(with: url) { data, response, error in
//
//                    guard let data = data,
//                        let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) else {
//                            return
//                    }
//                    let array = json as! [Any]
//                    for userJson in array {
//
//                        let id = userJson["id"] as! Int
//                        let is_admin = userJson["is_admin"] as! Int
//                        let is_advertiser = userJson["is_advertiser"] as! Int
//                        let is_closed = userJson["is_closed"] as! Int
//                        let is_member = userJson["is_member"] as! Int
//                        let name = userJson["name"] as! [String: Any]
//                        let photo_100 = userJson["photo_100"] as! URL
//                        let photo_200 = userJson["photo_200"] as! URL
//                        let photo_50 = userJson["photo_50"] as! URL
//                        let screen_name = userJson["screen_name"] as! [String: Any]
//                        let type = userJson["type"] as! String
//                    }
//
//////
////
////
//
//                    } .resume()
//
//
//}

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7139804"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webview.load(request)
    }
    
    @IBOutlet weak var webview: WKWebView!
        {
        didSet{
            webview.navigationDelegate = self
        }
    }
    
}







extension VkLoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        let token = params["access_token"]
        
        print(token ?? "token is empty")
        
        
        decisionHandler(.cancel)
    }
}
