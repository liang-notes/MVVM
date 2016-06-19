//  NetworkTools.swift
//  hhhc
//
//  Created by 王亮 on 16/5/10.
//  Copyright © 2016年 HaoJu. All rights reserved.
//

import UIKit

class NetworkTools: AFHTTPSessionManager {

    static let tools:NetworkTools = {
        
        
        let url = NSURL(string: "")
        let t = NetworkTools(baseURL: url)
        
        t.responseSerializer.acceptableContentTypes = NSSet(objects: "application/json", "text/json", "text/javascript", "text/plain") as! Set<String>
        return t
    }()
    
    class func shareNetworkTools() -> NetworkTools {
        return tools
    }
}
