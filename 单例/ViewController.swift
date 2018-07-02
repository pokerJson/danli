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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

