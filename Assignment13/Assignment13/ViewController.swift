import UIKit

class ViewController: UIViewController {

        var DataArray = [CityDetails]()
        let SearchBar: UISearchBar = {
            let sb = UISearchBar()
            sb.placeholder = "Enter Place Name"
            sb.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            sb.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            return sb
        }()
        private let lbl1: UILabel = {
            let lbl = UILabel()
            lbl.text = "Location"
            lbl.font = UIFont(name: "arial", size: 28)
            lbl.textAlignment = .center
            return lbl
        }()
        
        private let lbl2: UILabel = {
            let lbl = UILabel()
            lbl.text = "DateTime"
            lbl.font = UIFont(name: "arial", size: 20)
            return lbl
        }()
        
        private let lbl3: UILabel = {
            let lbl = UILabel()
            lbl.text = "TimeZone"
            lbl.font = UIFont(name: "arial", size: 20)
            return lbl
        }()
        
        private let lbl4: UILabel = {
            let lbl = UILabel()
            lbl.text = "Temprature"
            lbl.font = UIFont(name: "arial", size: 26)
            lbl.textAlignment = .center
            return lbl
        }()
        
        private let lbl5: UILabel = {
            let lbl = UILabel()
            lbl.text = "rature"
            lbl.font = UIFont(name: "arial", size: 20)
            return lbl
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(SearchBar)
        SearchBar.delegate = self
        view.backgroundColor = .white
        view.addSubview(lbl1)
        view.addSubview(lbl2)
        view.addSubview(lbl3)
        view.addSubview(lbl4)
        view.addSubview(lbl5)
    }
    func showData(name:String){
        DataArray = ApiHandler.shared.searchcity(with: name)
            for i in DataArray {
                lbl1.text = "\(i.location.name),\(i.location.country)"
                lbl2.text = "DateTime \t \(i.location.localtime)"
                lbl3.text = "TimeZone \t \(i.location.tz_id)"

                lbl4.text = "\(i.current.temp_c) C | \(i.current.temp_f) F"
                lbl5.text = "Pressure \t \(i.current.pressure_mb) mb | \(i.current.pressure_in) in"
            }
        }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        SearchBar.frame = CGRect(x: 10, y: 30, width: view.width-20, height: 40)
        lbl1.frame = CGRect(x: 20, y: 100, width: view.width-40, height: 30)
        lbl2.frame = CGRect(x: 20, y: 150, width: view.width-40, height: 20)
        lbl3.frame = CGRect(x: 20, y: 190, width: view.width-40, height: 20)
        lbl4.frame = CGRect(x: 20, y: 240, width: view.width-40, height: 20)
        lbl5.frame = CGRect(x: 20, y: 280, width: view.width-40, height: 20)
    }
}
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        showData(name: searchBar.text!)
    }
}
