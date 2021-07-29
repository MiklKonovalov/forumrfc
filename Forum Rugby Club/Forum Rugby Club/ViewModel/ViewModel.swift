//
//  ViewModel.swift
//  Forum Rugby Club
//
//  Created by Misha on 28.07.2021.
//

import Foundation



class ViewModel: TableViewViewModelType {
    
    //интерфейс для отправки данных в координатор
    var onShowNext: (() -> Void)?
    
    //интерфейс для приёма данных от вью контроллера 
    lazy var onTapShowNextModel: () -> Void = { [weak self] in
        self?.onShowNext?()
    }
    
    private var selectedIndexPath: IndexPath?
    
    var profiles = [
        Profile(name: "Mihail Konovalov"),
        Profile(name: "Boris Taganov"),
        Profile(name: "Igor Kustov"),
    ]
    
    func numberOfRows() -> Int {
        return profiles.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(profile: profile)
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
}
