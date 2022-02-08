//
//  Aliment.swift
//  comparatif aliments
//
//  Created by Vincent Maldonado on 08/02/2022.
//

import UIKit

class Food {
    private var _name: String
    private var _img: UIImage?
    private var _shops: [Shop]?
    
    init(name: String, img: UIImage?,shops: [Shop]? ){
    _name = name
    _img = img
    _shops = shops
    }
    
    
    var name: String {
        return _name
    }
    
    var img: UIImage? {
        return _img
    }
    
    var shops: [Shop]? {
        return _shops
    }
    
    
    
}
