//
//  IconTitleLabel.swift
//  StorySquad
//
//  Created by Norlan Tibanear on 6/4/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class IconTitleLabel: UILabel {

   override init(frame: CGRect) {
       super.init(frame: frame)
       configure()
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   convenience init(text: String, textColor: UIColor) {
       self.init(frame: .zero)
       self.text = text
       self.textColor = textColor
   }
   
   private func configure() {
       adjustsFontSizeToFitWidth = true
       minimumScaleFactor = 0.8
       lineBreakMode = .byTruncatingTail
      
       textAlignment = .center
       font = UIFont(name: "Atma", size: 22.0)
       
       translatesAutoresizingMaskIntoConstraints = false
   }

}//
