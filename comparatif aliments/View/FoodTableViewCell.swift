//
//  FoodTableViewCell.swift
//  comparatif aliments
//
//  Created by Vincent Maldonado on 08/02/2022.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imagePickerButton: UIButton!
    
    var food: Food!
   
    
    @IBAction func imagePickerButton(_ sender: Any) {
       
       
    }
    
    
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    func setupCell(_ food: Food){
        self.food = food
        nameLabel.text = self.food.name
        if (food.img != nil) {
            foodImage.image = self.food.img
        } else  {
            foodImage.image = UIImage(named: "foods")
        }
        foodImage.contentMode =  .scaleAspectFill
       
    }

}
