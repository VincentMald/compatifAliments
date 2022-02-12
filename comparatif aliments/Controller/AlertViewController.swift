//
//  AlertViewController.swift
//  comparatif aliments
//
//  Created by Vincent Maldonado on 10/02/2022.
//



import UIKit

extension String {
func toDouble() -> Double? {
    return NumberFormatter().number(from: self)?.doubleValue
 }
}



class AlertViewController: UIViewController, UITextFieldDelegate {
    
    var food: Food?
    
    
    @IBOutlet weak var articleTF: UITextField!
    @IBOutlet weak var magasinTF: UITextField!
    @IBOutlet weak var prixTF: UITextField!
    @IBOutlet weak var poidsTF: UITextField!
    
    
    //Bottom buttons
    @IBAction func CancelAlert(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func AddAlert(_ sender: Any) {
        if !articleTF.text!.trimmingCharacters(in: .whitespaces).isEmpty && !magasinTF.text!.trimmingCharacters(in: .whitespaces).isEmpty && !prixTF.text!.trimmingCharacters(in: .whitespaces).isEmpty && !poidsTF.text!.trimmingCharacters(in: .whitespaces).isEmpty  {
           
            if(food != nil){
                let shopAlert: Shop = Shop(alimentName: articleTF.text!, shopName: magasinTF.text!, price: prixTF.text!.toDouble()!, date: Date(), weight: poidsTF.text!.toDouble()!, typeWeight: 0, sales: false, priceWithSales: 12)
                food!.addShop(shopToAdd: shopAlert)
            }
        } else {
            //gerer les messages d'erreurs
        }
    }
    
    @IBAction func articleTextField(_ sender: Any) {
    }
    @IBAction func magasinTextField(_ sender: Any) {
    }
    @IBAction func prixTextField(_ sender: Any) {
    }
    @IBAction func poidsTextField(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.magasinTF.delegate = self
        self.articleTF.delegate = self
        self.prixTF.delegate = self
        self.poidsTF.delegate = self
        
        //Disable keyboard when click on view
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //longueur du text dans chaque TF
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == magasinTF || textField == articleTF  {
            if range.location > 15 {
                return false
            }
        } else if(textField == prixTF){
            if range.location > 5 {
                return false
            }
        } else {
            if range.location > 6 {
                return false
            }
        }
        return true
    }
    
    //Envoie sur le prochain textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switchBasedNextTextField(textField)
        return true
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.articleTF:
            self.magasinTF.becomeFirstResponder()
        case self.magasinTF:
            self.prixTF.becomeFirstResponder()
        case self.prixTF:
            self.poidsTF.becomeFirstResponder()
        default:
            self.poidsTF.resignFirstResponder()
        }
    }
    
    

}
