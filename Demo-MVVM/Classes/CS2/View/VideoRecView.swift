//
//  VideoRecView.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/15.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

let Width: CGFloat = UIScreen.mainScreen().bounds.size.width
let margin: CGFloat = 10
let itemW: CGFloat = (Width - 4 * margin) / 3
let itemH: CGFloat = 1.3 * itemW
let VideoRecViewReuseIdentifier: String = "VideoRecViewReuseIdentifier"
class VideoRecView: UIView {

    var videoRecVM: VideoRecViewModel = VideoRecViewModel()
    var collectionView: UICollectionView!
    var callBack: ((info: String)-> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(itemW, itemH)
        layout.minimumInteritemSpacing = margin
        layout.minimumLineSpacing = margin
        
        self.collectionView = UICollectionView(frame: CGRectMake(0, 0, Width - 2 * margin, itemH * 2 + margin), collectionViewLayout: layout)
        addSubview(self.collectionView)
        self.collectionView.backgroundColor = UIColor.clearColor()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.registerClass(VideoRecViewCell.self, forCellWithReuseIdentifier: VideoRecViewReuseIdentifier)
    }
    
//    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
//        super.init(frame: frame, collectionViewLayout: NewLayout())
//      
//        self.collectionView = UICollectionView(frame: CGRectMake(0, 0, Width - 2 * margin, itemH * 2 + margin), collectionViewLayout: layout)
//        self.backgroundColor = UIColor.clearColor()
//        self.delegate = self
//        self.dataSource = self
//        registerClass(VideoRecViewCell.self, forCellWithReuseIdentifier: VideoRecViewReuseIdentifier)
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bindDataWithViewModel(viewModel: VideoRecViewModel) {
        self.videoRecVM = viewModel
        self.collectionView.reloadData()
    }
    
    func callBack(info: String) {
        if self.callBack != nil {
            self.callBack!(info: info)
        }
    }
}

extension VideoRecView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.videoRecVM.videoRecViewModel.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(VideoRecViewReuseIdentifier, forIndexPath: indexPath) as! VideoRecViewCell
        let vm = self.videoRecVM.videoRecViewModel[indexPath.item]
        cell.bindDataWithViewModel(vm)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let vm = self.videoRecVM.videoRecViewModel[indexPath.item]
        self.callBack(vm.urlText)
    }
}
