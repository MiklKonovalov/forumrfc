//
//  TableViewCellViewModel.swift
//  Forum Rugby Club
//
//  Created by Misha on 28.07.2021.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {

    var onShowNext: (() -> Void)?
    
    lazy var onTapShowNextModel: () -> Void = { [weak self] in
        self?.onShowNext?()
    }
    
    private var profile: Profile
    
    var name: String {
        return profile.name
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
}
