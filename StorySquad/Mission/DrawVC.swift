//
//  DrawVC.swift
//  Story Squad
//
//  Created by Norlan Tibanear on 5/17/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import UIKit

class DrawVC: UIViewController {
   
   // Outlets Views
   let backView = UIView()
   let topView = UIView()
   let middleView = UIView()
   let lineView = UIView()
   let bottomView = UIView()
   let bottomPictureView = UIView()
   
   
   // Bottom Picture View
   
   let reviewImage: UIImageView = {
      let image = UIImageView()
      image.contentMode = .scaleAspectFill
      return image
   }()
   
   let uploadPictureButton: UIButton = {
      let button = UIButton()
      button.setTitleColor(.gray, for: .normal)
      button.setTitle("Upload now", for: .normal)
      button.titleLabel?.font =  UIFont(name: "Bangers", size: 20.0)
      button.backgroundColor = UIColor.aquaColor
      return button
   }()
   
   let deleteButton: UIButton = {
      let button = UIButton()
      button.setImage(UIImage(systemName: "trash"), for: .normal)
      button.contentMode = .scaleAspectFill
      button.addTarget(self, action: #selector(handleDeleteButton), for: .touchUpInside)
      return button
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
      label.text = "Draw your favorite part of the story, then \ntake a picture and upload it."
      label.font = UIFont(name: "Atma", size: 18.0)
      label.textAlignment = NSTextAlignment.center
      label.numberOfLines = 2
      return label
   }()
   
   let drawImageIcon: UIImageView = {
      let image = UIImageView()
      image.image = UIImage(named: "drawImage")
      image.contentMode = .scaleAspectFill
      return image
   }()
   
   lazy var photoStackView: UIStackView = {
      let stackView = UIStackView()
      stackView.distribution = .fillEqually
      stackView.spacing = 20
      stackView.axis = .horizontal
      return stackView
   }()
   
   let takePicture: UIButton = {
      let button = UIButton()
      button.setTitleColor(.gray, for: .normal)
      button.setTitle(" Photo Library ", for: .normal)
      button.titleLabel?.font =  UIFont(name: "Bangers", size: 20.0)
      button.backgroundColor = UIColor.aquaColor
      button.addTarget(self, action: #selector(handlePhotoLibraryButton), for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
   }()
   
   let cameraButton: UIButton = {
      let button = UIButton()
      button.setTitleColor(.gray, for: .normal)
      button.setTitle(" Camera Photo ", for: .normal)
      button.titleLabel?.font =  UIFont(name: "Bangers", size: 20.0)
      button.backgroundColor = UIColor.aquaColor
      button.addTarget(self, action: #selector(handleCameraPhotoButton), for: .touchUpInside)
      return button
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
      label.textColor = UIColor.white
      label.text = "Draw"
      label.font = UIFont(name: "Atma", size: 22.0)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   let writeLabel: UILabel = {
      let label = UILabel()
      label.textColor = UIColor.whiteDarkColor
      label.text = "Write"
      label.font = UIFont(name: "Atma", size: 22.0)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   
   // Top View
   
   let titleLabel: UILabel = {
      let title = UILabel()
      title.textColor = .white
      title.text = " YOUR MISSION "
      title.font = UIFont(name: "Bangers", size: 40.0)
      title.translatesAutoresizingMaskIntoConstraints = false
      return title
   }()
   
   
//MARK: Properties
   var image: UIImage? = nil
   

    override func viewDidLoad() {
        super.viewDidLoad()

//      view.backgroundColor = .systemTeal
      
      configureUI()
    }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      //bottomView.isHidden = true
      bottomPictureView.isHidden = true
      
      self.tabBarController?.tabBar.isHidden = true
   }
   
   @objc func handlePhotoLibraryButton() {
      let picker = UIImagePickerController()
      picker.sourceType = .photoLibrary
      picker.allowsEditing = true
      picker.delegate = self
      self.present(picker, animated: true, completion: nil)
      bottomView.isHidden = true
      bottomPictureView.isHidden = false
   }//
   
   @objc func handleCameraPhotoButton() {
      let rootVC = WriteVC()
      navigationController?.pushViewController(rootVC, animated: true)
//      present(rootVC, animated: true, completion: nil)
   }//
   
   @objc func handleDeleteButton() {
      image = nil
      bottomPictureView.isHidden = true
      bottomView.isHidden = false
   }//
    

//MARK: UI Layout
   
   func configureUI() {
      view.addSubviewsUsingAutolayout(backView)
      setupBackView()
   }//
   
   func setupBackView() {
      backView.addSubviewsUsingAutolayout(topView, middleView, lineView, bottomView, bottomPictureView)
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
      iconMiddle.backgroundColor = UIColor.drawColor
      
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
      iconRight.backgroundColor = UIColor.thirdYellowColor
      
      iconthree.anchor(
         centerX: iconRight.centerXAnchor, centerY: iconRight.centerYAnchor
      )
      
      lineView.anchor(
         top: middleView.bottomAnchor, leading: backView.leadingAnchor, trailing: backView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: UIScreen.main.bounds.width, height: 3)
      )
      lineView.backgroundColor = UIColor.darkGray
      
      
      
      // Bottom View
      bottomView.addSubviewsUsingAutolayout(pencilLabel, favoriteLabel, drawImageIcon, photoStackView)
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
      
      photoStackView.addArrangedSubview(takePicture)
      photoStackView.addArrangedSubview(cameraButton)
      photoStackView.anchor(
         leading: bottomView.leadingAnchor, trailing: bottomView.trailingAnchor, bottom: bottomView.bottomAnchor, padding: .init(top: 0, left: 20, bottom: -20, right: -20)
      )
      
      takePicture.anchor(
          size: .init(width: bottomView.frame.width, height: 60)
      )
      takePicture.layer.cornerRadius = 10
      takePicture.clipsToBounds = true
      
      cameraButton.anchor(
         size: .init(width: bottomView.frame.width, height: 60)
      )
      cameraButton.layer.cornerRadius = 10
      cameraButton.clipsToBounds = true
      
      
      
      // Bottom Picture View
      bottomPictureView.addSubviewsUsingAutolayout(reviewImage, uploadPictureButton, deleteButton)
      bottomPictureView.anchor(
         top: lineView.bottomAnchor, leading: backView.leadingAnchor, trailing: backView.trailingAnchor, bottom: backView.bottomAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0)
      )
      bottomPictureView.backgroundColor = UIColor.tabbarColor
      
//      reviewImage.addSubviewsUsingAutolayout(deleteButton)
      reviewImage.anchor(
         top: bottomPictureView.topAnchor, leading: bottomPictureView.leadingAnchor, trailing: bottomPictureView.trailingAnchor, bottom: uploadPictureButton.topAnchor, padding: .init(top: 20, left: 20, bottom: -20, right: -20)
      )
      reviewImage.layer.cornerRadius = 10
      reviewImage.clipsToBounds = true
      reviewImage.backgroundColor = UIColor.tabbarColor
      
      deleteButton.anchor(
         top: reviewImage.topAnchor, trailing: reviewImage.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: -10), size: .init(width: 60, height: 60)
      )
      
      
      uploadPictureButton.anchor(
         leading: bottomPictureView.leadingAnchor, trailing: bottomPictureView.trailingAnchor, bottom: bottomPictureView.safeAreaLayoutGuide.bottomAnchor, padding: .init(top: 0, left: 50, bottom: -20, right: -50), size: .init(width: bottomPictureView.frame.width, height: 60)
      )
      uploadPictureButton.layer.cornerRadius = 10
      uploadPictureButton.clipsToBounds = true
      
   }// UI Constraint
   

}// Class

extension DrawVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
           
           image = imageSelected
           reviewImage.image = imageSelected
       }
       
       if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
           
           image = imageOriginal
           reviewImage.image = imageOriginal
       }
       
       picker.dismiss(animated: true, completion: nil)
   }
   
   
}//

