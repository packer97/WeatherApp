import Foundation

class FiveDayWeather: Codable {
    var cod: String?
    var message:Float?
    var cnt:Float?
    var list: [Item]?
}
