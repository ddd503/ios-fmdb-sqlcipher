//
//  FolderDao.swift
//  ios-fmdb-sqlcipher
//
//  Created by OkuderaYuki on 2018/01/01.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

import FMDB
import Foundation

final class FolderDao {
    
    @discardableResult static func insert(folder: Folder) -> Bool {
        guard let title = folder.title, let modifyDate = folder.modifyDate else {
            return false
        }
        let insertFolderSql = WriteTranElements(sql: Sql.Folder.insertFolder, arguments: [title, modifyDate])
        return SQLiteHelper.shared.writeTransaction(sqls: [insertFolderSql])
    }
    
    @discardableResult static func update(folder: Folder) -> Bool {
        guard let title = folder.title, let modifyDate = folder.modifyDate else {
            return false
        }
        let updateFolderSql = WriteTranElements(sql: Sql.Folder.updateFolder,
                                                arguments: [title, modifyDate, folder.folderId])
        return SQLiteHelper.shared.writeTransaction(sqls: [updateFolderSql])
    }
    
    static func selectAll() -> [Folder]? {
        var resultArray = [Folder]()
        SQLiteHelper.shared.dbOpen()
        guard let results = SQLiteHelper.shared.fmdb.executeQuery(Sql.Folder.selectAllFolders,
                                                                  withArgumentsIn: []) else {
                                                                    return nil
        }
        while results.next() {
            let folder = Folder(result: results)
            resultArray.append(folder)
        }
        SQLiteHelper.shared.fmdb.close()
        return resultArray
    }
    
    static func selectById(folderId: Int32) -> Folder? {
        SQLiteHelper.shared.dbOpen()
        guard let results = SQLiteHelper.shared.fmdb.executeQuery(Sql.Folder.selectByFolderId,
                                                                  withArgumentsIn: [folderId]) else {
                                                                    return nil
        }
        var folder: Folder?
        while results.next() {
            folder = Folder(result: results)
        }
        SQLiteHelper.shared.fmdb.close()
        return folder
    }
    
    @discardableResult static func deleteAll() -> Bool {
        let deleteAllFoldersSql = WriteTranElements(sql: Sql.Folder.deleteAllFolders, arguments: [])
        let deleteAllTasksSql = WriteTranElements(sql: Sql.Task.deleteAllTasks, arguments: [])
        return SQLiteHelper.shared.writeTransaction(sqls: [deleteAllFoldersSql, deleteAllTasksSql])
    }
    
    @discardableResult static func deleteById(folderId: Int32) -> Bool {
        let deleteByFolderIdSql = WriteTranElements(sql: Sql.Folder.deleteByFolderId, arguments: [folderId])
        let deleteAllTasksFromFolderSql = WriteTranElements(sql: Sql.Task.deleteAllTasksFromFolder,
                                                            arguments: [folderId])
        return SQLiteHelper.shared.writeTransaction(sqls: [deleteByFolderIdSql, deleteAllTasksFromFolderSql])
    }
}
