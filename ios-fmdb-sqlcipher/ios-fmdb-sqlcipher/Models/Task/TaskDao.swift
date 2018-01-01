//
//  TaskDao.swift
//  ios-fmdb-sqlcipher
//
//  Created by OkuderaYuki on 2018/01/01.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

import FMDB
import Foundation

final class TaskDao {
    
    @discardableResult static func insert(task: Task) -> Bool {
        guard let title = task.title, let modifyDate = task.modifyDate else {
            return false
        }
        let insertTaskSql = WriteTranElements(sql: Sql.insertTask, arguments: [task.folderId, title, modifyDate])
        return SQLiteHelper.shared.writeTransaction(sqls: [insertTaskSql])
    }
    
    @discardableResult static func update(task: Task) -> Bool {
        guard let title = task.title, let modifyDate = task.modifyDate else {
            return false
        }
        let updateTaskSql = WriteTranElements(sql: Sql.updateTask, arguments: [title, modifyDate, task.taskId])
        return SQLiteHelper.shared.writeTransaction(sqls: [updateTaskSql])
    }
    
    static func selectAllFromFolder(folderId: Int32) -> [Task]? {
        var resultArray = [Task]()
        SQLiteHelper.shared.dbOpen()
        guard let results = SQLiteHelper.shared.fmdb.executeQuery(Sql.selectAllTasksFromFolder,
                                                                  withArgumentsIn: [folderId]) else {
                                                                    return nil
        }
        while results.next() {
            let task = Task(result: results)
            resultArray.append(task)
        }
        SQLiteHelper.shared.fmdb.close()
        return resultArray
    }
    
    static func selectById(taskId: Int32) -> Task? {
        SQLiteHelper.shared.dbOpen()
        guard let results = SQLiteHelper.shared.fmdb.executeQuery(Sql.selectByTaskId,
                                                                  withArgumentsIn: [taskId]) else {
                                                                    return nil
        }
        var task: Task?
        while results.next() {
            task = Task(result: results)
        }
        SQLiteHelper.shared.fmdb.close()
        return task
    }
    
    @discardableResult static func deleteAll() -> Bool {
        let deleteAllTasksSql = WriteTranElements(sql: Sql.deleteAllTasks, arguments: [])
        return SQLiteHelper.shared.writeTransaction(sqls: [deleteAllTasksSql])
    }
    
    @discardableResult static func deleteAllFromFolder(folderId: Int32) -> Bool {
        let deleteAllTasksFromFolderSql = WriteTranElements(sql: Sql.deleteAllTasksFromFolder, arguments: [folderId])
        return SQLiteHelper.shared.writeTransaction(sqls: [deleteAllTasksFromFolderSql])
    }
    
    @discardableResult static func deleteById(taskId: Int32) -> Bool {
        let deleteByTaskIdSql = WriteTranElements(sql: Sql.deleteByTaskId, arguments: [taskId])
        return SQLiteHelper.shared.writeTransaction(sqls: [deleteByTaskIdSql])
    }
}
