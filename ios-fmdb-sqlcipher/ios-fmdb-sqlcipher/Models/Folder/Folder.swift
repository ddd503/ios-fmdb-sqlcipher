//
//  Folder.swift
//  ios-fmdb-sqlcipher
//
//  Created by OkuderaYuki on 2018/01/01.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

import FMDB
import Foundation

final class Folder {
    
    var folderId: Int32 = 0
    var title: String?
    var modifyDate: String?
    
    init(title: String?, modifyDate: String?) {
        self.title = title
        self.modifyDate = modifyDate
    }
    
    convenience init(result: FMResultSet) {
        self.init(title: result.string(forColumn: "title"),
                  modifyDate: result.string(forColumn: "modify_date"))
        self.folderId = result.int(forColumn: "folder_id")
    }
}
