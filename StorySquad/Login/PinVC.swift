//
//  PinVC.swift
//  StorySquad
//
//  Created by Ian French on 6/7/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//


import UIKit

class PinTextField: UITextField {

}

class PinVC: UIViewController {
    let backView = UIView()

    let topView = UIView()

    let middleView = UIView()

    let bottomView = UIView()

    lazy var mainStackView: UIStackView = {
       let stackView = UIStackView()
       stackView.distribution = .fillEqually
       stackView.spacing = 20
       stackView.axis = .vertical
       return stackView
    }()

    lazy var pinStackView: UIStackView = {
        let pinStack = UIStackView()
        pinStack .distribution = .fillEqually
        pinStack .spacing = 20
        pinStack .axis = .horizontal
        return pinStack

    }()


    lazy var titleLabel: UILabel = {
       let label = UILabel()
       label.textAlignment = .center
       label.attributedText = strokedTextStorage
       return label
    }()

    lazy var strokedTextStorage: NSTextStorage = {

       var textStorage = NSTextStorage(string: " STORY SQUAD ", attributes: [NSAttributedString.Key.strokeWidth: -4.0, NSAttributedString.Key.strokeColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "Bangers-Regular", size: 50) ?? UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.obliqueness: 0.0])

       return textStorage

    }()


    let subTitleLabel: UILabel = {
       let title = UILabel()
       title.textColor = UIColor.subTitleColor
       title.text = "Enter your PIN to proceed"
       title.font = UIFont(name: "Open Sans", size: 18.0)
       title.font = UIFont.systemFont(ofSize: 18.0, weight: .medium)
       title.translatesAutoresizingMaskIntoConstraints = false
       return title
    }()

    let pinTextField1: UITextField = {
       let pin_one = PinTextField()
       return pin_one
    }()
    let pinTextField2: UITextField = {
       let pin_two = PinTextField()
       return pin_two
    }()
    let pinTextField3: UITextField = {
       let pin_three = PinTextField()
       return pin_three
    }()
    let pinTextField4: UITextField = {
       let pin_four = PinTextField()
       return pin_four
    }()


     override func viewDidLoad() {
         super.viewDidLoad()
       view.backgroundColor = UIColor.aquaColor

       configureUI()
     }




    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func configureUI() {
       view.addSubviewsUsingAutolayout(backView)
       setupBackView()
    }//

    func setupBackView() {
       backView.addSubviewsUsingAutolayout(mainStackView)
       backView.anchor(
          top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor
       )
       backView.translatesAutoresizingMaskIntoConstraints = false

       mainStackView.addArrangedSubview(topView)
       mainStackView.addArrangedSubview(middleView)
       mainStackView.addArrangedSubview(bottomView)
       mainStackView.anchor(
          top: backView.topAnchor, leading: backView.leadingAnchor, trailing: backView.trailingAnchor, bottom: backView.bottomAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0)
       )


        _ = (UIScreen.main.bounds.width / 2) + 40

        topView.addSubviewsUsingAutolayout(titleLabel, subTitleLabel)
        topView.anchor(

        )
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = UIColor.aquaColor

        titleLabel.anchor(
           centerX: topView.centerXAnchor, centerY: topView.centerYAnchor
        )

        subTitleLabel.anchor(
           top: titleLabel.bottomAnchor, centerX: titleLabel.centerXAnchor, padding: .init(top: 25, left: 0, bottom: 0, right: 0)
        )


//       middleView.addSubviewsUsingAutolayout(emailAddressLabel, emailTextField, loginButton)
       middleView.anchor(
          size: .init(width: backView.frame.width, height: 250)
       )
       middleView.translatesAutoresizingMaskIntoConstraints = false
       middleView.backgroundColor = UIColor.aquaColor

//       emailAddressLabel.anchor(
//          leading: middleView.leadingAnchor, trailing: middleView.trailingAnchor, bottom: emailTextField.topAnchor, padding: .init(top: 0, left: 35, bottom: -10, right: -30)
//       )




//       loginButton.anchor(
//          leading: middleView.leadingAnchor, trailing: middleView.trailingAnchor, centerX: middleView.centerXAnchor, centerY: middleView.centerYAnchor, padding: .init(top: 0, left: 25, bottom: 0, right: -25), size: .init(width: middleView.frame.width, height: emailHeight)
//       )
//       loginButton.layer.borderWidth = 1
//       loginButton.layer.borderColor = UIColor.white.cgColor
//       loginButton.layer.cornerRadius = emailHeight / 2
//       loginButton.clipsToBounds = true

       //bottomView.addSubviewsUsingAutolayout(createAccountButton)
       bottomView.anchor(

       )
       bottomView.translatesAutoresizingMaskIntoConstraints = false
       bottomView.backgroundColor = UIColor.aquaColor



    }//




 }// Class
