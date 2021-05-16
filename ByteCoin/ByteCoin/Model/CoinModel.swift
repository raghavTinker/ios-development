//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Raghav Sharma on 16/05/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel{
    let price: Double
    let currency: String
    var priceStr: String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let str = numberFormatter.string(from: NSNumber(value: price.round(to: 2)))
        return str ?? "0.00"
    }
    
    init(price: Double, of currency: String){
        self.price = price
        self.currency = currency
    }
}

extension Double{
    func round(to places: Int) -> Double{
        let precisionNumber = pow(10, Double(places))
        var n = self
        n = n * precisionNumber
        n.round()
        n = n / precisionNumber
        return n
    }
}
