//
//  HomeViewController.swift
//  myDiary
//
//  Created by beaunexMacBook on 4/24/24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    let rootView: HomeView = HomeView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
}
