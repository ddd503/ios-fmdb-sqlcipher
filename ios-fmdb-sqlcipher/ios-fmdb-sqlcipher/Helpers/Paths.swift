//
//  Paths.swift
//  ios-fmdb-sqlcipher
//
//  Created by OkuderaYuki on 2018/01/01.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

import Foundation

final class Paths {
    
    static var sqliteDBName: String {
        if BuildChecker.isTesting() {
            return "test.db"
        }
        return "product.db"
    }
    
    static func documents() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
    
    static func sqliteDB() -> String {
        return self.documents().appendingPathComponent(sqliteDBName)
    }
}
