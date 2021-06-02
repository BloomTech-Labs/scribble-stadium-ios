//
//  MissionVC.swift
//  Story Squad
//
//  Created by Norlan Tibanear on 5/15/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import UIKit

class MissionVC: UIViewController {
   
   // Outlets
   let backView = UIView()
   
   let missionImage: UIImageView = {
      let image = UIImageView()
      image.image = UIImage(named: "LetsPlayImage")
      image.contentMode = .scaleAspectFill
      image.layer.borderColor = UIColor.borderTwoColor?.cgColor
      image.layer.borderWidth = 7
      return image
   }()
   
   let missionButton: UIButton = {
      let button = UIButton()
      button.setTitle(" Let's play! ", for: .normal)
      button.titleLabel?.textAlignment = NSTextAlignment.center
      button.setTitleColor(UIColor.tabbarColor, for: .normal)
      button.titleLabel?.font =  UIFont(name: "Atma", size: 32)
      button.addTarget(self, action: #selector(handleMissionButton), for: .touchUpInside)
      button.backgroundColor = UIColor.aquaColor
      return button
   }()
   

   


    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = UIColor.tabbarColor
      navigationItem.title = "Mission"
      self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Bangers", size: 20)!]
      
      
      configureUI()
    }//
   
   

   
   
   @objc func handleMissionButton() {
      let rootVC = ReadVC()
      navigationController?.pushViewController(rootVC, animated: true)
   }//
   
   
   

   func configureUI() {
      view.addSubviewsUsingAutolayout(backView)
      setupBackView()
   }//
   
   func setupBackView() {
      backView.addSubviewsUsingAutolayout(missionImage, missionButton)
      backView.anchor(
         top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor
      )
      backView.backgroundColor = UIColor.tabbarColor
      
      missionImage.anchor(
         top: backView.topAnchor, leading: backView.leadingAnchor, trailing: backView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0)
      )

      
      missionButton.anchor(
         top: missionImage.bottomAnchor, leading: backView.leadingAnchor, trailing: backView.trailingAnchor, bottom: backView.bottomAnchor, padding: .init(top: 20, left: 50, bottom: -20, right: -50), size: .init(width: backView.frame.width, height: 60)
      )
      missionButton.layer.cornerRadius = 10
      missionButton.clipsToBounds = true
      
   }// setup
   
   
   override var preferredStatusBarStyle: UIStatusBarStyle {
      return .default
   }


}// Class
