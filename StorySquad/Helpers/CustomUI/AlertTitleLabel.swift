//
//  AlertTitleLabel.swift
//  StorySquad
//
//  Created by Norlan Tibanear on 6/4/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class AlertTitleLabel: UILabel {

   override init(frame: CGRect) {
       super.init(frame: frame)
       configure()
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   convenience init(text: String) {
       self.init(frame: .zero)
       self.text = text
//       self.font = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
   }
   
   private func configure() {
       textColor = UIColor.borderTwoColor
       adjustsFontSizeToFitWidth = true
       minimumScaleFactor = 0.8
       lineBreakMode = .byTruncatingTail
       
      font = UIFont(name: "Bangers", size: 40.0)
       textAlignment = .center
      
       translatesAutoresizingMaskIntoConstraints = false
   }

}// Class


