//
//  MySearchBar.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/13.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class MySearchBar: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = UIFont.systemFontOfSize(13)
        var image = UIImage(named: "searchbar_textfield_background")
        let scale: CGFloat = 0.5
        image = image?.stretchableImageWithLeftCapWidth(Int(image!.size.width * scale), topCapHeight: (Int(image!.size.width * scale)))
        self.background = image
        
        let imageView = UIImageView(image: UIImage(named: "searchbar_textfield_search_icon"))
        imageView.frame.size = CGSizeMake(imageView.image!.size.width + 10, imageView.frame.size.height)
        imageView.contentMode = UIViewContentMode.Center
        self.leftView = imageView
        self.leftViewMode = UITextFieldViewMode.Always
        self.returnKeyType = UIReturnKeyType.Done
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
