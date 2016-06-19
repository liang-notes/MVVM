//
//  WeChatViewDataController.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/13.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class WeChatViewDataController: NSObject {

    var page: Int = 1
    var isDownPullRefresh: Bool = true
    var models: [WeChat] = [WeChat]()
    func requestweChatData(page: Int, finished: (models:[WeChat]?, error:NSError?)->()) {
        let path = "http://api.avatardata.cn/WxNews/Query"
        var str = "北京"
        str = str.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLFragmentAllowedCharacterSet())!
        let params = ["key": "453725eac531499e9de917cef50142a9","page": String(page), "rows": "5",  "keyword": str]
        NetworkTools.shareNetworkTools().GET(path, parameters: params, success: { (_, JSON) ->Void in
            let codeState = JSON["error_code"] as! NSNumber
            if codeState == 0 {
                let models = self.dict2Model(JSON["result"] as! [[String: AnyObject]])
                if self.isDownPullRefresh == true {
                    self.models.removeAll()
                }
                self.models.appendContentsOf(models)
                finished(models: self.models , error: nil)
            }
        }) { (_, error) in
            print(error)
        }
    }
    
    func dict2Model(list: [[String: AnyObject]]) -> [WeChat] {
        var models = [WeChat]()
        for dict in list {
            models.append(WeChat(dict: dict))
        }
        return models
    }
}
