//
//  Shop.swift
//  comparatif aliments
//
//  Created by Vincent Maldonado on 08/02/2022.
//

import Foundation


class Shop {
    private var _alimentName: String
    private var _shopName: String
    private var _price: Double
    private var _date: Date
    private var _weight: Double?
    //Penser à gerer les différents types
    private var _typeWeight: Int?
    private var _sales: Bool
    private var _priceWithSales: Double?
    
    init(alimentName: String,shopName: String, price: Double, date: Date, weight: Double?, typeWeight: Int?, sales: Bool, priceWithSales: Double?) {
        _alimentName = alimentName
        _shopName = shopName
        _price = price
        _weight = weight
        _sales = sales
        _priceWithSales = priceWithSales
        _date = date
        _typeWeight = typeWeight
    }
    
    var alimentName: String {
        return _alimentName
    }
    
    var shopName: String {
        return _shopName
    }
     
    var price: Double {
        return _price
    }
    
    var date: Date {
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
