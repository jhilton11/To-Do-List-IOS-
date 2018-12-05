//
//  TaskCell.swift
//  mytodolist
//
//  Created by APPLE on 12/4/18.
//  Copyright © 2018 appify. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskDescLabel: UILabel!
    @IBOutlet weak var taskImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTaskCell(task: Task) {
        taskTitleLabel.text = task.title
        taskDescLabel.text = task.desc
        taskImage.image = UIImage(named: "download")
    }

}
