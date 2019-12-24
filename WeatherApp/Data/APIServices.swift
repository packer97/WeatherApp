import Foundation
import Alamofire

enum Domain {
    case domainCurrentWeather
    case domainForecast

    var address: String {
        switch self {
        case .domainCurrentWeather:
            return "https://api.openweathermap.org/data/2.5/weather?"
        case .domainForecast:
            return "https://api.openweathermap.org/data/2.5/forecast?"
        }
    }
}

final public class APIServices {
    
    public static let shared = APIServices()
    
    private(set) var domain = "api.openweathermap.org"
    public static let eventMethod = "/data/2.5/forecast?"

    func getObject<T:Decodable>(
        cityName: String,
        domain: Domain,
        handler: @escaping (_ object: T?, _ error: Error?) -> Void) {
        let keyAPI = "e240c706ae407e100c96fc7da7ad476f"
        let  parsingMode = "json"
        let cityNameWithoutSpaces = cityName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let resultURL = "\(domain.address)q=\(cityNameWithoutSpaces!)&mode=\(parsingMode)&APPID=\(keyAPI)"
        print("\(resultURL)")
        request(resultURL).responseData(){ response in
                response.result.withValue { data in
                    do {
                        let result = try  JSONDecoder.init().decode(T.self, from: data)

                        handler(result, nil)
                    } catch (let error) {
                        handler(nil, error)
                    }
                }.withError { error in
                    handler(nil, error)
                }
            }
    }
}
