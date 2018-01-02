//
//  SQLEncryptionTests.swift
//  ios-fmdb-sqlcipherTests
//
//  Created by OkuderaYuki on 2018/01/02.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

@testable import ios_fmdb_sqlcipher
import XCTest

final class SQLEncryptionTests: XCTestCase {
    func testEncryptionKey() {
        XCTAssertEqual(Sql.encryptionKey, "nLF8BVG08xsCJBTKNYuvGJ4J2oSRVy4u")
    }
}
