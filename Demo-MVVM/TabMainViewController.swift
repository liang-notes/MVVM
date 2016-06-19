//
//  TabMainViewController.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/13.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class TabMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewControllers()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func addChildViewControllers() {
        addChildViewController(MainViewController(), title: "测试页一", imageName: "tab-workbench")
        addChildViewController(CSTableViewController(), title: "测试页二", imageName: "tab-house")
    }
    
    private func addChildViewController(childController: UIViewController, title: String, imageName: String) {
        
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "-highlighted")
        tabBar.tintColor = UIColor.orangeColor()
        let nav = UINavigationController()
        nav.addChildViewController(childController)
        addChildViewController(nav)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
