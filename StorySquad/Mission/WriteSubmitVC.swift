//
//  WriteSubmitVC.swift
//  StorySquad
//
//  Created by Norlan Tibanear on 6/3/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class WriteSubmitVC: UIViewController {
   
   // Outlets
   
   let backView = UIView()
   let topView = UIView()
   let middleView = UIView()
   let lineView = UIView()
   
   // Top View
   let titleLabel = TitleLabel(text: " YOUR MISSION ")
   
   
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
   
   let iconOne = IconLabel(text: "1", textColor: UIColor.tabbarColor!)
   let iconTwo = IconLabel(text: "2", textColor: UIColor.tabbarColor!)
   let iconThree = IconLabel(text: "3", textColor: UIColor.tabbarColor!)
   
   let readLabel = IconTitleLabel(text: "Read", textColor: UIColor.white)
   let drawLabel = IconTitleLabel(text: "Draw", textColor: UIColor.whiteDarkColor!)
   let writeLabel = IconTitleLabel(text: "Write", textColor: UIColor.whiteDarkColor!)
   
   // Bottom View
   let bottomView = UIView()
   
   let writeTitle = TitleLabel(text: " REMINDER ")
   
   let writeIntro = IntroLabel(text: "Double check that you're uploading the right\nphoto!", numberOfLines: 2)
   
   let uploadPhotosButton: UIButton = {
      let button = ActionButton(title: "Upload now")
      button.addTarget(self, action: #selector(handleUplaodNowButton), for: .touchUpInside)
      return button
   }()
   
   fileprivate let writeCollectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      let cellWidth = UIScreen.main.bounds.width * 0.4
      layout.scrollDirection = .horizontal
      layout.itemSize = CGSize(width: cellWidth, height: UIScreen.main.bounds.width)
      let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
      cv.translatesAutoresizingMaskIntoConstraints = false
//      cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
      return cv
   }()
  
//   let layout = UICollectionViewFlowLayout()
//
//   let cellWidth = view.frame.width * 0.8
//
//   layout.itemSize = CGSize(width: cellWidth, height: 80)
//
//   collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
   
   
//MARK: Properties
   
   var scanImages: [UIImage] = []
   
//MARK: App Circle

    override func viewDidLoad() {
        super.viewDidLoad()
      writeCollectionView.delegate = self
      writeCollectionView.dataSource = self

        configureUI()
    }
   
//MARK: Button to save the photos to the Database
   @objc func handleUplaodNowButton() {
      
   }
   
   
   func configureUI() {
      view.addSubview(backView)
      setupBackView()
      
      writeCollectionView.register(WriteSubmitCollectionViewCell.self, forCellWithReuseIdentifier: "WriteSubmitCell")
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
      
      iconRight.addSubviewsUsingAutolayout(iconThree)
      iconRight.anchor(
         top: iconRightView.topAnchor, centerX: iconRightView.centerXAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 40, height: 40)
      )
      iconRight.layer.cornerRadius = 20
      iconRight.clipsToBounds = true
      iconRight.backgroundColor = UIColor.writeColor
      
      iconThree.anchor(
         centerX: iconRight.centerXAnchor, centerY: iconRight.centerYAnchor
      )
      
      
      // Line View
      
      lineView.anchor(
         top: middleView.bottomAnchor, leading: backView.leadingAnchor, trailing: backView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: UIScreen.main.bounds.width, height: 3)
      )
      lineView.backgroundColor = UIColor.darkGray
      
      
      
      // Bottom View
      
      bottomView.addSubviewsUsingAutolayout(writeTitle, writeIntro, writeCollectionView, uploadPhotosButton)
      bottomView.anchor(
         top: lineView.bottomAnchor, leading: backView.leadingAnchor, trailing: backView.trailingAnchor, bottom: backView.safeAreaLayoutGuide.bottomAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0)
      )
      bottomView.backgroundColor = UIColor.tabbarColor
      
      writeTitle.anchor(
         top: bottomView.topAnchor, leading: bottomView.leadingAnchor, trailing: bottomView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: -20)
      )
      writeIntro.anchor(
         top: writeTitle.bottomAnchor, leading: bottomView.leadingAnchor, trailing: bottomView.trailingAnchor, padding: .init(top: 15, left: 20, bottom: 0, right: -20)
      )
      writeCollectionView.anchor(
         top: writeIntro.bottomAnchor, leading: bottomView.leadingAnchor, trailing: bottomView.trailingAnchor, bottom: uploadPhotosButton.topAnchor, padding: .init(top: 20, left: 50, bottom: -20, right: -50)
      )
      writeCollectionView.backgroundColor = UIColor.tabbarColor
      
      writeCollectionView.layer.cornerRadius = 10
      writeCollectionView.clipsToBounds = true
      
      uploadPhotosButton.anchor(
         top: writeCollectionView.bottomAnchor, bottom: bottomView.bottomAnchor, centerX: bottomView.centerXAnchor, padding: .init(top: 20, left: 0, bottom: -20, right: 0), size: .init(width: 0, height: 60)
      )
      uploadPhotosButton.layer.cornerRadius = 10
      uploadPhotosButton.clipsToBounds = true
      
   }//
    


}// Class

extension WriteSubmitVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: writeCollectionView.frame.width, height: writeCollectionView.frame.height)
   }
   
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return scanImages.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WriteSubmitCell", for: indexPath) as! WriteSubmitCollectionViewCell
      
      cell.scanImage = scanImages[indexPath.item]
      
      return cell
   }
   
}//
