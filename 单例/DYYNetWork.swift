//
//  DYYNetWork.swift
//  单例
//
//  Created by dzc on 2018/7/2.
//  Copyright © 2018年 dyy. All rights reserved.
//
/*
    网络请求工具单例
 */
//MARK:网络请求单例 根据nsurlsession 类似oc的那种方法封装
import UIKit

class DYYNetWork: NSObject {

    //单例  执行一次
    static let _shareManager = DYYNetWork()
    class func shareManager()->DYYNetWork{
        return _shareManager
    }

    //成功 闭包oc中的block
    typealias NetworkSucces = (_ data:NSData) -> ()
    //失败
    typealias NetworkFaile = (_ error:Error) -> ()
    //MARK:GET请求
    func getRequestWith(urlString:String,param:Dictionary<String, String>,success:@escaping NetworkSucces,faile:@escaping NetworkFaile) {
        var urlStr:String!
        if param.isEmpty {
            urlStr = urlString
        }else{
            let paramsArr = NSMutableArray()
            //从字典中取出key可value 拼起来放在数组中
            for (key,value) in param{
                let str = key + "=" + value
                paramsArr.add(str)
            }
            //数组转化为字符串
            let paramStr = paramsArr.componentsJoined(by: "&")
            if urlString.contains("?") {
                urlStr = urlString + paramStr
            }else{
                urlStr = urlString + "?" + paramStr
            }
            print("urlsss===" + urlStr)
        }
        urlStr = urlStr.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed)
        var request = URLRequest(url: URL(string: urlStr)!, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        let dataTask = URLSession.shared.dataTask(with:request,completionHandler: {(data, response, error) -> Void in
            if error == nil {
                success(data! as NSData)
            } else {
                faile(error!)
            }
        }) as URLSessionTask
        //使用resume方法启动任务
        dataTask.resume()
    }
    
    //MARK:POST请求
    func postRequestWith(urlString:String,param:Dictionary<String, String>,success:@escaping NetworkSucces,faile:@escaping NetworkFaile) {
        var urlStr:String!
        var paramStr:String!
        if param.isEmpty {
            urlStr = urlString
        }else{
            let paramsArr = NSMutableArray()
            //从字典中取出key可value 拼起来放在数组中
            for (key,value) in param{
                let str = key + "=" + value
                paramsArr.add(str)
            }
            //数组转化为字符串
            paramStr = paramsArr.componentsJoined(by: "&")
            if urlString.contains("?") {
                urlStr = urlString + paramStr
            }else{
                urlStr = urlString + "?" + paramStr
            }
            print("urlsss===" + urlStr)
        }
        urlStr = urlStr.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed)
        var request = URLRequest(url: URL(string: urlStr)!, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval:20.0)
        request.httpMethod = "POST"
        //判断字符串是不是空
        if !paramStr.isEmpty {
            request.httpBody = paramStr.data(using: String.Encoding.utf8)
        }
        let dataTask = URLSession.shared.dataTask(with:request,completionHandler: {(data, response, error) -> Void in
            if error == nil {
                success(data! as NSData)
            } else {
                faile(error!)
            }
        }) as URLSessionTask
        //使用resume方法启动任务
        dataTask.resume()

    }
}
