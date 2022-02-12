//
//  AlertAddShopView.swift
//  comparatif aliments
//
//  Created by Vincent Maldonado on 11/02/2022.
//

import UIKit

class AlertAddShopView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
      }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
      }
    
    private func setupView() {
        //layer.borderWidth = 1
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 3
        
      }

}
