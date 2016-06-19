//
//  WeChatCell.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/14.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class WeChatCell: UITableViewCell {


    private lazy var titleLabel: UILabel = UILabel()
    private lazy var imageV: UIImageView = UIImageView()
    private lazy var cutLine: UIView = UIView()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.whiteColor()
        self.selectionStyle = .None
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(cutLine)
        contentView.addSubview(imageV)
        contentView.addSubview(titleLabel)
        
        cutLine.backgroundColor = UIColor.darkGrayColor()
        titleLabel.font = UIFont.systemFontOfSize(13)
        titleLabel.numberOfLines = 0
        titleLabel.preferredMaxLayoutWidth = UIScreen.mainScreen().bounds.width - 80
    }

    func bindDataWithViewModel(viewModel:WeChatCellViewModel) {
        titleLabel.text = viewModel.title
        imageV.sd_setImageWithURL(viewModel.imageUrl)
        
        imageV.frame = viewModel.imageFrame!
        titleLabel.frame = viewModel.titleFrame!
        cutLine.frame = viewModel.cutLineFrame!
        self.layoutIfNeeded()
    }
}
