//
//  PlayLink.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/13.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class PlayLink: NSObject {

    var youku: String = ""
    var qq: String = ""
    var leshi: String = ""
    var pptv: String = ""
    var sohu: String = ""
    
    init(dict: [String: AnyObject])
    {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
