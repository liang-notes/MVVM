//
//  ActsViewCell.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/15.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class ActsViewCell: UITableViewCell {


    private lazy var imageV: UIImageView = UIImageView()
    private lazy var nameLabel: UILabel = UILabel()
    private lazy var detailLabel: UILabel = UILabel()
    var viewModel: ActsViewCellViewModel = ActsViewCellViewModel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .None
        contentView.addSubview(imageV)
        contentView.addSubview(nameLabel)
        contentView.addSubview(detailLabel)
        nameLabel.font = UIFont.systemFontOfSize(15)
        detailLabel.font = UIFont.systemFontOfSize(11)
        detailLabel.numberOfLines = 0
        detailLabel.preferredMaxLayoutWidth = deviceWith - 70
        detailLabel.textColor = UIColor.blueColor()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageV.frame = CGRectMake(5, 5, 60, 60)
        nameLabel.frame = CGRectMake(70, 5, self.frame.width - 60, 20)
        detailLabel.frame = CGRectMake(70, 25, self.frame.width - 60, 40)
    }
    
    func bindDataWithViewModel(viewModel: ActsViewCellViewModel) {
        self.viewModel = viewModel
        self.nameLabel.text = viewModel.nameText
        self.imageV.sd_setImageWithURL(viewModel.imageUrl)
        self.detailLabel.text = viewModel.urlText
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
