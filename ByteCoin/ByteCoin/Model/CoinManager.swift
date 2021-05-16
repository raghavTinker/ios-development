//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate{
    func didUpdateCoinPrice(_ coinManager: CoinManager, coinData: CoinModel)
    func didFailWithError(error: Error)
}
struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "0F76653A-369E-46C8-9634-5AD4CB31D95A"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String){
        let urlString: String = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        /*
         a)create url
         b)create urlsession
         c)URlsession task
         d)resume task
         */
        
        if let url = URL(string: urlString){
            //url created
            //URLSEssion create
            let session = URLSession(configuration: .default)
            
            //task create
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data{
                    //parseJSONData
                    if let coinModel = parseJSONData(coinData: safeData){
                        self.delegate?.didUpdateCoinPrice(self, coinData: coinModel)
                    }
                }
            }
            //task resume
            task.resume()
        }
    }
    
    func parseJSONData(coinData: Data) -> CoinModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let exchangePrice = decodedData.rate
            let currency = decodedData.asset_id_quote
            
            let coinModel = CoinModel(price: exchangePrice, of: currency)
            return coinModel
        }
        
        catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
