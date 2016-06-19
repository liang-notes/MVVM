//
//  JiXiongDataController.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/16.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class JiXiongDataController: NSObject {

    var jxMessage: JiXiongModel?
    func requestJiXiongData(number: String,finished: (model:JiXiongModel?, error:NSError?)->()) {
        let path = "http://v1.avatardata.cn/JiXiong/LookUp"
        let params = ["key": "e516404537d74f73867bed3212d390d7","keyword": number]
        
        NetworkTools.shareNetworkTools().GET(path, parameters: params, success: { (_, JSON) ->Void in
            let codeState = JSON["error_code"] as! NSNumber
            if codeState == 0 {
                self.jxMessage = self.dict2Model(JSON["result"] as! [String: AnyObject])
            }
            finished(model: self.jxMessage!, error: nil)
        }) { (_, error) in
            print(error)
        }
    }
    
    func dict2Model(list: [String: AnyObject]) -> JiXiongModel {
        let model = JiXiongModel(dict: list)
        return model
    }

}
