//
//  HomePage.swift
//  WeatherApp
//
//  Created by Krishna Bhatt on 25/07/21.
//

import UIKit

class HomePage: UIViewController {
    public var name = ""
       
       private let myImageView:UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFill
           imageView.clipsToBounds = true
           imageView.image = UIImage(named: "B3.jpg")
           return imageView
       }()
       
       
       private let weatherLbl:UILabel = {
           let labl = UILabel()
           labl.text = "Check The Weather"
           labl.font = UIFont(name: "ArialRoundedMTBold", size: 29.0)
           labl.textAlignment = .center
           labl.textColor = .black
           return labl
       }()
       
       private let cityTextField: UITextField = {
           let city = UITextField()
           
           city.textAlignment = .center
           city.autocapitalizationType = .none
           city.autocorrectionType = .no
           city.font = UIFont(name: "", size: 20.0)
           city.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
           city.attributedPlaceholder = NSAttributedString(string: "Enter The City", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
           city.layer.cornerRadius = 20
           return city
       } ()
       
       private let Searchbtn : UIButton = {
           let con = UIButton()
           
           con.setTitle("Search", for: .normal)
           con.addTarget(self, action: #selector(nextscreen), for: .touchUpInside)
           // con.backgroundColor = .gray
           con.setTitleColor(.white, for: .normal)
           con.layer.cornerRadius = 25
           con.backgroundColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
           return con
       } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
               title = "Weather"
               
               let bckimage = UIImageView(frame: UIScreen.main.bounds)
               bckimage.image = UIImage(named: "B1.jpg")
               bckimage.contentMode = UIView.ContentMode.scaleToFill
               self.view.insertSubview(bckimage, at: 0)
               
               
               view.addSubview(myImageView)
               view.addSubview(weatherLbl)
                view.addSubview(cityTextField)
                view.addSubview(Searchbtn)
               name = cityTextField.text!
    }
    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           
           myImageView.frame = CGRect(x: 110, y: additionalSafeAreaInsets.top + 150, width: 200, height: 200)
           weatherLbl.frame = CGRect(x: 40, y: myImageView.bottom + 20, width: view.width - 60, height: 60)
           cityTextField.frame = CGRect(x: 40, y: weatherLbl.bottom + 20, width: view.width - 50, height: 50)
           Searchbtn.frame = CGRect(x: 40, y: cityTextField.bottom + 20, width: view.width - 50, height: 50)
       }
       
       @objc func nextscreen(){
           
           UserDefaults.standard.set(cityTextField.text, forKey: "name")
           let vc = WeatherPage()
           navigationController?.pushViewController(vc, animated: true)
           
       }
       }
