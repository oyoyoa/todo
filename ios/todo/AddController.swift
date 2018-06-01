//
//  AddController.swift
//  todo
//
//  Created by y18aim on 2018/05/30.
//  Copyright © 2018年 CATK. All rights reserved.
//

import UIKit
import Alamofire

class AddController: UIViewController {
    @IBOutlet weak var TodoTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("AddController")

        // Do any additional setup after loading the view.
        //let url:String = "http://localhost:3000/tasks.json" //URLを定義
        
    }
    
    @IBAction func TodoAddButton(_ sender: Any) {
        
        // 新しいタスク作るやつ
        let url = "http://localhost:3000/tasks.json"
        let headers: HTTPHeaders = [
            "Contenttype": "application/json"
        ]
        let parameters:[String: Any] = [
            "task": [
                "title": TodoTextField.text!,
                "is_done": false
            ]
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON{ response in
            if let result = response.result.value as? [String: Any] {
                print(result)
            }
        }
        //追加ボタンを押したらフィールドを空にする
        TodoTextField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
