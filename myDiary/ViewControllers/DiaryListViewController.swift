//
//  DiaryListViewControllers.swift
//  myDiary
//
//  Created by beaunexMacBook on 4/22/24.
//

import UIKit

final class DiaryListViewController: UIViewController {
    
    let rootView: HomeView = HomeView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
}
