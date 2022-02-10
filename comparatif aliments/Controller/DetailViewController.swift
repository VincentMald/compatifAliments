//
//  DetailViewController.swift
//  comparatif aliments
//
//  Created by Vincent Maldonado on 10/02/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var food: Food?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let foodOk = food else { return }
        navigationItem.title = foodOk.name
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(openAlert))
       
    }
    
    @objc func openAlert(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let alertVC = sb.instantiateViewController(identifier: "AlertViewController") as! AlertViewController
        alertVC.modalPresentationStyle = .overCurrentContext
        present(alertVC, animated: true, completion: nil)
    }
    
    
   
           
}
