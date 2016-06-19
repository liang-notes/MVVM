//
//  WorkBenchModel.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/12.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class JiXiongModel: NSObject {

    var no: Int = 0
    var yunshi: String = ""
    var hanyi: String = ""
    var shuli: String = ""
    var jianshu: String = ""
    var jiye: String = ""
    var jiating: String = ""
    var jiankang: String = ""
    var xiangjie: String = ""
    
    init(dict: [String: AnyObject])
    {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
