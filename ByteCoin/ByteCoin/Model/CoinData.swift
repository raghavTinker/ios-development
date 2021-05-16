//
//  CoinData.swift
//  ByteCoin
//
//  Created by Raghav Sharma on 16/05/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Decodable{
    let rate: Double
    let asset_id_quote: String
}
