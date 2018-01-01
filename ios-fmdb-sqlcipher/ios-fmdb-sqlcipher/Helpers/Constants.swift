//
//  Constants.swift
//  ios-fmdb-sqlcipher
//
//  Created by OkuderaYuki on 2018/01/01.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

import Foundation

enum Sql {

    /// 暗号化キー
    static let encryptionKey = "nLF8BVG08xsCJBTKNYuvGJ4J2oSRVy4u"

    // MARK: folder

    /// folderテーブル生成
    static let createFolderTable = "CREATE TABLE IF NOT EXISTS folder (" +
        " folder_id INTEGER PRIMARY KEY AUTOINCREMENT," +
        " title TEXT NOT NULL," +
        " modify_date TEXT NOT NULL" +
    " )"
    
    static let insertFolder = "INSERT INTO folder (" +
        " title," +
        " modify_date" +
        " )" +
    " VALUES(?, ?)"
    
    static let updateFolder = "UPDATE folder SET" +
        " title = ?," +
        " modify_date = ?" +
    " WHERE folder_id = ?"
    
    static let selectAllFolders = "SELECT * FROM folder" +
    " ORDER BY modify_date DESC"
    
    static let selectByFolderId = "SELECT * FROM folder" +
    " WHERE folder_id = ?"

    static let deleteAllFolders = "DELETE FROM folder"

    static let deleteByFolderId = "DELETE FROM folder" +
    " WHERE folder_id = ?"

    // MARK: task

    /// taskテーブル生成
    static let createTaskTable = "CREATE TABLE IF NOT EXISTS task (" +
        " task_id INTEGER PRIMARY KEY AUTOINCREMENT," +
        " folder_id INTEGER NOT NULL," +
        " title TEXT NOT NULL," +
        " modify_date TEXT NOT NULL" +
    " )"
    
    static let insertTask = "INSERT INTO task (" +
        " folder_id," +
        " title," +
        " modify_date" +
        " )" +
    " VALUES(?, ?, ?)"
    
    static let updateTask = "UPDATE task SET" +
        " title = ?," +
        " modify_date = ?" +
    " WHERE task_id = ?"
    
    static let selectAllTasksFromFolder = "SELECT * FROM task" +
        " WHERE folder_id = ?" +
    " ORDER BY modify_date DESC"
    
    static let selectByTaskId = "SELECT * FROM task" +
    " WHERE task_id = ?"

    static let deleteAllTasks = "DELETE FROM task"
    
    static let deleteAllTasksFromFolder = "DELETE FROM task" +
    " WHERE folder_id = ?"
    
    static let deleteByTaskId = "DELETE FROM task" +
    " WHERE task_id = ?"
}
