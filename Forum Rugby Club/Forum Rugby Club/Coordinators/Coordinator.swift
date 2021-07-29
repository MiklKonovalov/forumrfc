//
//  Coordinator.swift
//  Forum Rugby Club
//
//  Created by Misha on 29.07.2021.
//

import Foundation

protocol Coordinator: AnyObject {
    var coordinators: [Coordinator] { get set }
}
