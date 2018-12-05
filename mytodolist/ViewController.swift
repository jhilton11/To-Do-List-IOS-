//
//  ViewController.swift
//  mytodolist
//
//  Created by APPLE on 12/3/18.
//  Copyright © 2018 appify. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    var taskRef: DatabaseReference!
    var tasks = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.table.rowHeight = 44
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadData() {
        taskRef = Database.database().reference().child("tasks")
        taskRef.observe(DataEventType.value, with: { (snapshot) in
            var temp: [Task] = []
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let task = snap.value as? NSDictionary
                let title = task!["title"] as! String
                let desc = task!["description"] as! String
                let deadline = task!["deadline"] as! String
                let tempTask = Task(title: title, desc: desc, deadline: deadline)
                temp.append(tempTask)
                print("Data loaded")
            }
            self.tasks = temp
            self.table.reloadData()
        })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskCell
        cell.setTaskCell(task: task)
        return cell
    }
    
    
}

