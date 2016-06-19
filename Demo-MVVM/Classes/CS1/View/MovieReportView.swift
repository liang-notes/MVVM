//
//  MovieReportView.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/11.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

let FontSize = UIFont.systemFontOfSize(14)
class MovieReportView: UIView {

    private lazy var titleLabel: UILabel = UILabel()
    private lazy var tagLabel: UILabel = UILabel()
    private lazy var actLabel: UILabel = UILabel()
    private lazy var yearLabel: UILabel = UILabel()
    private lazy var ratingLabel: UILabel = UILabel()
    private lazy var areaLabel: UILabel = UILabel()
    private lazy var dirLabel: UILabel = UILabel()
    private lazy var descLabel: UILabel = UILabel()
    private lazy var coverView: UIImageView = UIImageView()
    lazy var searchBar: MySearchBar = MySearchBar()
    lazy var actsView: ActsView = ActsView()
    lazy var videoRecView: VideoRecView = VideoRecView()
    var viewModel: MovieReportViewModel = MovieReportViewModel()
    var keyWords: ((keywords: String)->Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(coverView)
        addSubview(titleLabel)
        addSubview(tagLabel)
        addSubview(actLabel)
        addSubview(yearLabel)
        addSubview(ratingLabel)
        addSubview(areaLabel)
        addSubview(dirLabel)
        addSubview(descLabel)
        addSubview(videoRecView)
        addSubview(actsView)
        
        titleLabel.font = FontSize
        tagLabel.font = FontSize
        actLabel.font = FontSize
        yearLabel.font = FontSize
        ratingLabel.font = FontSize
        areaLabel.font = FontSize
        dirLabel.font = FontSize
        descLabel.font = UIFont.systemFontOfSize(14)
        actLabel.numberOfLines = 0
        dirLabel.numberOfLines = 0
        descLabel.numberOfLines = 0
        descLabel.preferredMaxLayoutWidth = UIScreen.mainScreen().bounds.width - 20
        
        addSubview(self.searchBar)
        searchBar.delegate = self
        searchBar.placeholder = "热门影视资讯"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindDataWithViewModel(viewModel: MovieReportViewModel) {
        self.viewModel = viewModel
        self.coverView.sd_setImageWithURL(viewModel.coverImageUrl)
        self.titleLabel.text = viewModel.titleText
        self.tagLabel.text = viewModel.tagText
        self.actLabel.text = viewModel.actText
        self.yearLabel.text = viewModel.yearText
        self.ratingLabel.text = viewModel.ratingText
        self.areaLabel.text = viewModel.areaText
        self.dirLabel.text = viewModel.dirText
        self.descLabel.text = viewModel.descText
        self.actsView.bindDataWithViewModel(viewModel.actsVM)
        self.videoRecView.bindDataWithViewModel(viewModel.videoRecVM)
        
        self.searchBar.frame = viewModel.searchBarFrame
        self.coverView.frame = viewModel.coverFrame
        self.titleLabel.frame = viewModel.titleFrame
        self.tagLabel.frame = viewModel.tagFrame
        self.actLabel.frame = viewModel.actFrame
        self.yearLabel.frame = viewModel.yearFrame
        self.ratingLabel.frame = viewModel.ratingFrame
        self.areaLabel.frame = viewModel.areaFrame
        self.dirLabel.frame = viewModel.dirFrame
        self.descLabel.frame = viewModel.descFrame
        self.actsView.frame = viewModel.actsViewFrame
        self.videoRecView.frame = viewModel.videoRecViewFrame
        self.setNeedsLayout()
    }
    
    func handleKeyWords(str:String) {
        if self.keyWords != nil {
            self.keyWords!(keywords: str)
        }
    }
}

extension MovieReportView: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if self.searchBar.text != nil {
            self.handleKeyWords(self.searchBar.text!)
            self.endEditing(true)
            return true
        }
        else {
            self.endEditing(true)
            return true
        }
    }
}
