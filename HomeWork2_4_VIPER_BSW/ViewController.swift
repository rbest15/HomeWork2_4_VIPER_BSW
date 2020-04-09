import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var categoryTableView: UITableView!
    var presenter: PresenterInput? = Presenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadTableViewData(tableView: categoryTableView, sender: self)
    }
}

extension ViewController: PresenterOutput {
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.categoriesArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTableView.dequeueReusableCell(withIdentifier: "bswCell") as! BSWTableViewCell
        cell.categoryLabel.text = presenter?.categoriesArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

