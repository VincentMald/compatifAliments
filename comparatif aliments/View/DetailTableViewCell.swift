//
//  DetailTableViewCell.swift
//  comparatif aliments
//
//  Created by Vincent Maldonado on 14/02/2022.
//

import UIKit

class DetailTableViewCell: UITableViewCell{
    
    var shop: Shop? {
        didSet{
            foodNameLabel.text = shop?.alimentName.capitalized
            shopNameLabel.text = shop?.shopName.capitalized
            priceLabel.text =  "\(shop?.price ?? 0)€"
            weightLabel.text = "\(shop?.weight ?? 0)kg"
        }
    }
    
    //Programmatically Design
    private let foodNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    private let shopNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.italicSystemFont(ofSize: 16)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.italicSystemFont(ofSize: 16)
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.italicSystemFont(ofSize: 16)
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 8, bottom: 8, right: 8))
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        //Border
        let layer = contentView.layer
        layer.masksToBounds = true
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        
        //Subview
        addSubview(foodNameLabel)
        addSubview(shopNameLabel)
        addSubview(priceLabel)
        addSubview(weightLabel)
        
        //FOODNAME + SHOPNAME
        let stackView = UIStackView(arrangedSubviews: [foodNameLabel,shopNameLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: frame.size.width , height: 0, enableInsets: false)
        
        //PRICE + WEIGHT
        let stackViewPriceWeight = UIStackView(arrangedSubviews: [priceLabel,weightLabel])
        stackViewPriceWeight.axis = .vertical
        stackViewPriceWeight.spacing = 2
        addSubview(stackViewPriceWeight)
        stackViewPriceWeight.anchor(top: topAnchor, left: stackView.rightAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
