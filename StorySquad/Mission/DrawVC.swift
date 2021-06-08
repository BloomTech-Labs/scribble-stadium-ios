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
 
   
   // Photo Submit View
   
//   let submitView = UIView()
//
//   let photoSubmitTitle: UILabel = {
//      let label = UILabel()
//      label.textColor = .white
//      label.text = " PENCILS READY! "
//      label.font = UIFont(name: "Bangers", size: 40.0)
//      label.textAlignment = NSTextAlignment.center
//      label.translatesAutoresizingMaskIntoConstraints = false
//      return label
//   }()
//
//   let photoSubmitIntro: UILabel = {
//      let label = UILabel()
//      label.textColor = .white
//      label.text = "Double check that you're uploading the right\nphoto!."
//      label.font = UIFont(name: "Atma", size: 18.0)
//      label.textAlignment = NSTextAlignment.center
//      label.numberOfLines = 2
//      return label
//   }()
//
//   let photoSubmitImage: UIImageView = {
//      let image = UIImageView()
//      image.contentMode = .scaleAspectFill
//      return image
//   }()
//
//   let photoSubmitButton: UIButton = {
//      let button = UIButton()
//      button.setTitleColor(UIColor.borderTwoColor, for: .normal)
//      button.setTitle("Submit", for: .normal)
//      button.titleLabel?.font =  UIFont(name: "Atma-medium", size: 20.0)
//      button.backgroundColor = UIColor.aquaColor
//      button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 30, bottom: 5, right: 30)
//      button.addTarget(self, action: #selector(handlePhotoSubmitButton), for: .touchUpInside)
//      return button
//   }()
   
    
    // NOTE: The delete button is here in case they decide to have a button to delete and send the user back to the camera view
   
//   let deleteButton: UIButton = {
//      let button = UIButton()
//      let config = UIImage.SymbolConfiguration(pointSize: 25)
//      let image = UIImage(systemName: "trash.fill", withConfiguration: config)?.withTintColor(UIColor.borderTwoColor!, renderingMode: .alwaysOriginal)
//      button.setImage(image, for: .normal)
//      button.contentMode = .scaleAspectFill
//
//      button.addTarget(self, action: #selector(handleDeleteButton), for: .touchUpInside)
//      return button
//   }()
   
   

   
   // Bottom Picture Alert View
   
   let bottomPictureView = UIView()
   
   let pictureAlertStackview: UIStackView = {
    let stackview = UIStackView()
      let stackView = UIStackView()
      stackView.distribution = .fillEqually
      stackView.spacing = 10
      stackView.axis = .vertical
      return stackview
   }()
   
   let pictureAlertBackground: UIImageView = {
      let image = UIImageView()
      image.image = UIImage(named: "AlerBackground")
      image.contentMode = .scaleAspectFit
      return image
   }()

   let pictureIntro = AlertIntroLabel(text: "How do you want to upload\nyour drawing?", numberOfLines: 2)
   
   let photoLibraryButton: UIButton = {
      let button = AlertButton(title: "CHOOSE FROM YOUR LIBRARY")
      button.addTarget(self, action: #selector(handlePhotoLibraryButton), for: .touchUpInside)
      return button
   }()
   
   let cameraButton: UIButton = {
      let button = AlertButton(title: "TAKE A NEW PHOTO")
      button.addTarget(self, action: #selector(handleCameraPhotoButton), for: .touchUpInside)
      return button
   }()
   
   
   // Bottom View
   
   let pencilLabel = TitleLabel(text: " DON'T FORGET! ")
   
   let favoriteLabel = IntroLabel(text: "When you're finished drawing, snap a photo and\nupload your masterpiece.", numberOfLines: 2)
   
   let drawImageIcon: UIImageView = {
      let image = UIImageView()
      image.image = UIImage(named: "DrawImage4")
      image.contentMode = .scaleAspectFill
      return image
   }()
   
   let uploadDrawingButton: UIButton = {
      let button = ActionButton(title: "Upload Drawing")
      button.addTarget(self, action: #selector(handleUploadDrawingButton), for: .touchUpInside)
      return button
   }()
   

   
   // Bottom AlertView
   
   let bottomAlertView = UIView()
   
   let imageView = UIView()
   
   let alertImage: UIImageView = {
      let image = UIImageView()
      image.image = UIImage(named: "AlerBackground")
      image.contentMode = .scaleToFill
      return image
   }()
   
   let alertTitle = AlertTitleLabel(text: " GREAT JOB! ")
   
   let alertIntro = AlertIntroLabel(text: "Grab a sheet of paper and your drawing\nsupplies. Based on the reading, draw your\nfavorite scene by hand. When you're\nfinished, snap a photo and upload your\nmasterpiece.", numberOfLines: 5)
   
   
   let alertButton: UIButton = {
      let button = AlertButton(title: "LET'S GO!")
      button.addTarget(self, action: #selector(handleLetsGoButton), for: .touchUpInside)
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
   
   let iconOne = IconLabel(text: "1", textColor: UIColor.tabbarColor!)
   let iconTwo = IconLabel(text: "2", textColor: UIColor.tabbarColor!)
   let iconThree = IconLabel(text: "3", textColor: UIColor.tabbarColor!)
   
   let readLabel = IconTitleLabel(text: "Read", textColor: UIColor.white)
   let drawLabel = IconTitleLabel(text: "Draw", textColor: UIColor.whiteDarkColor!)
   let writeLabel = IconTitleLabel(text: "Write", textColor: UIColor.whiteDarkColor!)
   
   // Top View
   
   let titleLabel = TitleLabel(text: " YOUR MISSION ")
   
   
//MARK: Properties
   var image: UIImage? = nil
   

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = UIColor.tabbarColor
      self.navigationItem.title = "Draw"
      
      configureUI()
    }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      bottomView.isHidden = true
      bottomPictureView.isHidden = true
      bottomAlertView.isHidden = false
//      submitView.isHidden = true
      
      self.tabBarController?.tabBar.isHidden = true
   }
   
   func delay(_ delay: Double, closure: @escaping ()->()) {
       let when = DispatchTime.now() + delay
       DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
   }
   
   @objc func handlePhotoLibraryButton() {
      photoLibraryButton.isUserInteractionEnabled = true
      let picker = UIImagePickerController()
      picker.sourceType = .photoLibrary
      picker.allowsEditing = true
      picker.delegate = self
      self.present(picker, animated: true, completion: nil)
      
      
      bottomView.isHidden = true
      bottomPictureView.isHidden = false
//      submitView.isHidden = true
      
      delay(2.0) {
         self.bottomPictureView.isHidden = true
      }

   }//
   
   
   @objc func handleCameraPhotoButton() {
    let photoPicker = UIImagePickerController()
      photoPicker.delegate = self
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
        photoPicker.allowsEditing = false
        photoPicker.sourceType = UIImagePickerController.SourceType.camera
        photoPicker.cameraCaptureMode = .photo
        photoPicker.modalPresentationStyle = .fullScreen
        present(photoPicker, animated: true, completion: nil)
    } else {
        noCamera()
    }
   }//
    
    func noCamera() {
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
   
   @objc func handleDeleteButton() {
      image = nil
      bottomPictureView.isHidden = true
      bottomView.isHidden = false
   }//
   
   
   // Upload drawing Button
   @objc func handleUploadDrawingButton() {
      bottomAlertView.isHidden = true
      bottomView.isHidden = true
      bottomPictureView.isHidden = false
   }
   
   // Alert Let's Go Button
   @objc func handleLetsGoButton() {
      bottomAlertView.isHidden = true
      bottomView.isHidden = false
      bottomPictureView.isHidden = true
   }
   
   
//MARK: Button to save in the database
   
   @objc func handlePhotoSubmitButton() {
      let rootVC = WriteVC()
      //navigationController?.pushViewController(rootVC, animated: true)
    self.present(rootVC, animated: true, completion: nil)
        print("submit")
   }
   

//MARK: UI Layout
   
   func configureUI() {
      view.addSubviewsUsingAutolayout(backView)
      setupBackView()
   }//
   
   
   func setupBackView() {
      backView.addSubviewsUsingAutolayout(bottomPictureView, topView, middleView, lineView, bottomView, bottomAlertView)
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
      
      iconRight.addSubviewsUsingAutolayout(iconThree)
      iconRight.anchor(
         top: iconRightView.topAnchor, centerX: iconRightView.centerXAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 40, height: 40)
      )
      iconRight.layer.cornerRadius = 20
      iconRight.clipsToBounds = true
      iconRight.backgroundColor = UIColor.thirdYellowColor
      
      iconThree.anchor(
         centerX: iconRight.centerXAnchor, centerY: iconRight.centerYAnchor
      )
      
      lineView.anchor(
         top: middleView.bottomAnchor, leading: backView.leadingAnchor, trailing: backView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: UIScreen.main.bounds.width, height: 3)
      )
      lineView.backgroundColor = UIColor.darkGray
      
      
      
      // Bottom Alert View
      
      bottomAlertView.addSubviewsUsingAutolayout(imageView)
      bottomAlertView.anchor(
      top: lineView.bottomAnchor, leading: backView.leadingAnchor, trailing: backView.trailingAnchor, bottom: backView.safeAreaLayoutGuide.bottomAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0)
      )
      bottomView.backgroundColor = UIColor.tabbarColor
      
      imageView.addSubviewsUsingAutolayout(alertImage, alertTitle, alertIntro, alertButton)
      imageView.anchor(
         centerX: bottomAlertView.centerXAnchor, centerY: bottomAlertView.centerYAnchor, size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width + 40)
      )
      imageView.backgroundColor = UIColor.tabbarColor
      
      alertImage.anchor(
         top: imageView.topAnchor, leading: imageView.leadingAnchor, trailing: imageView.trailingAnchor, bottom: imageView.bottomAnchor, padding: .init(top: 10, left: 10, bottom: -10, right: -10)
      )
      
      alertTitle.anchor(
         bottom: alertIntro.topAnchor, centerX: imageView.centerXAnchor, padding: .init(top: 0, left: 0, bottom: -20, right: 0)
      )
      
      alertIntro.anchor(
         centerX: imageView.centerXAnchor, centerY: imageView.centerYAnchor
      )
      
      alertButton.anchor(
         top: alertIntro.bottomAnchor, centerX: imageView.centerXAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0)
      )
      

      
      // Bottom View
      
      bottomView.addSubviewsUsingAutolayout(pencilLabel, favoriteLabel, drawImageIcon, uploadDrawingButton)
      bottomView.anchor(
         top: lineView.bottomAnchor, leading: backView.leadingAnchor, trailing: backView.trailingAnchor, bottom: backView.safeAreaLayoutGuide.bottomAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0)
      )
      bottomView.backgroundColor = UIColor.tabbarColor
      
      pencilLabel.anchor(
         top: bottomView.topAnchor, leading: bottomView.leadingAnchor, trailing: bottomView.trailingAnchor, padding: .init(top: 50, left: 20, bottom: 0, right: -20)
      )
      favoriteLabel.anchor(
         top: pencilLabel.bottomAnchor, centerX: bottomView.centerXAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0)
      )
      
      drawImageIcon.anchor(
         top: favoriteLabel.bottomAnchor, bottom: uploadDrawingButton.topAnchor, centerX: bottomView.centerXAnchor, padding: .init(top: 10, left: 20, bottom: -10, right: 20)
      )
      drawImageIcon.contentMode = .scaleAspectFit
      
      uploadDrawingButton.anchor(
         bottom: bottomView.bottomAnchor, centerX: bottomView.centerXAnchor, padding: .init(top: 0, left: 0, bottom: -20, right: 0), size: .init(width: 0, height: 60)
      )
      
      
      // Bottom Picture View
      bottomPictureView.addSubviewsUsingAutolayout(pictureAlertBackground, pictureIntro, photoLibraryButton, cameraButton)
      bottomPictureView.anchor(
         top: lineView.bottomAnchor, leading: backView.leadingAnchor, trailing: backView.trailingAnchor, bottom: backView.safeAreaLayoutGuide.bottomAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0)
      )
      
      pictureAlertBackground.anchor(
         top: bottomPictureView.topAnchor, leading: bottomPictureView.leadingAnchor, trailing: bottomPictureView.trailingAnchor, bottom: bottomPictureView.bottomAnchor, padding: .init(top: 20, left: 20, bottom: -20, right: -20), size: .init(width: bottomPictureView.frame.width - 30, height: bottomPictureView.frame.width - 30)
      )
      
      pictureIntro.anchor(
         leading: pictureAlertBackground.leadingAnchor, trailing: pictureAlertBackground.trailingAnchor, bottom: photoLibraryButton.topAnchor, padding: .init(top: 0, left: 20, bottom: -20, right: -20)
      )
      
      photoLibraryButton.anchor(
         centerX: pictureAlertBackground.centerXAnchor, centerY: pictureAlertBackground.centerYAnchor, size: .init(width: 0, height: 0)
      )
      
      cameraButton.anchor(
         top: photoLibraryButton.bottomAnchor, centerX: pictureAlertBackground.centerXAnchor, padding: .init(top: 15, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0)
      )
      
      
   }// UI Constraint
   

}// Class

extension DrawVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
           
           image = imageSelected
//           photoSubmitImage.image = imageSelected
       }
       
       if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
           
           image = imageOriginal
//           photoSubmitImage.image = imageOriginal
       }
       
      picker.dismiss(animated: true) {
         let rootVC = DrawSubmitVC()
         rootVC.pickerImage = self.image
         
         self.navigationController?.pushViewController(rootVC, animated: false)
//         self.navigationController?.show(rootVC, sender: nil)
//         self.navigationController?.present(rootVC, animated: false, completion: nil)
//         self.present(rootVC, animated: false, completion: nil)
      }
      
   }
   
}//

