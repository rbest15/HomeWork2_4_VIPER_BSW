import Foundation
import UIKit
import Alamofire

protocol InteractorInput {
    func fetchDataFromURLAndReloadData(url: String, tableView: UITableView)
    var output : InteractorOutput? { get set }
}
protocol InteractorOutput {
    var fethedArrayOfStrings: Array<String> { get set }
}

class Interactor : InteractorInput{
    var output : InteractorOutput?
    
    func fetchDataFromURLAndReloadData(url: String, tableView: UITableView) {
        AF.request(url).validate().responseJSON { (response) in
            let arrayFromData = try? JSONDecoder().decode( [String: CategoriesDecoder].self, from: response.data!)
            for cats in arrayFromData! {
                self.output?.fethedArrayOfStrings.append(cats.value.name)
            }
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }
}

struct CategoriesDecoder: Decodable {
    var name = ""
}
