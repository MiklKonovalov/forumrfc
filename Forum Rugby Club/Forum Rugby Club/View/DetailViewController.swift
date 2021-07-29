//
//  DetailViewController.swift
//  Forum Rugby Club
//
//  Created by Misha on 28.07.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModelType?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }
        self.positionLable.text = viewModel.description
    }
    
    let positionLable: UILabel = {
        let userNameLable = UILabel()
        userNameLable.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        userNameLable.textColor = .black
        userNameLable.translatesAutoresizingMaskIntoConstraints = false
        return userNameLable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(positionLable)
        
        let constraints = [
            positionLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            positionLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            positionLable.heightAnchor.constraint(equalToConstant: 30),
            ]
        NSLayoutConstraint.activate(constraints)

    }
    
}
