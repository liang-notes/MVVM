//
//  CSTableViewController.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/13.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

let w: CGFloat = UIScreen.mainScreen().bounds.width
class CSTableViewController: UIViewController {

    var contentView: UIScrollView?
    var movieReportView: MovieReportView!
    var movieDataController: MovieDataController = MovieDataController()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        requestDataWithParam("美人鱼")
        handleAllCallBackBlock()
    }
    
    private func setupUI() {
        self.contentView = UIScrollView()
        self.contentView!.delegate = self
        view.addSubview(self.contentView!)
        
        self.movieReportView = MovieReportView()
        self.contentView!.addSubview(movieReportView!)

        contentView!.was_Fill(view)
        self.movieReportView.was_AlignInner(type: WAS_AlignType.TopLeft, referView: contentView!, size: CGSizeMake(w, 1200),offset: CGPointMake(0, 0))
        self.movieReportView.was_AlignInner(type: WAS_AlignType.BottomRight, referView: contentView!, size: nil)
    }
    
    private func requestDataWithParam(movieName: String?) {
        if movieName != "" {
            self.movieDataController.requestSourceData(movieName!) {(model, error) in
                if model != nil {
                    let movieViewModel: MovieReportViewModel = MovieReportViewModel.initViewModelWithModels(model!)
                    self.movieReportView.bindDataWithViewModel(movieViewModel)
                    if model?.title == "" {
                        self.popToAlertWithInfo("暂无数据,重新搜索",message: nil)
                    }
                }
            }
        } else {
            self.popToAlertWithInfo("请输入影片名",message: nil)
        }
    }
    
    private func handleAllCallBackBlock() {
        self.movieReportView.keyWords = {(keywords: String) in
            self.requestDataWithParam(keywords)
        }
        self.movieReportView.actsView.didClickOnRow = {(urls: String) in
            self.popToAlertWithInfo(urls,message: "是否跳转到这个网页?")
        }
        self.movieReportView.videoRecView.callBack = {(urlText: String) in
            self.popToAlertWithInfo(urlText,message: "是否跳转到这个网页?")
        }
    }
    
    private func popToAlertWithInfo(info: String, message: String?) {
        let alertVc = UIAlertController(title: info, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        alertVc.addAction(action)
        self.presentViewController(alertVc, animated: true, completion: nil)
    }
}

extension CSTableViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
}
