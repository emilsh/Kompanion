//
//  Coordinator.swift
//  Kompanion
//
//  Created by Emil Shafigin on 4/4/23.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MainScreenVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func openDetailScreenVC(with starship: Starship) {
        let vc = DetailScreenVC()
        vc.coordinator = self
        vc.starship = starship
        navigationController.pushViewController(vc, animated: true)
    }
}
