//
//  GridCell.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/14.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class GridCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = UILabel()
    private lazy var imageV: UIImageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindDataWithViewModel(viewModel: GridCellViewModel) {
        titleLabel.text = viewModel.title
        imageV.image = viewModel.image
    }
    
    func setupUI() {
        addSubview(imageV)
        addSubview(titleLabel)
        imageV.contentMode = UIViewContentMode.Center
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.font = UIFont.systemFontOfSize(13)
        
        let w = self.frame.width
        let h = self.frame.height
        let margin: CGFloat = 10
        let imageLeft = 0.5 * w - 0.25 * h
        
        titleLabel.was_Fill(self.contentView, insets: UIEdgeInsetsMake(0.5 * h, 0, 0.25 * h, 0))
        imageV.was_Fill(self.contentView, insets: UIEdgeInsetsMake(1.5 * margin, imageLeft, 0.5 * h - 0.5 * margin, imageLeft))
    }
}
