//
//  AgentInformationViewModel.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/12.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class JiXiongViewModel: NSObject {
    

    var Label1Text: String = ""
    var Label2Text: String = ""
    var Label3Text: String = ""
    var Label4Text: String = ""
    var Label5Text: String = ""
    var Label6Text: String = ""
    var Label7Text: String = ""
    var Label8Text: String = ""
    class func initViewModelWithModel(model: JiXiongModel)-> JiXiongViewModel {
        let vm = JiXiongViewModel()
        vm.Label1Text = model.hanyi
        vm.Label2Text = model.jiankang
        vm.Label3Text = model.jianshu
        vm.Label4Text = model.jiating
        vm.Label5Text = model.jiye
        vm.Label6Text = String(model.no)
        vm.Label7Text = model.shuli
        vm.Label8Text = model.xiangjie
        return vm
    }
}
