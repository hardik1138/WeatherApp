
import Foundation
class CityDetails:Decodable{
    var location: Weather
    var current: Current
}
class Weather:Decodable
{
    var name = ""
    var region = ""
    var country = ""

}

class Current:Decodable{
    var is_day:Int
    var temp_c:Float
    var condition: Condition
    var wind_kph:Float
    var humidity:Int
    var cloud:Int
}

class Condition:Decodable
{
    var text = ""
    var code:Int
}
