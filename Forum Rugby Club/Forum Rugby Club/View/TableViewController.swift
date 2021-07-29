//
//  TableViewController.swift
//  Forum Rugby Club
//
//  Created by Misha on 28.07.2021.
//

import UIKit
//TableViewController - это наш основной класс. Отвечает за то, что мы отображаем в нашей таблице. Это наш единственный экран. Всю информацию экрана мы храним во ВьюМодели
class TableViewController: UIViewController {
//через контроллер мы должны обратиться к Вью Модели, а не к Модели!
    
    //Чтобы достать информацию у нас должна быть ссылка на ВьюМодель
    private var viewModel: TableViewViewModelType?
    
    let tablePlayersView = UITableView(frame: .zero, style: .grouped)
    let cellID = "cellID"
    
    private func setupTableView() {
        tablePlayersView.register(PlayerTableViewCell.self, forCellReuseIdentifier: cellID)
        tablePlayersView.dataSource = self
        tablePlayersView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupConstraints()
        setupTableView()
        
        //создаём ВьюМодель
        viewModel = ViewModel()
    }
    
    private func setupConstraints() {
        tablePlayersView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tablePlayersView)
        
        let constraintsTableView = [
            tablePlayersView.topAnchor.constraint(equalTo: view.topAnchor),
            tablePlayersView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tablePlayersView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tablePlayersView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ]
        
        NSLayoutConstraint.activate(constraintsTableView)
    }
    
}

    // MARK: - Table view data source

extension TableViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1

    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }

    //В данном методе мы отрисовывем ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! PlayerTableViewCell
        
        //Проверяем, что у нас есть ячейки
        guard let viewModel = viewModel else { return UITableViewCell() }
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        //у Вью Модели должна быть своя модель, приминимая к ячейке, куда мы будем передавать indexPath
        
        cell.viewModel = cellViewModel
        
        return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Проверяем нашу Вью Модель
        guard let viewModel = viewModel else { return }
        //Сохраняем indexPath внутри нашей ВьюМодели
        viewModel.selectRow(atIndexPath: indexPath)
        //Осуществляем переход
        
        
        
    }
    
}

extension TableViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (section == 0) ? 230 : 5
    }
    
}
