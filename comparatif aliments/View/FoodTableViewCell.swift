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
   

    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 8, bottom: 8, right: 8))
    }
    
    
    
    
    func setupCell(_ food: Food){
        self.food = food
        nameLabel.text = self.food.name.capitalized
        if (food.img != nil) {
            foodImage.image = self.food.img
        } else  {
            foodImage.image = UIImage(named: "foods")
        }
        foodImage.contentMode =  .scaleAspectFill
        let layer = containerView.layer
        layer.masksToBounds = true
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
      
       
    }

}

