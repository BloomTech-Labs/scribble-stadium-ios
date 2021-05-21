//
//  WriteVC.swift
//  StorySquad
//
//  Created by Norlan Tibanear on 5/20/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class WriteVC: UIViewController {
   
   
   // Views
   let backView = UIView()
   let topView = UIView()
   let middleView = UIView()
   let lineView = UIView()
   let bottomView = UIView()
   
   
   // Top View
   let titleLabel: UILabel = {
      let title = UILabel()
      title.textColor = .white
      title.text = " YOUR MISSION "
      title.font = UIFont(name: "Bangers", size: 40.0)
      title.translatesAutoresizingMaskIntoConstraints = false
      return title
   }()
   
   // Middle View
   
   lazy var titleStackView: UIStackView = {
      let stackView = UIStackView()
      stackView.distribution = .equalSpacing
      stackView.spacing = 15
      stackView.axis = .horizontal
      return stackView
   }()
   
   let iconLeftView = UIView()
   let iconMiddleView = UIView()
   let iconRightView = UIView()
   
   let iconLeft = UIView()
   let iconMiddle = UIView()
   let iconRight = UIView()
   
   let iconOne: UILabel = {
      let label = UILabel()
      label.textColor = UIColor.tabbarColor
      label.text = "1"
      label.font = UIFont(name: "Atma", size: 22.0)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   let iconTwo: UILabel = {
      let label = UILabel()
      label.textColor = UIColor.tabbarColor
      label.text = "2"
      label.font = UIFont(name: "Atma", size: 22.0)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   let iconthree: UILabel = {
      let label = UILabel()
      label.textColor = UIColor.tabbarColor
      label.text = "3"
      label.font = UIFont(name: "Atma", size: 22.0)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   let readLabel: UILabel = {
      let label = UILabel()
      label.textColor = UIColor.whiteDarkColor
      label.text = "Read"
      label.font = UIFont(name: "Atma", size: 22.0)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   
   let drawLabel: UILabel = {
      let label = UILabel()
      label.textColor = UIColor.whiteDarkColor
      label.text = "Draw"
      label.font = UIFont(name: "Atma", size: 22.0)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   let writeLabel: UILabel = {
      let label = UILabel()
      label.textColor = UIColor.white
      label.text = "Write"
      label.font = UIFont(name: "Atma", size: 22.0)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   
   
   // Bottom View
   
   let pencilLabel: UILabel = {
      let label = UILabel()
      label.textColor = .white
      label.text = " PENCILS READY! "
      label.font = UIFont(name: "Bangers", size: 40.0)
      label.textAlignment = NSTextAlignment.center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   let favoriteLabel: UILabel = {
      let label = UILabel()
      label.textColor = .white
      label.text = "Write a story about a sidekick doing \nsomething completely out of character, and \neveryone must figure out why. After you're \ndone, take a picture and upload it."
      label.font = UIFont(name: "Atma", size: 18.0)
      label.textAlignment = NSTextAlignment.center
      label.numberOfLines = 4
      return label
   }()
   
   let drawImageIcon: UIImageView = {
      let image = UIImageView()
      image.image = UIImage(named: "UploadStoryImage")
      image.contentMode = .scaleAspectFill
      return image
   }()
   
   let uploadStoryButton: UIButton = {
      let button = UIButton()
      button.setTitleColor(.gray, for: .normal)
      button.setTitle(" Upload your story ", for: .normal)
      button.titleLabel?.font =  UIFont(name: "Bangers", size: 20.0)
      button.backgroundColor = UIColor.aquaColor
//      button.addTarget(self, action: #selector(handlePhotoLibraryButton), for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
   }()
   

   
//MARK: App Circle
   
   

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = UIColor.tabbarColor
      navigationItem.title = "Read"
      self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Bangers", size: 20)!]
        
      configureUI()
        
    }
   
   override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       self.tabBarController?.tabBar.isHidden = true
//       self.hidesBottomBarWhenPushed = true
   }//
    

   
//MARK: UI Layout
      
      func configureUI() {
         view.addSubviewsUsingAutolayout(backView)
         setupBackView()
      }//
      
      func setupBackView() {
         backView.addSubviewsUsingAutolayout(topView, middleView, lineView, bottomView)
         backView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor
         )
         backView.backgroundColor = UIColor.tabbarColor
         
         
         // Top View
         topView.addSubviewsUsingAutolayout(titleLabel)
         topView.anchor(
            top: backView.topAnchor, leading: backView.leadingAnchor, trailing: backView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: backView.frame.width, height: 80)
         )
         topView.backgroundColor = UIColor.tabbarColor
         
         titleLabel.anchor(
            top: topView.topAnchor, bottom: topView.bottomAnchor, centerX: topView.centerXAnchor, centerY: topView.centerYAnchor, padding: .init(top: 15, left: 20, bottom: -15, right: -20)
         )
         
         
         // Middle View
         middleView.addSubviewsUsingAutolayout(titleStackView)
         middleView.anchor(
            top: topView.bottomAnchor, leading: backView.leadingAnchor, trailing: backView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: backView.frame.width, height: 120)
         )
         middleView.backgroundColor = UIColor.tabbarColor
         
         
         lineView.anchor(
            top: middleView.bottomAnchor, leading: backView.leadingAnchor, trailing: backView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: UIScreen.main.bounds.width, height: 3)
         )
         lineView.backgroundColor = UIColor.darkGray
         
         titleStackView.addArrangedSubview(iconLeftView)
         titleStackView.addArrangedSubview(iconMiddleView)
         titleStackView.addArrangedSubview(iconRightView)
         titleStackView.anchor(
            top: middleView.topAnchor, leading: middleView.leadingAnchor, trailing: middleView.trailingAnchor, bottom: middleView.bottomAnchor, padding: .init(top: 10, left: 40, bottom: -10, right: -40)
         )
         
         iconLeftView.addSubviewsUsingAutolayout(iconLeft, readLabel)
         iconLeftView.anchor(
            size: .init(width: 100, height: 100)
         )
         iconLeftView.backgroundColor = UIColor.tabbarColor
         
         readLabel.anchor(
            top: iconLeft.bottomAnchor, centerX: iconLeft.centerXAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0)
         )
         
         iconLeft.addSubviewsUsingAutolayout(iconOne)
         iconLeft.anchor(
            top: iconLeftView.topAnchor, centerX: iconLeftView.centerXAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 40, height: 40)
         )
         iconLeft.layer.cornerRadius = 20
         iconLeft.clipsToBounds = true
          iconLeft.backgroundColor = UIColor.secondLimeGreenColor
         iconOne.anchor(
            centerX: iconLeft.centerXAnchor, centerY: iconLeft.centerYAnchor
         )
         
         iconMiddleView.addSubviewsUsingAutolayout(iconMiddle, drawLabel)
         iconMiddleView.anchor(
            size: .init(width: 100, height: 100)
         )
         iconMiddleView.backgroundColor = UIColor.tabbarColor
         
         drawLabel.anchor(
            top: iconMiddle.bottomAnchor, centerX: iconMiddle.centerXAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0)
         )
         
         iconMiddle.addSubviewsUsingAutolayout(iconTwo)
         iconMiddle.anchor(
            top: iconMiddleView.topAnchor, centerX: iconMiddleView.centerXAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 40, height: 40)
         )
         iconMiddle.layer.cornerRadius = 20
         iconMiddle.clipsToBounds = true
         iconMiddle.backgroundColor = UIColor.secondOrangeColor
         
         iconTwo.anchor(
            centerX: iconMiddle.centerXAnchor, centerY: iconMiddle.centerYAnchor
         )
         
         
         iconRightView.addSubviewsUsingAutolayout(iconRight, writeLabel)
         iconRightView.anchor(
            size: .init(width: 100, height: 100)
         )
         iconRightView.backgroundColor = UIColor.tabbarColor
         
         writeLabel.anchor(
            top: iconRight.bottomAnchor, centerX: iconRight.centerXAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0)
         )
         
         iconRight.addSubviewsUsingAutolayout(iconthree)
         iconRight.anchor(
            top: iconRightView.topAnchor, centerX: iconRightView.centerXAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 40, height: 40)
         )
         iconRight.layer.cornerRadius = 20
         iconRight.clipsToBounds = true
         iconRight.backgroundColor = UIColor.writeColor
         
         iconthree.anchor(
            centerX: iconRight.centerXAnchor, centerY: iconRight.centerYAnchor
         )
         
         
         
         // Bottom View
         
         bottomView.addSubviewsUsingAutolayout(pencilLabel, favoriteLabel, drawImageIcon, uploadStoryButton)
         bottomView.anchor(
            top: lineView.bottomAnchor, leading: backView.leadingAnchor, trailing: backView.trailingAnchor, bottom: backView.safeAreaLayoutGuide.bottomAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0)
         )
         bottomView.backgroundColor = UIColor.tabbarColor
         
         pencilLabel.anchor(
            top: bottomView.topAnchor, leading: bottomView.leadingAnchor, trailing: bottomView.trailingAnchor, padding: .init(top: 30, left: 20, bottom: 0, right: -20)
         )
         favoriteLabel.anchor(
            top: pencilLabel.bottomAnchor, centerX: bottomView.centerXAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0)
         )
         
         drawImageIcon.anchor(
            centerX: bottomView.centerXAnchor, centerY: bottomView.centerYAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0)
         )
         
         uploadStoryButton.anchor(
            leading: bottomView.leadingAnchor, trailing: bottomView.trailingAnchor, bottom: bottomView.bottomAnchor, padding: .init(top: 0, left: 20, bottom: -20, right: -20), size: .init(width: bottomView.frame.width, height: 60)
         )
         uploadStoryButton.layer.cornerRadius = 10
         uploadStoryButton.clipsToBounds = true
         
         
         
         
         
      }// Constrains

   
   
   
   
   


}// Class
