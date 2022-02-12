//
//  DetailViewController.swift
//  comparatif aliments
//
//  Created by Vincent Maldonado on 10/02/2022.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    var tableView: UITableView!
    
    var food: Food?
    var shops: [Shop]?
    override func viewDidLoad() {
        super.viewDidLoad()
        buildTableView()
        
        guard let foodOk = food else { return }
        navigationItem.title = foodOk.name
        shops = foodOk.shops
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(openAlert))
        
        
        
    }
    
    func buildTableView(){
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "shopCell")
        view.addSubview(tableView)
    }
    
    @objc func openAlert(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let alertVC = sb.instantiateViewController(identifier: "AlertViewController") as! AlertViewController
        alertVC.modalPresentationStyle = .overCurrentContext
        alertVC.food = food
        present(alertVC, animated: true, completion: nil)
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(shops!.count)
        return shops!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let shop = shops![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "OUAIS OUAS"
        return cell
    }
    
}
