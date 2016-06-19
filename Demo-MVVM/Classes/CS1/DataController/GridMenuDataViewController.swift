//
//  GridMenuDataViewController.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/14.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class GridMenuDataViewController: NSObject {

    var models: [GridItem] = []
    func requestGridMenu(finished:(models: [GridItem]?, error: NSError?)->()) {
        
        let icons: [String] = ["im", "notification", "new-house", "triangle", "house-manager", "estate-manager", "sign", "more"]
        let titles: [String] = ["客户咨询", "通知中心", "新房报备", "同步房源", "房源管理", "小区管家", "打卡签到", "更多"]
        for i in 0 ..< 8 {
            let model: GridItem = GridItem()
            model.imageName = "grid-" + icons[i]
            model.title = titles[i]
            self.models.append(model)
        }
        finished(models: self.models, error: nil)
    }
}
