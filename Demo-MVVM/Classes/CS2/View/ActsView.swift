//
//  ActsView.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/15.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

let ActsCellReuseIdentifier: String = "ActsCellReuseIdentifier"
let W: CGFloat = UIScreen.mainScreen().bounds.width
class ActsView: UITableView {

    var actsVM: ActsViewModel = ActsViewModel()
    var didClickOnRow:((url: String)->())?
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: UITableViewStyle.Plain)
        self.scrollEnabled = false
        self.delegate = self
        self.dataSource = self
        registerClass(ActsViewCell.self, forCellReuseIdentifier: ActsCellReuseIdentifier)
        self.rowHeight = 70
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindDataWithViewModel(viewModel: ActsViewModel) {
        self.actsVM = viewModel
        self.reloadData()
    }
    
    func handleDidClick(url: String) {
        if self.didClickOnRow != nil {
            self.didClickOnRow!(url:url)
        }
    }
}

extension ActsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.actsVM.actsViewCellViewModel.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ActsCellReuseIdentifier, forIndexPath: indexPath) as! ActsViewCell
        let vm = self.actsVM.actsViewCellViewModel[indexPath.row]
        cell.bindDataWithViewModel(vm)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vm = self.actsVM.actsViewCellViewModel[indexPath.row]
        handleDidClick(vm.urlText)
    }
}
