//
//  GridMenuViewModel.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/11.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class GridMenuViewModel: NSObject {

    var cellViewModels: [GridCellViewModel] = []
    class func initViewModelWithModels(models:[GridItem]) -> GridMenuViewModel{
        let arr = NSMutableArray(capacity: models.count)
        for grid in models {
            let gridVm = GridCellViewModel.initGridCellViewModelWithModel(grid)
            arr.addObject(gridVm)
        }
        let vm = GridMenuViewModel()
        vm.cellViewModels = (arr.copy() as? [GridCellViewModel])!
        return vm
    }
}
