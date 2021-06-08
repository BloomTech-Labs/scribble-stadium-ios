//
//  ActionButton.swift
//  StorySquad
//
//  Created by Norlan Tibanear on 6/4/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class ActionButton: UIButton {

   override init(frame: CGRect) {
       super.init(frame: frame)
       configure()
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   convenience init(title: String) {
       self.init(frame: .zero)
       self.setTitle(title, for: .normal)
   }
   
   private func configure() {
       layer.cornerRadius = 10
       layer.borderWidth = 3
       layer.borderColor = UIColor.borderTwoColor?.cgColor
      
       titleLabel?.font = UIFont(name: "Atma-Medium", size: 20.0)
       setTitleColor(UIColor.tabbarColor, for: .normal)
      
      backgroundColor = UIColor.aquaColor
      
       contentEdgeInsets = UIEdgeInsets(top: 5, left: 30, bottom: 5, right: 30)
      
       translatesAutoresizingMaskIntoConstraints = false
   }
   
   func set(title: String) {
       setTitle(title, for: .normal)
   }

}// Class

//let button = UIButton()
//button.setTitleColor(.gray, for: .normal)
//button.setTitle("I'm awesome, I'm done reading!", for: .normal)
//button.titleLabel?.font =  UIFont(name: "Bangers", size: 20.0)
//button.backgroundColor = UIColor.aquaColor
//button.translatesAutoresizingMaskIntoConstraints = false
//button.addTarget(self, action: #selector(handleAwesomeButton), for: .touchUpInside)
