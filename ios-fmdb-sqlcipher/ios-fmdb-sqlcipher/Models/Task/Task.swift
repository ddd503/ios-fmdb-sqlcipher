//
//  Task.swift
//  ios-fmdb-sqlcipher
//
//  Created by OkuderaYuki on 2018/01/01.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

import FMDB
import UIKit

final class Task {
    
    var taskId: Int32 = 0
    var folderId: Int32
    var title: String?
    var modifyDate: String?
    
    init(folderId: Int32, title: String?, modifyDate: String?) {
        self.folderId = folderId
        self.title = title
        self.modifyDate = modifyDate
    }
    
    convenience init(result: FMResultSet) {
        self.init(folderId: result.int(forColumn: "folder_id"),
                  title: result.string(forColumn: "title"),
                  modifyDate: result.string(forColumn: "modify_date"))
        self.taskId = result.int(forColumn: "task_id")
    }
}
