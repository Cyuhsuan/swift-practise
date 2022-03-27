//
//  ViewController.swift
//  ITIronMan
//
//  Created by 張宇軒 on 2022/3/27.
//

import UIKit

class LoadingViewController: UIViewController {
    
    private lazy var alamofireAdapter: AlamofireAdapter = {
        return AlamofireAdapter()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        requestPlaceholderAPI()
    }
    
    private func requestPlaceholderAPI() {
        
        let urlString = "https://jsonplaceholder.cypress.io/todos/1"
        
        alamofireAdapter.request(urlString, method: .get) { data, response, error in
            
            if let error = error {
                print("you got error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                print("you got data: \(String(describing: String(data: data, encoding: .utf8)))")
            }
        }
    }
}
