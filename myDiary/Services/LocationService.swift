//
//  CLLocation.swift
//  myDiary
//
//  Created by beaunexMacBook on 4/25/24.
//

import CoreLocation
import RxSwift
import RxCocoa

final class LocationService {
   
    private let locationManager = CLLocationManager()
    private let delegateProxy: RxCLLocationManagerDelegateProxy
    
    init() {
        delegateProxy = RxCLLocationManagerDelegateProxy(locationManager: locationManager)
        locationManager.delegate = delegateProxy
    }
    
    // MARK: - Reactive Properties
    var didUpdateLocations: Observable<[CLLocation]> {
        return delegateProxy.didUpdateLocationsSubject.asObservable()
    }
    
    var didFailWithError: Observable<Error> {
        return delegateProxy.didFailWithErrorSubject.asObservable()
    }
    
    // MARK: - CLLocationManager Methods
        // 위치 권한 요청
       func requestAuthorization() {
           locationManager.requestWhenInUseAuthorization()
       }
       
       // 위치 업데이트 요청
       func startUpdatingLocation() {
           locationManager.startUpdatingLocation()
       }
       
       // 위치 업데이트 중지
       func stopUpdatingLocation() {
           locationManager.stopUpdatingLocation()
       }
    }

