//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var bitcoinLabel: UILabel!
    
    var coinManager = CoinManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        coinManager.delegate = self
    }
}

//MARK: - UIPickerView
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //Number of columns
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //This will return the string/title of the picker option
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //Here when the row is selected this will be called
        let currency: String = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: currency)
    }
    
}

//MARK: - CoinManager
extension ViewController: CoinManagerDelegate{
    func didUpdateCoinPrice(_ coinManager: CoinManager, coinData: CoinModel) {
        DispatchQueue.main.async{
            self.bitcoinLabel.text = coinData.priceStr
            self.currencyLabel.text = coinData.currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
