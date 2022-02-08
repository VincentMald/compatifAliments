//
//  Shop.swift
//  comparatif aliments
//
//  Created by Vincent Maldonado on 08/02/2022.
//

import Foundation


class Shop {
    private var _name: String
    private var _price: Double
    private var _date: NSDate
    private var _weight: Double?
    //Penser à gerer les différents types
    private var _typeWeight: Int?
    private var _sales: Bool
    private var _priceWithSales: Double?
    
    init(name: String, price: Double, date: NSDate, weight: Double?, typeWeight: Int?, sales: Bool, priceWithSales: Double?) {
        _name = name
        _price = price
        _weight = weight
        _sales = sales
        _priceWithSales = priceWithSales
        _date = date
        _typeWeight = typeWeight
    }
    
    var name: String {
        return _name
    }
     
    var price: Double {
        return _price
    }
    
    var date: NSDate {
       return _date
    }
    
    var weight: Double? {
        return _weight
    }
    
    var typeWeight: Int? {
        return _typeWeight
    }
       
    var sales: Bool? {
        return _sales
    }
    
    var priceWithSales: Double? {
        return _priceWithSales
    }
        
    
}
