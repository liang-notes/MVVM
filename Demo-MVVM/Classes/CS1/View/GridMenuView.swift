//
//  GridMenuView.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/11.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

let deviceWith: CGFloat = UIScreen.mainScreen().bounds.width
let CollectionViewCellReuseIdentifier: String = "CollectionViewCellReuseIdentifier"
class GridMenuView: UIView {

    var toItem: ((index: Int)-> Void)?
    var gridMenuViewModel:GridMenuViewModel = GridMenuViewModel()
    var collectionView: UICollectionView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(deviceWith / 4.0, 100)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: CGRectMake(0, 0, deviceWith, 200), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.whiteColor()
        addSubview(collectionView)
        self.collectionView = collectionView
        
        self.collectionView!.registerClass(GridCell.self, forCellWithReuseIdentifier: CollectionViewCellReuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindDataWithViewModel(viewModel: GridMenuViewModel) {
        self.gridMenuViewModel = viewModel
        self.collectionView!.reloadData()
    }
    
    func handleItemDidClick(index: Int) {
        if self.toItem != nil {
            self.toItem!(index:index)
        }
    }
}

extension GridMenuView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gridMenuViewModel.cellViewModels.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CollectionViewCellReuseIdentifier, forIndexPath: indexPath) as! GridCell
        let vm = self.gridMenuViewModel.cellViewModels[indexPath.item]
        cell.bindDataWithViewModel(vm)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        handleItemDidClick(indexPath.item)
    }
}

