//
//  AgentInformationView.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/11.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class JiXiongView: UIView {

    private lazy var Label1: UILabel = UILabel()
    private lazy var Label2: UILabel = UILabel()
    private lazy var Label3: UILabel = UILabel()
    private lazy var Label4: UILabel = UILabel()
    private lazy var Label5: UILabel = UILabel()
    private lazy var Label6: UILabel = UILabel()
    private lazy var Label7: UILabel = UILabel()
    private lazy var Label8: UILabel = UILabel()
    lazy var searchBar: MySearchBar = MySearchBar()
    var CallBackInPutNumber: ((inputNumber: String)->Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(self.Label1)
        addSubview(self.Label2)
        addSubview(self.Label3)
        addSubview(self.Label4)
        addSubview(self.Label5)
        addSubview(self.Label6)
        addSubview(self.Label7)
        addSubview(self.Label8)
        addSubview(self.searchBar)
        addSubview(self.searchBar)
        searchBar.delegate = self
        searchBar.placeholder = "号码吉凶查询"
        Label2.numberOfLines = 0
        Label3.numberOfLines = 0
        Label4.numberOfLines = 0
        Label5.numberOfLines = 0
        Label8.numberOfLines = 0
        Label2.preferredMaxLayoutWidth = deviceWith - 2 * margin
        Label3.preferredMaxLayoutWidth = deviceWith - 2 * margin
        Label4.preferredMaxLayoutWidth = deviceWith - 2 * margin
        Label5.preferredMaxLayoutWidth = deviceWith - 2 * margin
        Label8.preferredMaxLayoutWidth = deviceWith - 2 * margin
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleInPutNumber(inPutNumber: String) {
        if self.CallBackInPutNumber != nil {
            self.CallBackInPutNumber!(inputNumber:inPutNumber)
        }
    }
    
    func bindDataWithViewModel(viewModel: JiXiongViewModel) {
        self.Label1.text = viewModel.Label1Text
        self.Label2.text = viewModel.Label2Text
        self.Label3.text = viewModel.Label3Text
        self.Label4.text = viewModel.Label4Text
        self.Label5.text = viewModel.Label5Text
        self.Label6.text = viewModel.Label6Text
        self.Label7.text = viewModel.Label7Text
        self.Label8.text = viewModel.Label8Text
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.searchBar.was_AlignInner(type: WAS_AlignType.TopLeft, referView: self, size: CGSizeMake(deviceWith, 35), offset: CGPoint(x: 10, y: 10))
        self.Label1.was_AlignVertical(type: WAS_AlignType.BottomLeft, referView: searchBar, size: CGSizeMake(deviceWith, 20), offset: CGPoint(x: 0, y: 10))
        self.Label2.was_AlignVertical(type: WAS_AlignType.BottomLeft, referView: Label1, size: nil,offset: CGPointMake(0, 5))
        self.Label3.was_AlignVertical(type: WAS_AlignType.BottomLeft, referView: Label2, size: CGSizeMake(deviceWith, 20),offset: CGPointMake(0, 5))
        self.Label4.was_AlignVertical(type: WAS_AlignType.BottomLeft, referView: Label3, size: nil,offset: CGPointMake(0, 5))
        self.Label5.was_AlignVertical(type: WAS_AlignType.BottomLeft, referView: Label4, size: nil,offset: CGPointMake(0, 5))
        self.Label6.was_AlignVertical(type: WAS_AlignType.BottomLeft, referView: Label5, size: CGSizeMake(deviceWith, 20),offset: CGPointMake(0, 5))
        self.Label7.was_AlignVertical(type: WAS_AlignType.BottomLeft, referView: Label6, size: CGSizeMake(deviceWith, 20),offset: CGPointMake(0, 5))
        self.Label8.was_AlignVertical(type: WAS_AlignType.BottomLeft, referView: Label7, size: nil)
    }
}

extension JiXiongView: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if self.searchBar.text != nil {
            self.handleInPutNumber(self.searchBar.text!)
            self.endEditing(true)
            return true
        }
        else {
            self.endEditing(true)
            return true
        }
    }
}
