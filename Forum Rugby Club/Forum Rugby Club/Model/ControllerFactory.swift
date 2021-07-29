//
//  ControllerFactory.swift
//  Forum Rugby Club
//
//  Created by Misha on 29.07.2021.
//

import Foundation

protocol ControllerFactory {
    
    //Создаём фабрику, которая будет импортировать контроллер
    //Фабрика создаёт модули
    //В фабрике создаём модуль и передаём координатору
    func makeDetailController() -> (viewModel: DetailViewModel, controller: DetailViewController)
    
    func makeTableController() -> (viewModel: ViewModel, controller: TableViewController)
}

struct ControllerFactoryImpl: ControllerFactory {
    
    func makeDetailController() -> (viewModel: DetailViewModel, controller: DetailViewController) {
        let profile = Profile(name: "Новый игрок")
        let viewModel = DetailViewModel(profile: profile)
        let controller = DetailViewController()
        return (viewModel, controller)
    }
    
    func makeTableController() -> (viewModel: ViewModel, controller: TableViewController) {
        let viewModel = ViewModel()
        let controller = TableViewController()
        return (viewModel, controller)
    }
    
}
