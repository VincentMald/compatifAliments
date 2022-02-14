//
//  FoodsTableViewController.swift
//  comparatif aliments
//
//  Created by Vincent Maldonado on 08/02/2022.
//

protocol ImagePickerDelegate {
    func pickImage()
}


import UIKit

class FoodsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    

    var foods: [Food] = []
    var filteredFoods: [Food] = []
    var indexImage: Int?
    
 
    
    
    @IBOutlet weak var searchBarFood: UISearchBar!
    @IBOutlet weak var foodTableView: UITableView!
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodTableView.delegate = self
        foodTableView.dataSource = self
        searchBarFood.delegate = self
        foodTableView.separatorStyle = .none
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addItem))
        navigationItem.title = "Mes Aliments"
        
        
        foods = Foods().all()
        filteredFoods = foods
    }
    

    @objc func pickImage(_ sender: UIButton) {
        indexImage = sender.tag
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let cell: FoodTableViewCell = foodTableView.cellForRow(at: IndexPath(row: self.indexImage ?? 0, section: 0)) as! FoodTableViewCell
            cell.foodImage.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredFoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let food = filteredFoods[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "foodId", for: indexPath) as? FoodTableViewCell {
            cell.setupCell(food)
            cell.selectionStyle = .none
            cell.imagePickerButton.tag = indexPath.row
            cell.imagePickerButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
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
                print(editingStyle)
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // this will turn on `masksToBounds` just before showing the cell
        cell.contentView.layer.masksToBounds = true
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
        foods.append(Food(name: "Poire",img: nil,shops: [Shop(alimentName: "Poire Williams", shopName: "Carrefour Labege", price: 12.3, date: Date(), weight: 12.0, typeWeight: 0, sales: false, priceWithSales: nil)] ))
        return foods
     }
}
