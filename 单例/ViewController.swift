//
//  ViewController.swift
//  单例
//
//  Created by dzc on 2018/7/2.
//  Copyright © 2018年 dyy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //单例
        let manager = DYYManager.shareManager()
        manager.test()
        manager.str1 = "test"
        manager.str1?.printSomeThings()
        
        ///2实例测试下
        let param = ["userid":"10117","token":"oCjXBM8cx-2EiHpu-IYUO-YhV75caTVlr6FL1oGMxO0-VeQ9","sid":"12"]
        DYYNetWork.shareManager().postRequestWith(urlString: "http://www.yzpai.cn/rolegame/gift/userAbility", param: param, success: { (data) in
            let jjj = try!JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
            
            print(jjj)
        }) { (error) in
            print(error)
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

