//
//  TableViewModelType.swift
//  Forum Rugby Club
//
//  Created by Misha on 28.07.2021.
//

import Foundation

//В протоколах содержатся требования к ВьюМодели
protocol TableViewViewModelType {
    
    func numberOfRows() -> Int
    
    //Данный метод снимает ответственность с данной ВьюМодели и передаёт следующей для создания ячеек
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?
    
    func viewModelForSelectedRow() -> DetailViewModelType?
    
    func selectRow(atIndexPath indexPath: IndexPath)
    
}
