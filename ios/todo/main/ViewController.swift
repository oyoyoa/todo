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
    var tasks: [Task] = []
    var toDoCells: [TableViewCell] = []
    //cellファイルとの結びを作る
    let ToDoCellName = "ToDocell"
    
    
//    完了ボタン生成
    var unchecked: UIImage = UIImage(named: "checkbox_unchecked (1)")!
    var checked: UIImage = UIImage(named: "checkbox_checked")!
    var flg = false

    override func viewDidLoad() {
        
        print("ViewController")
        super.viewDidLoad()
        
        //cellファイルとの結びを作る４行
        let nib : UINib = UINib(nibName: "cell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ToDoCellName)
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // JSON持ってくるやつ
        Alamofire.request("http://localhost:3000/tasks.json").responseJSON { response in
            guard let data = response.data else { return } //response.valueがnilならこれより下の処理は実行しない
            print(data)
            do {
                self.tasks = try JSONDecoder().decode([Task].self, from: data)
                print(self.tasks) //Success!!!
                self.tableView.reloadData()
            } catch {
                print("json convert failed in JSONDecoder", error.localizedDescription)
            }
            }
        
        print("ViewControllerEnd")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //変数を作る
        let TodoCell = tableView.dequeueReusableCell(withIdentifier: ToDoCellName, for: indexPath) as! TableViewCell
        //変数の中身を作る
        TodoCell.CellofContents.text = tasks[indexPath.row].title
        TodoCell.compliBtn.addTarget(self, action: #selector(ViewController.action), for: .touchUpInside)
        //戻り値の設定（表示する中身)
       
        return TodoCell
    }
    
////   完了ボタンの動き作成
    @objc  func action(_ compliBtn: UIButton){
        
        if flg {
            compliBtn.setImage(unchecked, for: UIControlState())
            flg = false
            print("false")
        } else {
             compliBtn.setImage(checked, for: UIControlState())
            flg = true
            print("true")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

}

