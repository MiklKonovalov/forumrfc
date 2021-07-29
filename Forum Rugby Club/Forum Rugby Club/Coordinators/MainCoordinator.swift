//
//  MainCoordinator.swift
//  Forum Rugby Club
//
//  Created by Misha on 29.07.2021.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let factory = ControllerFactoryImpl()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        let detail = configureDetailViewController()
        let table = configureTableViewController()
        
        coordinators.append(table)
    }
    
    func configureDetailViewController() -> UINavigationController {
        let detailViewController = DetailViewController()
        let navigationDetailViewController = UINavigationController(rootViewController: detailViewController)
        return navigationDetailViewController
    }
    
    func configureTableViewController() -> TableCoordinator {
        let navigationTableViewController = UINavigationController()
        let coordinator = TableCoordinator(navigationController: navigationTableViewController, factory: factory)
        return coordinator
    }
    
}
