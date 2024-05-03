//
//  TabBarViewController.swift
//  myDiary
//
//  Created by beaunexMacBook on 4/24/24.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        tabBarSetup()
    }
    
    
    private func configureViewController() {
        let home = templatNavigationController("홈", unselectedImage: UIImage(), selectedImage: UIImage(), rootViewController: HomeViewController(locationService: LocationService()))
        let diary = templatNavigationController("다이어리", unselectedImage: UIImage(), selectedImage: UIImage(), rootViewController: DiaryListViewController())
        let calendar = templatNavigationController("캘린더", unselectedImage: UIImage(), selectedImage: UIImage(), rootViewController: CalendarViewController())
        let setting = templatNavigationController("내 정보", unselectedImage: UIImage(), selectedImage: UIImage(), rootViewController: SettingViewController())
        viewControllers = [home, diary, calendar, setting]
        tabBar.tintColor = .black
    }
    
    
}
