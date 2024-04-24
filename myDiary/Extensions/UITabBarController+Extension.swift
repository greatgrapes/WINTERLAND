//
//  Extension+UITabBarController.swift
//  myDiary
//
//  Created by beaunexMacBook on 4/24/24.
//

import UIKit

extension UITabBarController {
    /// 네비게이션 컨트롤러 템플릿
    func templatNavigationController(_ title: String, unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        let unselect = unselectedImage.resizeImage(size: CGSize(width: 24, height: 24))
        let select = selectedImage.resizeImage(size: CGSize(width: 24, height: 24))
        nav.tabBarItem.image = unselect
        nav.tabBarItem.selectedImage = select
        nav.tabBarItem.title = title
        nav.navigationBar.tintColor = .black
        return nav
    }
    
    /// TabBar Setup
    func tabBarSetup() {
        let appearance = UITabBarAppearance()
        // set tabbar opacity
        appearance.configureWithOpaqueBackground()
        // remove tabbar border line
        appearance.shadowColor = UIColor.darkGray
        // set tabbar background color
        appearance.backgroundColor = .white
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
                // set tabbar opacity
                tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        self.tabBar.isTranslucent = false
    }
}
