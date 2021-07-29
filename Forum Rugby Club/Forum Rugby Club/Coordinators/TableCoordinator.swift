//
//  TableCoordinator.swift
//  Forum Rugby Club
//
//  Created by Misha on 29.07.2021.
//

import UIKit
// Координатор занимается навигацией
class TableCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    let factory: ControllerFactory
    private lazy var tableModule = {
        factory.makeTableController()
    }()
    
    init(navigationController: UINavigationController, factory: ControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        tableModule.viewModel.onShowNext = { [weak self] in
            guard let controller = self?.configureNext() else { return }
            
            self?.navigationController.pushViewController(controller, animated: true)
        }
    }
    
    func configureNext() -> DetailViewController {
        return factory.makeDetailController().controller
    }
    
}
