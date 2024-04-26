//
//  HomeViewController.swift
//  myDiary
//
//  Created by beaunexMacBook on 4/24/24.
//

import UIKit
import RxSwift
import RxCocoa
import CoreLocation

final class HomeViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    let rootView: HomeView = HomeView()
    // Test
    // TODO:: LocationService 따로빼기 싱글톤이 아닌
    let locationService: LocationService
    
    init(locationService: LocationService) {
        self.locationService = locationService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 위치 권한 요청
        locationService.requestAuthorization()
        // 위치 업데이트 시작
        locationService.startUpdatingLocation()
        // 위치 업데이트 subscribe
        locationService.didUpdateLocations
            .take(1)
            .subscribe(onNext: { locations in
                // 위치 업데이트 처리
                for location in locations {
                    print("Received location - lat :: \(location.coordinate.latitude)")
                    print("Received location - lon :: \(location.coordinate.longitude)")
                }
            })
            .disposed(by: disposeBag)
    }
    
    
    
}
