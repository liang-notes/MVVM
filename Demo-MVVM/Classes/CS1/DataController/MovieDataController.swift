//
//  MovieDataController.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/13.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class MovieDataController: NSObject {

    var model: Movie?
    func requestSourceData(name: String, finished: (model:Movie?, error:NSError?)->()) {
        let path = "http://api.avatardata.cn/Movie/Query"
        let params = ["key": "8908a35629b54929b9c209bc4f8f2042","name": name]
        
        NetworkTools.shareNetworkTools().GET(path, parameters: params, success: { (_, JSON) ->Void in
            let codeState = JSON["error_code"] as! NSNumber
            self.model = Movie(dict: ["":""])
            if codeState == 0 {
                self.model = self.dict2Model(JSON["result"] as! [String: AnyObject])
            }
            finished(model: self.model, error: nil)
        }) { (_, error) in
            print(error)
        }
    }
    
    func dict2Model(list: [String: AnyObject]) -> Movie {
        let model = Movie(dict: list)
        return model
    }
}
