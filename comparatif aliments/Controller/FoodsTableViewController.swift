//
//  FoodsTableViewController.swift
//  comparatif aliments
//
//  Created by Vincent Maldonado on 08/02/2022.
//




import UIKit

class FoodsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    var foods: [Food] = []
    var filteredFoods: [Food] = []
    
    
    @IBOutlet weak var searchBarFood: UISearchBar!
    @IBOutlet weak var foodTableView: UITableView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodTableView.delegate = self
        foodTableView.dataSource = self
        searchBarFood.delegate = self
    
        //Custom Button bottom Page
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addItem))
        navigationItem.title = "Mes Aliments"
        
        foods = Foods().all()
        filteredFoods = foods
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredFoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let food = filteredFoods[indexPath.row]
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
                filteredFoods.remove(at: indexPath.row)
                // reload the table view
                tableView.reloadData()
            }
        }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "details", sender: foods[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details", let vc = segue.destination as? DetailViewController{
            vc.food = sender as? Food
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
           
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //Si il n'y a pas de text, on garde les foods , sinon filtrer
        filteredFoods = searchText.isEmpty ? foods : foods.filter({(food: Food) -> Bool in
            // Si le text et la food matchent on renvoit true
            return food.name.range(of: searchText, options: .caseInsensitive) != nil
        })
        foodTableView.reloadData()
    }
    
    @objc func addItem(){let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        //Ajour  d'un textfield
        alert.addTextField(configurationHandler: nil)
        //Bouton "OK" qui rajoute ce qu'il y a dans le textField
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            let textField = alert.textFields![0] as UITextField
            if !textField.text!.trimmingCharacters(in: .whitespaces).isEmpty, let text = textField.text {
                self.foods.append(Food(name: text, img: nil, shops: nil))
                self.filteredFoods.append(Food(name: text, img: nil, shops: nil))
                self.foodTableView.reloadData()
            }
        }))
        //Bouton annuler sur l'Alert
        alert.addAction(UIAlertAction(title: "Annuler", style: .default, handler: nil))
        //Afficher l'alerte
        self.present(alert, animated: true, completion: nil)
        
    }
   
}



class Foods {
    func all() -> [Food] {
        var foods: [Food] = []
        foods.append(Food(name: "Daurade",img: nil,shops: nil ))
        foods.append(Food(name: "Choux",img: nil,shops: nil ))
        foods.append(Food(name: "Poire",img: nil,shops: nil ))
        return foods
     }
}

//For custom Button
//        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
//                    //set image for button
//        let image =  UIImage(named: "add")
//        button.setImage(image, for: UIControl.State.normal)
//                    //add function for button
//        button.addTarget(self, action: #selector(addItem), for: UIControl.Event.touchUpInside)
//                    //set frame
//        button.frame = CGRect(x: 0, y: 0, width: image!.size.width, height:  image!.size.height)
//
//        let barButton = UIBarButtonItem(customView: button)
//        navigationItem.rightBarButtonItem = barButton
