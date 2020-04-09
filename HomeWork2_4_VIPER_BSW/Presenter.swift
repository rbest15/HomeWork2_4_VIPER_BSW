import Foundation
import UIKit

protocol PresenterInput {
    func loadTableViewData(tableView: UITableView, sender: UIViewController)
    var categoriesArray : Array<String> { get set }
}
protocol PresenterOutput {
    
}


class Presenter: PresenterInput {
    var interactor : InteractorInput? = Interactor()
    var router : RouterInput? = Router()
    
    var categoriesArray = Array<String>()
    var urlString = "https://blackstarshop.ru/index.php?route=api/v1/categories"
    
    func loadTableViewData(tableView: UITableView, sender: UIViewController) {
        switch sender {
        case is ViewController:
            tableView.delegate = sender as! ViewController
            tableView.dataSource = sender as! ViewController
        default:
            return
        }
        interactor?.output = self
        interactor?.fetchDataFromURLAndReloadData(url: urlString, tableView: tableView)
    }
}

extension Presenter: InteractorOutput {
    
    var fethedArrayOfStrings: Array<String> {
        get {
            return categoriesArray
        }
        set {
            categoriesArray = newValue
        }
    }
    
}
