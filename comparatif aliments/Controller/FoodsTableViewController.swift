////
////  ViewController.swift
////  comparatif aliments
////
////  Created by Vincent Maldonado on 07/02/2022.
////
//
//import UIKit
//
//class ViewController: UIViewController, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath
//        )
//        cell.textLabel?.text = items[indexPath.row]
//        return cell
//    }
//
//    //TableView
//    private let table: UITableView = {
//        let table = UITableView()
//        table.register(UITableViewCell.self,forCellReuseIdentifier:"cell")
//
//        return table
//    }()
//
//    var items = [String]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.items = UserDefaults.standard.stringArray(forKey: "items") ?? []
//       title = "Aliments"
//        view.addSubview(table)
//        table.dataSource = self
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
//    }
//
//    @objc private func didTapAdd(){
//        let alert = UIAlertController(title:"Nouvel aliment", message:"Nouvel", preferredStyle: .alert)
//        alert.addTextField { field in
//            field.placeholder = "Nouvel Aliment"
//        }
//        alert.addAction(UIAlertAction(title:"Cancel", style: .cancel, handler: nil))
//        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: {[weak self] (_) in
//            if let field = alert.textFields?.first {
//                if let text = field.text, !text.isEmpty {
//                    DispatchQueue.main.async {
//                        var currentItems = UserDefaults.standard.stringArray(forKey: "iitems") ?? []
//                        currentItems.append(text)
//                        UserDefaults.standard.setValue(currentItems, forKey: "items")
//                        self?.items.append(text)
//                        self?.table.reloadData()
//                    }
//                }
//            }
//        }))
//        present(alert,animated: true)
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        table.frame = view.bounds
//    }
//
//
//
//}
//

//
//  FoodsTableViewController.swift
//  comparatif aliments
//
//  Created by Vincent Maldonado on 08/02/2022.
//




import UIKit

class FoodsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var foodTableView: UITableView!
    var foods: [Food] = []
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let food = foods[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "foodId", for: indexPath) as? FoodTableViewCell {
            cell.setupCell(food)
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "foodId", for: indexPath)
            cell.textLabel?.text = food.name
            cell.selectionStyle = .none
            return cell
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        foodTableView.delegate = self
        foodTableView.dataSource = self
        foods = Foods().all()
        
    }
}


class Foods {
    func all() -> [Food] {
        var foods: [Food] = []
        foods.append(Food(name: "Poisson",img: nil,shops: nil ))
        foods.append(Food(name: "Poisson",img: nil,shops: nil ))
        foods.append(Food(name: "Poisson",img: nil,shops: nil ))
        return foods
     }
}
