//
//  IntroLabel.swift
//  StorySquad
//
//  Created by Norlan Tibanear on 6/4/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class AlertIntroLabel: UILabel {

   override init(frame: CGRect) {
       super.init(frame: frame)
       configure()
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   convenience init(text: String, numberOfLines: Int) {
       self.init(frame: .zero)
       self.text = text
       self.numberOfLines = numberOfLines
   }
   
   private func configure() {
       textColor = UIColor.tabbarColor
       adjustsFontSizeToFitWidth = true
       minimumScaleFactor = 0.8
       lineBreakMode = .byTruncatingTail
      
       font = UIFont(name: "Atma", size: 18.0)
       textAlignment = .center
      
       translatesAutoresizingMaskIntoConstraints = false
   }

}// Class
