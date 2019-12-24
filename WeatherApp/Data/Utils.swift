import Foundation
class Utils {
    
    static func celsius ( _ temp:Float)->String{
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        let floatCelsius = (temp-273.15)
        let stringCelsius = "\(formatter.string(from: floatCelsius as NSNumber) ?? "") C˚"
        return stringCelsius
    }
    
}
