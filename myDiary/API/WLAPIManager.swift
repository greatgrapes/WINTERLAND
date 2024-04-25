//
//  WinterlandAPIManager.swift
//  myDiary
//
//  Created by beaunexMacBook on 4/25/24.
//

import Foundation
import Alamofire
import RxSwift

enum NetworkError: Int, Error {
  case badRequest = 400
  case authenticationFailed = 401
  case notFoundException = 404
  case contentLengthError = 413
  case quotaExceeded = 429
  case systemError = 500
  case endpointError = 503
  case timeout = 504
}

protocol NetworkServiceProtocol {
    func fetchData<T: Decodable>(type: T.Type, url: String, param: Parameters) -> Observable<T>
}


final class NetworkService: NetworkServiceProtocol {
    func fetchData<T: Decodable>(type: T.Type, url: String, param: Parameters) -> Observable<T> {
        return Observable.create { observer in
            let request = AF.request(url,
                                     method: .post,
                                     parameters: param,
                                     encoding: URLEncoding(destination: .queryString))
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let data):
                        observer.onNext(data)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
