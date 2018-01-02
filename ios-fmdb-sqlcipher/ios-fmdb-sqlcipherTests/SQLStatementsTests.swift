//
//  SQLStatementsTests.swift
//  ios-fmdb-sqlcipherTests
//
//  Created by OkuderaYuki on 2018/01/02.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

@testable import ios_fmdb_sqlcipher
import XCTest

final class SQLStatementsTests: XCTestCase {

    func testTheSQLStatementsInTheFolderTable() {
        XCTAssertEqual(Sql.Folder.createFolderTable,
                       "CREATE TABLE IF NOT EXISTS folder (" +
                        " folder_id INTEGER PRIMARY KEY AUTOINCREMENT," +
                        " title TEXT NOT NULL," +
                        " modify_date TEXT NOT NULL" +
            " )")

        XCTAssertEqual(Sql.Folder.insertFolder,
                       "INSERT INTO folder (" +
                        " title," +
                        " modify_date" +
                        " )" +
            " VALUES(?, ?)")

        XCTAssertEqual(Sql.Folder.updateFolder,
                       "UPDATE folder SET" +
                        " title = ?," +
                        " modify_date = ?" +
            " WHERE folder_id = ?")

        XCTAssertEqual(Sql.Folder.selectAllFolders,
                       "SELECT * FROM folder" +
            " ORDER BY modify_date DESC")
        XCTAssertEqual(Sql.Folder.selectByFolderId,
                       "SELECT * FROM folder" +
            " WHERE folder_id = ?")
        XCTAssertEqual(Sql.Folder.deleteAllFolders,
                       "DELETE FROM folder")
        XCTAssertEqual(Sql.Folder.deleteByFolderId,
                       "DELETE FROM folder" +
            " WHERE folder_id = ?")
    }

    func testTheSQLStatementsInTheTaskTable() {
        XCTAssertEqual(Sql.Task.createTaskTable,
                       "CREATE TABLE IF NOT EXISTS task (" +
                        " task_id INTEGER PRIMARY KEY AUTOINCREMENT," +
                        " folder_id INTEGER NOT NULL," +
                        " title TEXT NOT NULL," +
                        " modify_date TEXT NOT NULL" +
            " )")

        XCTAssertEqual(Sql.Task.insertTask,
                       "INSERT INTO task (" +
                        " folder_id," +
                        " title," +
                        " modify_date" +
                        " )" +
            " VALUES(?, ?, ?)")

        XCTAssertEqual(Sql.Task.updateTask,
                       "UPDATE task SET" +
                        " title = ?," +
                        " modify_date = ?" +
            " WHERE task_id = ?")

        XCTAssertEqual(Sql.Task.selectAllTasksFromFolder,
                       "SELECT * FROM task" +
                        " WHERE folder_id = ?" +
            " ORDER BY modify_date DESC")

        XCTAssertEqual(Sql.Task.selectByTaskId,
                       "SELECT * FROM task" +
            " WHERE task_id = ?")

        XCTAssertEqual(Sql.Task.deleteAllTasks,
                       "DELETE FROM task")

        XCTAssertEqual(Sql.Task.deleteAllTasksFromFolder,
                       "DELETE FROM task" +
            " WHERE folder_id = ?")

        XCTAssertEqual(Sql.Task.deleteByTaskId,
                       "DELETE FROM task" +
            " WHERE task_id = ?")
    }
}
