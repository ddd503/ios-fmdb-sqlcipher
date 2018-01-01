//
//  SQLiteHelper.swift
//  ios-fmdb-sqlcipher
//
//  Created by OkuderaYuki on 2018/01/01.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

import FMDB
import Foundation

struct WriteTranElements {
    var sql: String
    var arguments: [Any]
}

final class SQLiteHelper {
    
    static let shared = SQLiteHelper()
    var fmdb: FMDatabase
    
    private init() {
        fmdb = FMDatabase(path: Paths.sqliteDB())
        fmdb.traceExecution = true

        var result = self.create(sql: Sql.createTaskTable)
        if !result {
            fatalError("taskテーブル生成失敗")
        }
        result = self.create(sql: Sql.createFolderTable)
        if !result {
            fatalError("folderテーブル生成失敗")
        }
    }
    
    private func create(sql: String) -> Bool {
        let sql = WriteTranElements(sql: sql, arguments: [])
        return self.writeTransaction(sqls: [sql])
    }
    
    @discardableResult func dbOpen() -> Bool {
        let result = fmdb.open()
        fmdb.setKey(Sql.encryptionKey)
        return result
    }

    func writeTransaction(sqls: [WriteTranElements]) -> Bool {
        var result = dbOpen()
        result = fmdb.beginTransaction()

        for element in sqls {
            result = fmdb.executeUpdate(element.sql, withArgumentsIn: element.arguments)
            if !result {
                fmdb.rollback()
                fmdb.close()
                return false
            }
        }
        fmdb.commit()
        fmdb.close()
        return true
    }
}
