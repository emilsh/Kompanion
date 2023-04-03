//
//  API.swift
//  Kompanion
//
//  Created by Emil Shafigin on 3/4/23.
//

import Foundation
import Moya

enum API {
    case starships
}

extension API: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://swapi.dev/api/") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .starships:
            return "starships"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .starships:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
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

extension API: CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy {
        switch self {
        case .starships:
            return .returnCacheDataElseLoad
        }
    }
}
