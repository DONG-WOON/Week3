//
//  SettingTabBarController.swift
//  Week3
//
//  Created by 서동운 on 9/17/23.
//

import UIKit

class SettingTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let case1VC = Case1ViewController()
        case1VC.tabBarItem.image = UIImage(systemName: "1.circle.fill")
        let case2VC = Case2ViewController()
        case2VC.tabBarItem.image = UIImage(systemName: "2.circle.fill")
        
        viewControllers = [case1VC, case2VC]
      
    }
}
