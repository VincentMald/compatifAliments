//
//  DetailViewController.swift
//  comparatif aliments
//
//  Created by Vincent Maldonado on 10/02/2022.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var detailTableView: UITableView!
    
    var food: Food?
    var shops: [Shop]?
    override func viewDidLoad() {
        super.viewDidLoad()
        buildTableView()
        detailTableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "shopCell")
        guard let foodOk = food else { return }
        navigationItem.title = foodOk.name
        shops = foodOk.shops
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(openAlert))
    }
    
    
    
    

    func buildTableView(){
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        detailTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        detailTableView.dataSource = self
        detailTableView.delegate = self
        detailTableView.separatorStyle = .none
        detailTableView.register(UITableViewCell.self, forCellReuseIdentifier: "shopCell")
        view.addSubview(detailTableView)
    }
    
    @objc func openAlert(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let alertVC = sb.instantiateViewController(identifier: "AlertViewController") as! AlertViewController
        alertVC.modalPresentationStyle = .overCurrentContext
        alertVC.food = food
        alertVC.completion = {(test) in
            self.reloadData(shopAdd: test)
         }
        present(alertVC, animated: true, completion: nil)
    }
    
    func reloadData(shopAdd: Shop){
        shops?.append(shopAdd)
        detailTableView.reloadData()
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shops!.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let shop = shops![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopCell", for: indexPath as IndexPath) as! DetailTableViewCell
        cell.shop = shop
        cell.selectionStyle = .none
        
        return cell
       
    }
    
}
