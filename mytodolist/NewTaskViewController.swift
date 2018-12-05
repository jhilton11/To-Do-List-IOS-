//
//  NewTaskViewController.swift
//  
//
//  Created by APPLE on 12/3/18.
//

import UIKit
import Firebase

class NewTaskViewController: UIViewController {
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var descText: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var taskRef: DatabaseReference!
    
    var taskTitle: String!
    var taskName: String!
    var taskDate: String!
    
    var indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        taskRef = Database.database().reference().child("tasks")
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator.center = view.center
        self.view.addSubview(indicator)
        self.view.bringSubview(toFront: indicator)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveNewTask(_ sender: Any) {
        taskTitle = titleText.text
        taskName = descText.text
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        taskDate = dateFormatter.string(from: datePicker.date)
        
        if (checkEntries()) {
            indicator.startAnimating()
            let key = taskRef.childByAutoId().key
            taskRef.child(key!).setValue([
                "id": key,
                "title": taskTitle,
                "description": taskName,
                "deadline": taskDate
            ]) {
                (error:Error?, ref:DatabaseReference) in
                if let error = error {
                    print("Data could not be saved: \(error).")
                    self.indicator.stopAnimating()
                } else {
                    print("Data saved successfully!")
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        
    }
    
    @IBAction func closeWindow(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func checkEntries() -> Bool {
        if (taskTitle == "" || taskName == "" || taskDate == "") {
            print("One or more fields have not been filled")
            return false
        } else {
            return true
        }
    }
    
     func createProgressBar() {
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator.center = view.center
        self.view.addSubview(indicator)
        self.view.bringSubview(toFront: indicator)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
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
