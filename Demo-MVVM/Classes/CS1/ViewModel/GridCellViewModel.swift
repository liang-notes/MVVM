//
//  GridCellViewModel.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/14.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class GridCellViewModel: NSObject {

    var title: String = ""
    var image: UIImage = UIImage()
    class func initGridCellViewModelWithModel(model: GridItem)-> GridCellViewModel {
        let vm = GridCellViewModel()
        vm.title = model.title
        vm.image  = UIImage(named: model.imageName)!
        return vm
    }
}
