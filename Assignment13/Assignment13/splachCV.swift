
import UIKit

class splachCV: UIViewController {

    private let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "Splash")
        return iv
    }()
    private let myButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Get Started", for: .normal)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        btn.backgroundColor = .white
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 25
        return btn
    }()
    @objc func btnClick()
    {
            print("click")
            let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewDidLoad()
        view.addSubview(myImageView)
        view.addSubview(myButton)
        view.bringSubviewToFront(myButton)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myImageView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        myButton.frame = CGRect(x: 30, y: 560, width: view.width - 60, height: 50)
        
    }
}
