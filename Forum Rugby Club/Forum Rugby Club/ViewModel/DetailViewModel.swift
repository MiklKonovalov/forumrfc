//
//  DetailViewModel.swift
//  Forum Rugby Club
//
//  Created by Misha on 28.07.2021.
//

import Foundation

class DetailViewModel: DetailViewModelType {
    
    private var profile: Profile
    
    var description: String {
        return String("\(profile.name) is scrum-half")
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
}
