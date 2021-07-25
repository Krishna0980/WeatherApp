//
//  ViewController.swift
//  WeatherApp
//
//  Created by Krishna Bhatt on 25/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let welcome:UILabel = {
          let labl = UILabel()
          labl.text = "Welcome to WeatherApp"
          labl.font = UIFont(name: "ArialRoundedMTBold", size: 29.0)
          labl.textAlignment = .center
          labl.textColor = .black
          return labl
      }()

      
      private let myImageView:UIImageView = {
          let imageView = UIImageView()
          imageView.contentMode = .scaleAspectFill
          imageView.clipsToBounds = true
          imageView.image = UIImage(named: "B3.jpg")
          return imageView
      }()
      
      
      private let login : UIButton = {
          let con = UIButton()
          
          con.setTitle("Go to Check Weather", for: .normal)
          con.addTarget(self, action: #selector(goto), for: .touchUpInside)
          // con.backgroundColor = .gray
          con.setTitleColor(.white, for: .normal)
          con.layer.cornerRadius = 25
          con.backgroundColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
          return con
          
          
      } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(welcome)
             view.addSubview(myImageView)
             view.addSubview(login)
             
             let bckimage = UIImageView(frame: UIScreen.main.bounds)
             bckimage.image = UIImage(named: "B1.jpg")
             bckimage.contentMode = UIView.ContentMode.scaleToFill
             self.view.insertSubview(bckimage, at: 0)
    }
    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           
           self.view.backgroundColor = .white
           welcome.frame = CGRect(x: 30, y:view.safeAreaInsets.top + 40,width: view.width - 60, height: 40)
           myImageView.frame = CGRect(x: 110, y:view.safeAreaInsets.top + 240, width: 200, height: 200)
           login.frame = CGRect(x: 30, y: myImageView.bottom + 60, width: view.width - 60, height: 40)
       }
       
       
       @objc func goto()
       {
           let vc = HomePage()
           navigationController?.pushViewController(vc, animated: true)
       }}
