//
//  WriteSubmitCollectionViewCell.swift
//  StorySquad
//
//  Created by Norlan Tibanear on 6/4/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class WriteSubmitCollectionViewCell: UICollectionViewCell {
   
   // Outlets
   fileprivate let bg: UIImageView = {
      let image = UIImageView()
      image.contentMode = .scaleAspectFill
      image.layer.cornerRadius = 12
      image.clipsToBounds = true
      image.backgroundColor = .systemPurple
      image.translatesAutoresizingMaskIntoConstraints = false
      return image
   }()
   
   var scanImage: UIImage? {
      didSet {
         updateView()
      }
   }
   
   func updateView() {
      bg.image = scanImage
   }
   
   
   override init(frame: CGRect) {
      super.init(frame: frame)
   
      addSubview(bg)
      configureCell()
      
      updateView()
   }//
   
   func configureCell() {
      bg.anchor(
         top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: contentView.bottomAnchor
      )
      
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   
}//
