import Foundation
class Item: Codable {
    var dt: Float?
    var main: Main?
    var weather: [WeatherItem]?
    var dt_txt: String?
    var wind: Wind
}

class Main: Codable {
    var temp: Float?
    var feels_like: Float?
    var temp_min: Float?
    var temp_max: Float?
    var pressure: Float?
    var sea_level: Float?
    var grnd_level: Float?
    var humidity: Float?
    var temp_kf: Float?
   
}
class WeatherItem: Codable {
    var id: Float?
    var main: String?
    var description: String?
    var icon: String?

}

class Wind: Codable {
    var speed: Float?
    var deg: Float?
}
