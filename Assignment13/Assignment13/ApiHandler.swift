
import Foundation
class ApiHandler{
    
    static let shared = ApiHandler()

    func searchcity(with name:String) -> [CityDetails] { //Surat
            if let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=9ed7cfcb9dac424e929134511210707&q=\(name)&aqi=no"){
                do { let data = try Data(contentsOf: url)
                 
                    let decoder = JSONDecoder()
                    do{ let jsonWeather = try decoder.decode(CityDetails.self, from: data)
                        print(jsonWeather.current.condition.icon)
                        return  [jsonWeather]
                    }catch {
                        print(error)
                    }
                    
                } catch {
                    print("Error : Place name is incorrect !")
                }
            }
            return [CityDetails]()
        }
}
