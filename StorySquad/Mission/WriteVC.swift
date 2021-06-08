//
//  WriteVC.swift
//  StorySquad
//
//  Created by Norlan Tibanear on 5/20/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import VisionKit

class WriteVC: UIViewController {
   
   
   // Views
   let backView = UIView()
   let topView = UIView()
   let middleView = UIView()
   let lineView = UIView()
   let bottomView = UIView()

   
   // Bottom Alert View
   
   let bottomAlertView = UIView()
   
   let alertImage: UIImageView = {
      let image = UIImageView()
      image.image = UIImage(named: "AlerBackground2")
      image.contentMode = .scaleAspectFill
      return image
   }()
   
   let alertTitle: UILabel = {
      let label = AlertTitleLabel(text: " SCRIBBLE A SIDE\nQUEST! ")
      label.numberOfLines = 2
      return label
   }()
   
   let alertIntro = AlertIntroLabel(text: "Grab your favorite pencil and some loose\nleaf sheets of paper. Based on the promt\nat the end of the reading, scribble down a\nside quest by hand. When your story is\ncomplete, snap a photo of your pages and\nupload them. Let's go!.", numberOfLines: 6)
   
   
   let alertButton: UIButton = {
      let button = AlertButton(title: "LET'S GO!")
      button.addTarget(self, action: #selector(handleLetsGoButton), for: .touchUpInside)
      return button
   }()

   
   
   // Bottom Picture View
   
   let bottomPicturesView = UIView()
   
   let writeTitle = TitleLabel(text: " REMINDER ")
   
   let writeIntro = IntroLabel(text: "Double check that you're uploading the right\nphoto!", numberOfLines: 2)
   
   
   fileprivate let writeCollectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .horizontal
      let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
      cv.translatesAutoresizingMaskIntoConstraints = false
//      cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
      return cv
   }()
   
//   let reviewImage: UIImageView = {
//      let image = UIImageView()
//      image.contentMode = .scaleAspectFill
//      return image
//   }()
  
   let uploadWriteButton: UIButton = {
      let button = ActionButton(title: "Upload now")
      button.addTarget(self, action: #selector(handleUplaodNowButton), for: .touchUpInside)
      return button
   }()
   
   
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
   
   let pencilLabel = TitleLabel(text: " DON'T FORGET! ")
   
   let favoriteLabel = IntroLabel(text: "When your story is complete, snap a photo of\nyour pages and upload them.", numberOfLines: 4)
   
   
   let drawImageIcon: UIImageView = {
      let image = UIImageView()
      image.image = UIImage(named: "DrawImage4")
      image.contentMode = .scaleAspectFill
      return image
   }()
  
   let uploadStoryButton: UIButton = {
      let button = ActionButton(title: "Upload Writing")
      button.addTarget(self, action: #selector(handlePhotoLibraryButton), for: .touchUpInside)
      return button
   }()
   
//   let uploadStoryButton: UIButton = {
//      let button = UIButton()
//      button.setTitle("Upload Writing", for: .normal)
//      button.setTitleColor(UIColor.borderTwoColor, for: .normal)
//      button.titleLabel?.font = UIFont(name: "Atma-Medium", size: 20.0)
//      button.backgroundColor = UIColor.aquaColor
//      button.layer.borderWidth = 3
//      button.layer.borderColor = UIColor.borderTwoColor?.cgColor
//      button.layer.cornerRadius = 10
//      button.clipsToBounds = true
//      button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 30, bottom: 5, right: 30)
//      button.translatesAutoresizingMaskIntoConstraints = false
//      button.addTarget(self, action: #selector(handlePhotoLibraryButton), for: .touchUpInside)
//      return button
//   }()
   

//MARK: Properties
   
   var image: [UIImage] = []
   
   
//MARK: App Circle
   
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = UIColor.tabbarColor
      navigationItem.title = "Read"
      self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Bangers", size: 20)!]
      
//      writeCollectionView.delegate = self
//      writeCollectionView.dataSource = self
        
      configureUI()
        
    }
   
   override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       self.tabBarController?.tabBar.isHidden = true
      bottomView.isHidden = false
      bottomPicturesView.isHidden = true
   }//
    
   
//MARK: This function when click should open the Scanner Photo
    
    //Configure the scanner view
   private func configureDocumentView() {
        
        let scanningDocumentVC = VNDocumentCameraViewController()
        scanningDocumentVC.delegate = self
        self.present(scanningDocumentVC, animated: true, completion: nil)
    }
   @objc func handlePhotoLibraryButton() {
      bottomView.isHidden = true
      bottomAlertView.isHidden = true
      bottomPicturesView.isHidden = true
      configureDocumentView()
      
      let rootVC = WriteSubmitVC()
//      self.present(rootVC, animated: true, completion: nil)
      self.navigationController?.pushViewController(rootVC, animated: true)
   }//
   
//MARK: This button saves to the database
   
   @objc func handleUplaodNowButton() {
      
   }//
   
   
   @objc func handleLetsGoButton() {
      bottomAlertView.isHidden = true
      bottomView.isHidden = false
      bottomPicturesView.isHidden = true
   }

   
//MARK: UI Layout
      
      func configureUI() {
         view.addSubviewsUsingAutolayout(backView)
         setupBackView()
      }//
      
      func setupBackView() {
         backView.addSubviewsUsingAutolayout(topView, middleView, lineView, bottomView, bottomPicturesView, bottomAlertView)
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
         
         
         // Bottom Alert View
         
         bottomAlertView.addSubviewsUsingAutolayout(alertImage, alertTitle, alertIntro, alertButton)
         bottomAlertView.anchor(
            top: lineView.bottomAnchor, leading: backView.leadingAnchor, trailing: backView.trailingAnchor, bottom: backView.safeAreaLayoutGuide.bottomAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0)
         )
         bottomAlertView.backgroundColor = UIColor.tabbarColor
         
         alertImage.anchor(
            centerX: bottomAlertView.centerXAnchor, centerY: bottomAlertView.centerYAnchor, size: .init(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.width + 40)
         )
         alertTitle.anchor(
            bottom: alertIntro.topAnchor, centerX: alertImage.centerXAnchor, padding: .init(top: 0, left: 0, bottom: -10, right: 0)
         )
         alertIntro.anchor(
            centerX: alertImage.centerXAnchor, centerY: alertImage.centerYAnchor
         )
         alertButton.anchor(
            top: alertIntro.bottomAnchor, centerX: alertImage.centerXAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0)
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
            top: favoriteLabel.bottomAnchor, bottom: uploadStoryButton.topAnchor, centerX: bottomView.centerXAnchor, padding: .init(top: 10, left: 20, bottom: -10, right: 20)
         )
         drawImageIcon.contentMode = .scaleAspectFit
         
         uploadStoryButton.anchor(
            bottom: bottomView.bottomAnchor, centerX: bottomView.centerXAnchor, padding: .init(top: 0, left: 0, bottom: -20, right: 0), size: .init(width: 0, height: 60)
         )
         uploadStoryButton.layer.cornerRadius = 10
         uploadStoryButton.clipsToBounds = true
         
         
         // Bottom Pictures View
         bottomPicturesView.addSubviewsUsingAutolayout(writeTitle, writeIntro, writeCollectionView, uploadWriteButton)
         bottomPicturesView.anchor(
            top: lineView.bottomAnchor, leading: backView.leadingAnchor, trailing: backView.trailingAnchor, bottom: backView.safeAreaLayoutGuide.bottomAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0)
         )
         bottomPicturesView.backgroundColor = UIColor.tabbarColor
         
         writeTitle.anchor(
            top: bottomPicturesView.topAnchor, leading: bottomPicturesView.leadingAnchor, trailing: bottomPicturesView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: -20)
         )
         
         writeIntro.anchor(
            top: writeTitle.bottomAnchor, leading: bottomPicturesView.leadingAnchor, trailing: bottomPicturesView.trailingAnchor, padding: .init(top: 15, left: 20, bottom: 0, right: -20)
         )
         
         writeCollectionView.anchor(
            top: writeIntro.bottomAnchor, leading: bottomPicturesView.leadingAnchor, trailing: bottomPicturesView.trailingAnchor, bottom: uploadWriteButton.topAnchor, padding: .init(top: 20, left: 40, bottom: -20, right: -40)
         )
         
         uploadWriteButton.anchor(
            top: writeCollectionView.bottomAnchor, bottom: bottomPicturesView.bottomAnchor, centerX: bottomPicturesView.centerXAnchor, padding: .init(top: 20, left: 0, bottom: -20, right: 0), size: .init(width: 0, height: 60)
         )
         uploadWriteButton.layer.cornerRadius = 10
         uploadWriteButton.clipsToBounds = true
         
      }// Constrains



}// Class

//extension WriteVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
//
//   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//      return CGSize(width: writeCollectionView.frame.width, height: writeCollectionView.frame.height)
//   }
//
//
//   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//      return 3
//   }
//
//   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
//
//
//
//      return cell
//   }
//
//}//

extension WriteVC: VNDocumentCameraViewControllerDelegate {
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        
        for pageNumber in 0..<scan.pageCount {
            let image = scan.imageOfPage(at: pageNumber)
            self.image.append(image)
            
            
         
            print(image)
            //Assign scam document <image> to collection view data source
            // below assigns to UIImageView i used in previous project
            //scanImageView.image = image
            
            
        }
//        controller.dismiss(animated: true, completion: nil)
      
         controller.dismiss(animated: true) {
         let rootVC = WriteSubmitVC()
            rootVC.scanImages = self.image
//            rootVC.scanImages = self.image
//            self.present(rootVC, animated: true, completion: nil)
         self.navigationController?.pushViewController(rootVC, animated: false)
      }
      
    }
}


//class CustomCell: UICollectionViewCell {
//
//   fileprivate let bg: UIImageView = {
//      let image = UIImageView()
//      image.contentMode = .scaleAspectFill
//      image.layer.cornerRadius = 12
//      image.clipsToBounds = true
//      image.backgroundColor = .systemTeal
//      image.translatesAutoresizingMaskIntoConstraints = false
//      return image
//   }()
//
//   override init(frame: CGRect) {
//      super.init(frame: frame)
//
//      contentView.addSubview(bg)
//
//      bg.anchor(
//         top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: contentView.bottomAnchor
//      )
//   }
//
//
//
//   required init?(coder: NSCoder) {
//      fatalError("init(coder:) has not been implemented")
//   }
//
//}//
