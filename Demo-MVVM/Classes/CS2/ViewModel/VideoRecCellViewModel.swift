//
//  VideoRecCellViewModel.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/15.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class VideoRecCellViewModel: NSObject {
    
    var titleText: String = ""
    var urlText: String = ""
    var imageUrl: NSURL?
    class func initVideoRecCellViewModelWithModel(model:Viedo)-> VideoRecCellViewModel {
        let vm = VideoRecCellViewModel()
        vm.titleText = model.title
        vm.urlText = model.detail_url
        vm.imageUrl = NSURL(string: model.cover)
        return vm
    }
}
