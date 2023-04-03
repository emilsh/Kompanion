//
//  NetworkManager.swift
//  Kompanion
//
//  Created by Emil Shafigin on 3/4/23.
//

import Foundation
import Moya

//MARK: - NetworkManager
protocol Networkable {
    var provider: MoyaProvider<API> { get }
    func fetchStarships(completion: @escaping (Result<StarshipResponse, Error>) -> ())
}

class NetworkManager: Networkable {
    
    var provider = MoyaProvider<API>(plugins: [CachePolicyPlugin()])
    
    func fetchStarships(completion: @escaping (Result<StarshipResponse, Error>) -> ()) {
        request(target: .starships, completion: completion)
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: API, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let result = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(result))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

//MARK: - CachePolicyPlugin
protocol CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy { get }
}

final class CachePolicyPlugin: PluginType {
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        if let cachePolicyGettable = target as? CachePolicyGettable {
            var mutableRequest = request
            mutableRequest.cachePolicy = cachePolicyGettable.cachePolicy
            return mutableRequest
        }

        return request
    }
}
