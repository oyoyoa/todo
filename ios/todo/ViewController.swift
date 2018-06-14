//
//  ViewController.swift
//  todo
//
//  Created by 飯田拓馬 on 2018/05/17.
//  Copyright © 2018年 CATK. All rights reserved.
//

import UIKit
import Alamofire


struct Task: Codable {
    let id: Int
    let title: String
    let is_done: Bool
    
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var userName:String!
    var userPwd:String!
    
    var tasks: [Task] = []

    override func viewDidLoad() {
        
        print("ViewController")
        print(userName)
        print(userPwd)
        super.viewDidLoad()
        
        // JSON持ってくるやつ
        Alamofire.request("http://localhost:3000/tasks.json").responseJSON { response in
            print(response.value!)
            if let data = response.data {
                do {
                    self.tasks = try JSONDecoder().decode([Task].self, from: data)
                    print(self.tasks) //Success!!!
                    self.tableView.reloadData()
                } catch {
                    print("json convert failed in JSONDecoder", error.localizedDescription)
                }
                
            }
        }
        print("ViewControllerEnd")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        //変数の中身を作る
        TodoCell.textLabel!.text = tasks[indexPath.row].title
        //戻り値の設定（表示する中身)
        return TodoCell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

