import UIKit

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
let myDouble: Double = 3.14343

myDouble.round(to: 2)
let myRoundedDouble: String = String(format: "%.1f", myDouble)
print(myRoundedDouble)
