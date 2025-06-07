//
//  TabController.swift
//  PhotoCleanEasy
//
//  Created by Nguyen Anh Tuan on 19/5/25.
//

import UIKit

class TabController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }
    
    private func setupTabbar() {
        let cleanerVC = setupNav(title: "Cleaner", img: UIImage(named: "icCleaner")!, vc: CleanerViewController())
        let chargingVC = setupNav(title: "Charging", img: UIImage(named: "icBattery")!, vc: ChargingViewController())
        self.setViewControllers([cleanerVC, chargingVC], animated: true)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.cAAAAAA], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.c50BD61], for: .selected)
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .c141414
            tabBar.standardAppearance = appearance
    }
    
    private func setupNav(title: String, img: UIImage, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = img
        nav.setNavigationBarHidden(true, animated: true)
        return nav
    }
}
