//
//  CalendarViewController.swift
//  myDiary
//
//  Created by beaunexMacBook on 4/24/24.
//

import UIKit

final class CalendarViewController: UIViewController {
    
    let rootView: HomeView = HomeView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
}
