import UIKit

class ViewController: UIViewController {

        var DataArray = [CityDetails]()
        let SearchBar: UISearchBar = {
            let sb = UISearchBar()
            sb.placeholder = "Enter Place Name"
            sb.backgroundImage = UIImage()
            sb.searchTextField.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            sb.searchTextField.textColor = .white
            sb.setImage(UIImage(named: "seach"), for: .search, state: .normal)
            sb.searchTextPositionAdjustment = UIOffset(horizontal: 10, vertical: 0)
            sb.layer.borderWidth = 2
            sb.layer.cornerRadius = 25
            sb.layer.borderColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
            return sb
        }()
        private let lbl1: UILabel = {
            let lbl = UILabel()
            lbl.text = "Today's Report"
            lbl.textColor = .white
            lbl.font = .boldSystemFont(ofSize: 22)
            lbl.textAlignment = .left
            return lbl
        }()
        
    private let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "200")
        return iv
    }()
    
        private let lbl2: UILabel = {
            let lbl = UILabel()
            lbl.text = "Condition"
            lbl.textColor = .white
            lbl.textAlignment = .center
            lbl.font = UIFont(name: "arial", size: 20)
            return lbl
        }()
        
        private let lbl3: UILabel = {
            let lbl = UILabel()
            lbl.text = "00"
            lbl.textColor = .white
            lbl.textAlignment = .center
            lbl.font = .boldSystemFont(ofSize: 42)
            return lbl
        }()
        
    private let dotImg: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "dot")
        return iv
    }()
        private let lbl4: UILabel = {
            let lbl = UILabel()
            lbl.text = "Place name"
            lbl.textColor = .white
            lbl.textAlignment = .center
            lbl.font = .boldSystemFont(ofSize: 30)
            lbl.textAlignment = .center
            return lbl
        }()
        
    private let humiImg: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "humi")
        return iv
    }()
    private let humiVal: UILabel = {
        let lbl = UILabel()
        lbl.text = "30%"
        lbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "arial", size: 16)
        return lbl
    }()
    private let humiTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Humidity"
        lbl.textColor = #colorLiteral(red: 0.7490196078, green: 0.7529411765, blue: 0.7882352941, alpha: 1)
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "arial", size: 16)
        return lbl
    }()
    
    private let windVal: UILabel = {
        let lbl = UILabel()
        lbl.text = "11.5 km/h"
        lbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "arial", size: 16)
        return lbl
    }()
    private let windTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Wind speed"
        lbl.textColor = #colorLiteral(red: 0.7490196078, green: 0.7529411765, blue: 0.7882352941, alpha: 1)
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "arial", size: 16)
        return lbl
    }()
    private let windImg: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "wind")
        return iv
    }()
    private let cloudImg: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "cloud")
        return iv
    }()
    private let cloudVal: UILabel = {
        let lbl = UILabel()
        lbl.text = "10%"
        lbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "arial", size: 16)
        return lbl
    }()
    private let cloudTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Cloud"
        lbl.textColor = #colorLiteral(red: 0.7490196078, green: 0.7529411765, blue: 0.7882352941, alpha: 1)
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "arial", size: 16)
        return lbl
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(SearchBar)
        SearchBar.delegate = self
        view.backgroundColor = UIColor(patternImage: UIImage(named: "wbg")!)
        view.addSubview(lbl1)
        view.addSubview(myImageView)
        view.addSubview(lbl2)
        view.addSubview(lbl3)
        view.addSubview(dotImg)
        view.addSubview(lbl4)
        view.addSubview(humiImg)
        view.addSubview(humiVal)
        view.addSubview(humiTitle)
        view.addSubview(windImg)
        view.addSubview(windVal)
        view.addSubview(windTitle)
        view.addSubview(cloudImg)
        view.addSubview(cloudVal)
        view.addSubview(cloudTitle)
    }
    func showData(name:String){
        DataArray = ApiHandler.shared.searchcity(with: name)
        let r1 = [1006,1135,1147,1009]
        let r2 = [1063,1180,1186,1192,1240,1243,1246]
        let r3 = [1069,1204,1207,1249,1252]
        let r4 = [1072,1150,1153,1168,1171,1183,1189,1195,1198,1201]
        let r5 = [1114,1117,1213,1219,1225,1237]
        let r6 = [1210,1219,1222,1255,1258,1261,1264]
        let r7 = [1279,1282,1276]
            for i in DataArray {
                
                
                //lbl1.text = "\(i.location.name),\(i.location.country)"
         
                //lbl4.text = "\(i.current.temp_c) C"
                // condition img
                if (i.current.condition.code == 1000){
                    myImageView.image = UIImage(named: "113")
                }else if (i.current.condition.code == 1003){
                    myImageView.image = UIImage(named: "116")
                }else if (r1.contains(i.current.condition.code)){
                    myImageView.image = UIImage(named: "119")
                }else if (i.current.condition.code == 1030){
                    myImageView.image = UIImage(named: "143")
                }else if (r2.contains(i.current.condition.code)){
                    myImageView.image = UIImage(named: "176")
                }else if (i.current.condition.code == 1066){
                    myImageView.image = UIImage(named: "179")
                }else if (r3.contains(i.current.condition.code)){
                    myImageView.image = UIImage(named: "182")
                }else if (r4.contains(i.current.condition.code)){
                    myImageView.image = UIImage(named: "185")
                }else if (i.current.condition.code == 1087){
                    myImageView.image = UIImage(named: "200")
                }else if (r5.contains(i.current.condition.code)){
                    myImageView.image = UIImage(named: "227")
                }else if (r6.contains(i.current.condition.code)){
                    myImageView.image = UIImage(named: "323")
                }else if (r7.contains(i.current.condition.code)){
                    myImageView.image = UIImage(named: "392")
                }
                //condition text
                lbl2.text = "It’s \(i.current.condition.text)"
                lbl3.text =  "\(Int(i.current.temp_c))"
                if(i.location.name == "Dubai")
                {
                    lbl4.text = "\(i.location.name), UAE"
                }else{
                    lbl4.text = "\(i.location.name), \(i.location.country)"
                }
                
                windVal.text = "\(i.current.wind_kph) km/h"
                humiVal.text = "\(i.current.humidity)%"
                cloudVal.text = "\(i.current.cloud)%"
            }
            
        }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        SearchBar.frame = CGRect(x: 20, y: 30, width: view.width-40, height: 50)
        lbl1.frame = CGRect(x: 20, y: 100, width: view.width-40, height: 30)
        myImageView.frame = CGRect(x: (view.width - 183.1 )/2, y: 160, width: 183.1, height: 200)
        lbl2.frame = CGRect(x: 0, y: myImageView.bottom + 25, width: view.width, height: 22)
        lbl3.frame = CGRect(x: 0, y: lbl2.bottom + 30, width: view.width, height: 42)
        dotImg.frame = CGRect(x: (view.width + 45)/2  , y: lbl2.bottom + 20, width: 12, height: 14)
        lbl4.frame = CGRect(x: 0, y: lbl3.bottom + 15, width: view.width, height: 30)
        humiImg.frame = CGRect(x: (view.width - 45)/2, y: lbl4.bottom + 30, width: 45, height: 39.4)
        humiVal.frame = CGRect(x: 0, y: humiImg.bottom + 5, width: view.width, height: 20)
        humiTitle.frame = CGRect(x: 0, y: humiImg.bottom + 30, width: view.width, height: 20)
        
        windImg.frame = CGRect(x: humiImg.left - 110, y: lbl4.bottom + 30, width: 45, height: 39.4)
        windVal.frame = CGRect(x: 22, y: humiImg.bottom + 5, width:100, height: 20)
        windTitle.frame = CGRect(x: humiImg.left - 135, y: humiImg.bottom + 30, width: view.width, height: 20)
        cloudImg.frame = CGRect(x: humiImg.right + 75, y: lbl4.bottom + 30, width: 45, height: 39.4)
        cloudVal.frame = CGRect(x: view.right - 120, y: humiImg.bottom + 5, width:100, height: 20)
        cloudTitle.frame = CGRect(x: humiImg.left + 118, y: humiImg.bottom + 30, width: view.width, height: 20)
        
    }
}
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        showData(name: searchBar.text!)
    }
}
