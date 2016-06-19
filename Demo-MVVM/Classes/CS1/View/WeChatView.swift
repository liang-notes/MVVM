//
//  WeChatView.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/12.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit
let WeChatCellReuseIdentifier: String = "WeChatCellReuseIdentifier"
class WeChatView: UITableView {

    var viewModel: WeChatViewModel = WeChatViewModel()
    var footerRefresh:(()-> Void)?
    var headerRefresh:(()-> Void)?
    var cellDidClick: ((string: String?)-> Void)?
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: UITableViewStyle.Plain)
        backgroundColor = UIColor.whiteColor()
        separatorStyle = UITableViewCellSeparatorStyle.None
        registerClass(WeChatCell.self, forCellReuseIdentifier: WeChatCellReuseIdentifier)
        self.delegate = self
        self.dataSource = self
        
        let header = MJRefreshNormalHeader()
        header.setRefreshingTarget(self, refreshingAction: #selector(WeChatView.handleHeaderRefresh))
        self.mj_header = header
        let footer = MJRefreshAutoNormalFooter()
        footer.setRefreshingTarget(self, refreshingAction: #selector(WeChatView.handleFooterRefresh))
        self.mj_footer = footer
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindDataWithViewModel(viewModel: WeChatViewModel) {
        self.viewModel = viewModel
        self.reloadData()
        self.mj_header.endRefreshing()
        self.mj_footer.endRefreshing()
    }
    
    func handleCellDidClick(string: String?) {
        if self.cellDidClick != nil {
            self.cellDidClick!(string: string)
        }
    }
    
    func handleFooterRefresh() {
        if self.footerRefresh != nil {
            self.footerRefresh!()
        }
    }
    
    func handleHeaderRefresh() {
        if self.headerRefresh != nil {
            self.headerRefresh!()
        }
    }

}

extension WeChatView: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.weChatCellViewModels.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(WeChatCellReuseIdentifier, forIndexPath: indexPath) as! WeChatCell
        let vm = self.viewModel.weChatCellViewModels[indexPath.row]
        cell.bindDataWithViewModel(vm)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.viewModel.weChatCellViewModels[indexPath.row].cellHeight
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vm = viewModel.weChatCellViewModels[indexPath.row]
        self.handleCellDidClick(vm.url)
    }
}