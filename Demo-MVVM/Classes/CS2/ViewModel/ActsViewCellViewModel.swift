//
//  ActsViewCellViewModel.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/15.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class ActsViewCellViewModel: NSObject {

    var nameText: String = ""
    var urlText: String = ""
    var imageUrl: NSURL?
    class func initActsViewCellViewModelWithModel(model:Acts)-> ActsViewCellViewModel{
        let vm = ActsViewCellViewModel()
        vm.nameText = model.name
        vm.urlText = model.url
        vm.imageUrl = NSURL(string: model.image)
        return vm
    }
}
