//
//  MainViewController.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/11.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var contentView: UIScrollView?
    var jiXiongView: JiXiongView!
    var weChatView: WeChatView!
    var gridMenu: GridMenuView!
    var jiXiongDataController: JiXiongDataController = JiXiongDataController()
    var weChatDataController: WeChatViewDataController = WeChatViewDataController()
    var gridMenuDataController: GridMenuDataViewController = GridMenuDataViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
        handleCallBack()
    }
    
    private func setupUI() {
        let width = UIScreen.mainScreen().bounds.width
        self.contentView = UIScrollView()
        view.addSubview(self.contentView!)
        self.jiXiongView = JiXiongView()
        self.weChatView = WeChatView()
        self.gridMenu = GridMenuView()
        self.contentView!.addSubview(jiXiongView!)
        self.contentView!.addSubview(weChatView!)
        self.contentView!.addSubview(gridMenu!)
        
        contentView!.was_Fill(view)
        gridMenu!.was_AlignInner(type: WAS_AlignType.TopLeft, referView: contentView!, size: CGSizeMake(width, 200))
        weChatView!.was_AlignVertical(type: WAS_AlignType.BottomLeft, referView: gridMenu!, size: CGSizeMake(width, 300),offset: CGPointMake(0, 10))
        jiXiongView!.was_AlignVertical(type: WAS_AlignType.BottomLeft, referView: weChatView!, size: CGSizeMake(width, 500),offset: CGPointMake(0, 10))
        jiXiongView!.was_AlignInner(type: WAS_AlignType.BottomRight, referView: contentView!, size: nil)
    }

    private func setupData() {
        self.gridMenuDataController.requestGridMenu { (models, error) in
            if models != nil {
                let ViewModel: GridMenuViewModel = GridMenuViewModel.initViewModelWithModels(models!)
                self.gridMenu.bindDataWithViewModel(ViewModel)
            }
        }
        self.requesetWeChatDataWithParam(1)
        self.requesetJiXiongDataWithParam("123456789")
    }
    
    private func requesetWeChatDataWithParam(pageCount: Int) {
        self.weChatDataController.requestweChatData(pageCount, finished: { (models, error) in
            if models != nil {
                let ViewModel: WeChatViewModel = WeChatViewModel.initViewModelWithModels(models!)
                self.weChatView.bindDataWithViewModel(ViewModel)
            }
        })
    }
    
    private func requesetJiXiongDataWithParam(num: String) {
        self.jiXiongDataController.requestJiXiongData(num) { (model, error) in
            if model != nil {
                let viewModel: JiXiongViewModel = JiXiongViewModel.initViewModelWithModel(model!)
                self.jiXiongView.bindDataWithViewModel(viewModel)
            }
        }
    }
    
    private func popToAlertWithInfo(info: String) {
        let alertVc = UIAlertController(title: info, message: "是否跳转到这个网页?", preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        alertVc.addAction(action)
        self.presentViewController(alertVc, animated: true, completion: nil)
    }

    
    private func handleCallBack() {
        self.weChatView.cellDidClick = {(url: String?) in
            self.popToAlertWithInfo(url!)
        }

        self.weChatView.headerRefresh = {
            self.weChatDataController.isDownPullRefresh = true
            self.requesetWeChatDataWithParam(self.weChatDataController.page)
        }
        
        self.weChatView.footerRefresh = {
            self.weChatDataController.isDownPullRefresh = false
            self.weChatDataController.page += 1
            self.requesetWeChatDataWithParam(self.weChatDataController.page)
        }
        
        self.jiXiongView.CallBackInPutNumber = {(num: String) in
            self.requesetJiXiongDataWithParam(num)
        }

        self.gridMenu.toItem = {(index: Int) in
            self.popToAlertWithInfo("点击了\(String(index))")
        }
    }
}

