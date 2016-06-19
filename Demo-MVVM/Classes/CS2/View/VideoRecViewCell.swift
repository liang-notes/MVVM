//
//  VideoRecViewCell.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/15.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class VideoRecViewCell: UICollectionViewCell {
    
    private lazy var coverView: UIImageView = UIImageView()
    private lazy var titleLabel: UILabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        addSubview(coverView)
        addSubview(titleLabel)
        titleLabel.font = UIFont.boldSystemFontOfSize(14)
        titleLabel.backgroundColor = UIColor.greenColor()
        titleLabel.textAlignment = NSTextAlignment.Center
    }
    
    func bindDataWithViewModel(viewModel: VideoRecCellViewModel) {
        self.titleLabel.text = viewModel.titleText
        self.coverView.sd_setImageWithURL(viewModel.imageUrl)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let H = self.contentView.frame.height
        self.coverView.was_Fill(self.contentView, insets: UIEdgeInsetsMake(0, 0, 25, 0))
        self.titleLabel.was_Fill(self.contentView, insets: UIEdgeInsetsMake(H - 25, 0, 0, 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
