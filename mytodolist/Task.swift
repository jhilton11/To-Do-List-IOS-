//
//  Task.swift
//  mytodolist
//
//  Created by APPLE on 12/4/18.
//  Copyright © 2018 appify. All rights reserved.
//

import Foundation
import UIKit

class Task {
    var title: String = ""
    var desc: String = ""
    var deadline: String = ""
    
    init(title: String, desc: String, deadline: String) {
        self.title = title
        self.desc = desc
        self.deadline = deadline
    }
}
