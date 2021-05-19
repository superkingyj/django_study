//
//  ViewController.swift
//  app_test
//
//  Created by 윾진ʕ·ᴥ·ʔ의 요술봉🪄 on 2021/05/19.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var email_field: UITextField!
    @IBOutlet var password_field: UITextField!
    
    @IBAction func login_button(_ sender: Any) {
        let email = email_field.text!
        let password = password_field.text!
        let url = "http://127.0.0.1:8000/users/login"
        var request = URLRequest(url: URL(string:url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let params = ["email":"\(email)", "password":"\(password)"]
        
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])}
            catch {print("http Body Error")
        }
        
        AF.request(request).responseString { (response) in
            switch response.result {
            case .success:
                print("POST 성공")
            case .failure(let error):
                print("🚫 Alamofire Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
        
        
    }
}

