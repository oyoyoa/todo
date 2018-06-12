//
//  LoginViewController.swift
//  todo
//
//  Created by 飯田拓馬 on 2018/06/12.
//  Copyright © 2018年 CATK. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        guard let userName = textField.text, let pw = textField2.text else {
            print("データが揃ってない")
            return
        }
        
        if userName.isEmpty || pw.isEmpty {
            print("データが空")
        } else {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "main") as! ViewController
            vc.userName = userName
            vc.userPwd = pw
            self.present(vc, animated: true, completion: nil)
        }
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
