//
//  PlayerTableViewCell.swift
//  Forum Rugby Club
//
//  Created by Misha on 28.07.2021.
//

import UIKit

final class PlayerTableViewCell: UITableViewCell {
    
    let userNameLable: UILabel = {
        let userNameLable = UILabel()
        userNameLable.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        userNameLable.textColor = .black
        userNameLable.translatesAutoresizingMaskIntoConstraints = false
        return userNameLable
    }()
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            userNameLable.text = viewModel?.name
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    func setupViews() {
        contentView.addSubview(userNameLable)
        
        let constraints = [
            userNameLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            userNameLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            userNameLable.heightAnchor.constraint(equalToConstant: 30),
            ]
        NSLayoutConstraint.activate(constraints)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension PlayerTableViewCell {
    
}
