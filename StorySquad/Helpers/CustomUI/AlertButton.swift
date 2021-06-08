//
//  AlertButton.swift
//  StorySquad
//
//  Created by Norlan Tibanear on 6/4/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class AlertButton: UIButton {

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
      
       titleLabel?.font = UIFont(name: "Bangers", size: 20.0)
       setTitleColor(UIColor.tabbarColor, for: .normal)
      
      backgroundColor = UIColor.white
      
       contentEdgeInsets = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
      
       translatesAutoresizingMaskIntoConstraints = false
   }
   
   func set(title: String) {
       setTitle(title, for: .normal)
   }

}// Class


