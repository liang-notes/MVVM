//
//  WeChatViewModel.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/13.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class WeChatViewModel: NSObject {
    
    var weChatCellViewModels: [WeChatCellViewModel] = []
    class func initViewModelWithModels(models:[WeChat]) -> WeChatViewModel {
        var arr = [WeChatCellViewModel]()
        for weChat in models {
            let weChatModel = WeChatCellViewModel.initViewModelWithModel(weChat)
            arr.append(weChatModel)
        }
        let vm = WeChatViewModel()
        vm.weChatCellViewModels = arr
        return vm
    }
}
