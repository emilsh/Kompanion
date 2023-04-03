//
//  MainScreenViewModel.swift
//  Kompanion
//
//  Created by Emil Shafigin on 3/4/23.
//

import Foundation

final class MainScreenViewModel {
    
    private let networkManager: NetworkManager
    
    var starships: [Starship] = []
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchStarships(completion: @escaping (Bool) -> ()) {
        networkManager.fetchStarships { result in
            switch result {
            case .success(let response):
                print(response.results)
                self.starships = response.results
                completion(true)
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
    
    
}
