//
//  MovieReportViewModel.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/13.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class MovieReportViewModel: NSObject {
    
    var searchBarFrame: CGRect = CGRectZero
    var coverFrame: CGRect = CGRectZero
    var titleFrame: CGRect = CGRectZero
    var tagFrame: CGRect = CGRectZero
    var actFrame: CGRect = CGRectZero
    var yearFrame: CGRect = CGRectZero
    var ratingFrame: CGRect = CGRectZero
    var areaFrame: CGRect = CGRectZero
    var dirFrame: CGRect = CGRectZero
    var descFrame: CGRect = CGRectZero
    var vdo_statusFrame: CGRect = CGRectZero
    var videoRecViewFrame: CGRect = CGRectZero
    var actsViewFrame: CGRect = CGRectZero
    
    var coverImageUrl: NSURL?
    var titleText: String = ""
    var tagText: String = ""
    var actText: String = ""
    var yearText: String = ""
    var ratingText: String = ""
    var areaText: String = ""
    var dirText: String = ""
    var descText: String = ""
    var vdo_statusText: String = ""
    var videoRecVM: VideoRecViewModel = VideoRecViewModel()
    var actsVM: ActsViewModel = ActsViewModel()
    class func initViewModelWithModels(model:Movie!) -> MovieReportViewModel {
        let vm = MovieReportViewModel()
        vm.setDataWithModel(model)
        vm.setFrameWithModel(model)
        return vm
    }
    
    func setFrameWithModel(model:Movie) {
        let w = UIScreen.mainScreen().bounds.width
        let imageW: CGFloat = 135
        let imageH: CGFloat = 180
        let margin: CGFloat = 10
        let labelHeight: CGFloat = 20
        let labelWidth = w - 3 * margin - imageW
        let commomX = 2 * margin + imageW
        let option: NSStringDrawingOptions = NSStringDrawingOptions([.TruncatesLastVisibleLine, .UsesFontLeading, .UsesLineFragmentOrigin])
  
        searchBarFrame = CGRectMake(margin, margin, w - 2 * margin, 35)
        coverFrame = CGRectMake(margin, CGRectGetMaxY(searchBarFrame) + margin, imageW, imageH)
        titleFrame = CGRectMake(commomX, CGRectGetMaxY(searchBarFrame) + margin, labelWidth, labelHeight)
        tagFrame = CGRectMake(commomX, CGRectGetMaxY(titleFrame) + margin / 2, labelWidth, labelHeight)
        let actRect = (model.act as NSString).boundingRectWithSize(CGSizeMake(labelWidth, CGFloat(MAXFLOAT)), options: option, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(14)], context: nil)
        actFrame = CGRectMake(commomX, CGRectGetMaxY(tagFrame) + margin / 2, actRect.width, actRect.height)
        yearFrame = CGRectMake(commomX, CGRectGetMaxY(actFrame) + margin / 2, labelWidth, labelHeight)
        if model.rating == "" {
            ratingFrame = CGRectMake(commomX, CGRectGetMaxY(yearFrame), labelWidth, 0)
        }else{
            ratingFrame = CGRectMake(commomX, CGRectGetMaxY(yearFrame) + margin / 2, labelWidth, labelHeight)
        }
        areaFrame = CGRectMake(commomX, CGRectGetMaxY(ratingFrame) + margin / 2, labelWidth, labelHeight)
        let dirRect = (model.dir as NSString).boundingRectWithSize(CGSizeMake(labelWidth, CGFloat(MAXFLOAT)), options: option, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(14)], context: nil)
        dirFrame = CGRectMake(commomX, CGRectGetMaxY(areaFrame) + margin / 2, dirRect.width, dirRect.height)
        let rect = (model.desc as NSString).boundingRectWithSize(CGSizeMake(w - 2 * margin, CGFloat(MAXFLOAT)), options: option, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(14)], context: nil)
  
        if CGRectGetMaxY(dirFrame) > CGRectGetMaxY(coverFrame) {
            descFrame = CGRectMake(margin, CGRectGetMaxY(dirFrame) + margin, rect.width, rect.height)
        }else {
            descFrame = CGRectMake(margin, CGRectGetMaxY(coverFrame) + margin, rect.width, rect.height)
        }
        actsViewFrame = CGRectMake(margin, CGRectGetMaxY(descFrame) + margin, w - margin, 70 * CGFloat(model.act_s.count))
        videoRecViewFrame = CGRectMake(margin, CGRectGetMaxY(actsViewFrame) + margin, w - margin, 300)
    }
    
    func setDataWithModel(model:Movie) {
        titleText = model.title
        tagText = model.tag
        actText = model.act
        yearText = model.year
        ratingText = model.rating
        areaText = model.area
        dirText = model.dir
        descText = model.desc
        coverImageUrl = NSURL(string: model.cover)
        videoRecVM = VideoRecViewModel.initVideoRecViewModelWithModels(model.video_rec)
        actsVM = ActsViewModel.initActsViewModelWithModels(model.act_s)
    }
}
