//
//  VideoRecViewModel.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/15.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class VideoRecViewModel: NSObject {
    
    var videoRecViewModel: [VideoRecCellViewModel] = []
    class func initVideoRecViewModelWithModels(models:[Viedo])-> VideoRecViewModel {
        var arr = [VideoRecCellViewModel]()
        for videoRecCellViewModel in models {
            let videom: VideoRecCellViewModel = VideoRecCellViewModel.initVideoRecCellViewModelWithModel(videoRecCellViewModel)
            arr.append(videom)
        }
        let vm = VideoRecViewModel()
        vm.videoRecViewModel = arr
        return vm
    }
}
