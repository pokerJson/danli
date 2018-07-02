//
//  DYYManager.swift
//  单例
//
//  Created by dzc on 2018/7/2.
//  Copyright © 2018年 dyy. All rights reserved.
//

import UIKit

class DYYManager: NSObject {

    static let _shareManager = DYYManager()
    class func shareManager()->DYYManager{
        return _shareManager
    }
    
    var str1:String?
    func test(){
        print("xxxxxx")
    }
}
//MARK:扩展了字符串功能
extension String{
    func printSomeThings() {
        print("extension扩展 字符串")
    }
}
