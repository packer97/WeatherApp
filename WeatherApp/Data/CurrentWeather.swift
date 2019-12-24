import Foundation
class CurrentWeather: Codable {
    var coord: Coordinates?
    var weather: [WeatherItem]?
    var main: Main?
    var name: String?
    var wind: Wind?
    
}
class Coordinates: Codable{
    var lon: Float?
    var lat: Float?
   
}
