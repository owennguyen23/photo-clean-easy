//
//  PhotoCleaningVCViewController.swift
//  PhotoCleanEasy
//
//  Created by Nguyen Anh Tuan on 2/6/25.
//

import UIKit

class PhotoCleaningVCViewController: BaseViewController {
    
    @IBOutlet weak var headerApp: UIView!
    @IBOutlet weak var tabBar: PhotoCleaningTabBarView!
    
    override func initUI() {
        super.initUI()
        self.view.backgroundColor = .c141414
        self.headerApp.backgroundColor = .c292929
        tabBar.delegate = self
    }
    
    @IBAction func goBackAction(_ sender: Any) {
        self.goBack()
    }
}


extension PhotoCleaningVCViewController: PhotoCleaningTabBarViewDelegate {
    func didSelectTab(at index: Int) {
        print("didSelectTab at: \(index)")
    }
}
