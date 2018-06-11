//
//  TableViewCell.swift
//  todo
//
//  Created by y18aim on 2018/06/09.
//  Copyright © 2018年 CATK. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var compliBtn: UIButton!
    @IBOutlet weak var CellofContents: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
