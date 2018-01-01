//
//  String+Path.swift
//  ios-fmdb-sqlcipher
//
//  Created by OkuderaYuki on 2018/01/01.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

import Foundation

extension String {
    
    private var nsString: NSString {
        return self as NSString
    }
    
    func substring(from index: Int) -> String {
        return nsString.substring(from: index)
    }
    
    func substring(to index: Int) -> String {
        return nsString.substring(to: index)
    }
    
    func substring(with range: NSRange) -> String {
        return nsString.substring(with: range)
    }
    
    var lastPathComponent: String {
        return nsString.lastPathComponent
    }
    
    var pathExtension: String {
        return nsString.pathExtension
    }
    
    var deletingLastPathComponent: String {
        return nsString.deletingLastPathComponent
    }
    
    var deletingPathExtension: String {
        return nsString.deletingPathExtension
    }
    
    var pathComponents: [String] {
        return nsString.pathComponents
    }
    
    func appendingPathComponent(_ str: String) -> String {
        return nsString.appendingPathComponent(str)
    }
    
    func appendingPathExtension(_ str: String) -> String? {
        return nsString.appendingPathExtension(str)
    }
}
