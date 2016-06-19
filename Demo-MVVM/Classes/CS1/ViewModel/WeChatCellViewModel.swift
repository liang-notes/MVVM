//
//  WeChatCellViewModel.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/14.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class WeChatCellViewModel: NSObject {

    var title: String = ""
    var url: String = ""
    var imageUrl: NSURL?
    var cellHeight: CGFloat = 0
    var titleFrame: CGRect?
    var imageFrame: CGRect?
    var cutLineFrame: CGRect?
    class func initViewModelWithModel(model: WeChat) -> WeChatCellViewModel {
        let vm = WeChatCellViewModel()
        vm.setupDataWithModel(model)
        vm.setupFrameWithModel(model)
        return vm
    }
    
    private func setupDataWithModel(model: WeChat) {
        self.title = model.title
        self.url = model.url
        self.imageUrl = NSURL(string: model.picUrl)
    }
    
    private func setupFrameWithModel(model: WeChat) {
        let w: CGFloat = UIScreen.mainScreen().bounds.size.width
        let margin: CGFloat = 10
        let imgX: CGFloat = 10
        let imgY: CGFloat = 10
        let imgW: CGFloat = 50
        let imgH: CGFloat = 50
        self.imageFrame = CGRectMake(imgX, imgY, imgW, imgH)
        
        let tX: CGFloat = CGRectGetMaxX(self.imageFrame!) + margin
        let tY: CGFloat = 10
        let tW: CGFloat = w - imgW - imgX - margin
        let options : NSStringDrawingOptions = NSStringDrawingOptions([.UsesLineFragmentOrigin, .UsesFontLeading])
        let tRect = (model.title as NSString).boundingRectWithSize(CGSizeMake(tW, CGFloat(MAXFLOAT)), options: options, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(13)], context: nil)
        self.titleFrame = CGRectMake(tX, tY, tRect.width, tRect.height)
        self.cutLineFrame = CGRectMake(0, CGRectGetMaxY(self.imageFrame!) + margin, w, 1)
        self.cellHeight = CGRectGetMaxY(self.cutLineFrame!)
    }
}
