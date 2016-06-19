//
//  ActsViewModel.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/15.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class ActsViewModel: NSObject {

    var vvframe: CGRect = CGRectZero
    var actsViewCellViewModel: [ActsViewCellViewModel] = []
    class func initActsViewModelWithModels(models:[Acts])-> ActsViewModel {
        var arr = [ActsViewCellViewModel]()
        for acts in models {
            let actsViewCellViewModel = ActsViewCellViewModel.initActsViewCellViewModelWithModel(acts)
            arr.append(actsViewCellViewModel)
        }
        let vm = ActsViewModel()
        vm.actsViewCellViewModel = arr
        vm.vvframe = CGRectMake(0, 0, 375, CGFloat(arr.count) * 50)
        return vm
    }
}
