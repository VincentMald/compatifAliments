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
    
    
    @IBAction func AddButton(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            let textField = alert.textFields![0] as UITextField
            if !textField.text!.trimmingCharacters(in: .whitespaces).isEmpty, let text = textField.text {
                self.foods.append(Food(name: text, img: nil, shops: nil))
                self.foodTableView.reloadData()
            }
            
        }))
        alert.addAction(UIAlertAction(title: "Annuler", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {

                // remove the item from the data model
                foods.remove(at: indexPath.row)
                // delete the table view row
                tableView.reloadData()

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
        foodTableView.allowsMultipleSelectionDuringEditing = false
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
