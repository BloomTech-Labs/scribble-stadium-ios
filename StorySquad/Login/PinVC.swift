//
//  PinVC.swift
//  StorySquad
//
//  Created by Ian French on 6/7/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//


import UIKit

class PinCodeTextField: UITextField {
    //my code
    private var isConfigured = false
    
    private var pinLabels = [UILabel]()
    
    func configure(with slotCount: Int = 4) {
        guard isConfigured == false else {return}
        isConfigured.toggle()
        
        configureTextField()
        
        let labelsStackView = createPinCodeStackView(with: slotCount)
        addSubview(labelsStackView)
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }//
    
    private func configureTextField() {
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
        textContentType = .oneTimeCode
    }//
    
    private func createPinCodeStackView(with count: Int) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        for _ in 1...count {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 40)
            label.backgroundColor = .white
            label.isUserInteractionEnabled = true
            
            stackView.addArrangedSubview(label)
            pinLabels.append(label)
        }//
        
        
        return stackView
    }//

}//


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
//my code
    let pinCodeTextField: UITextField = {
        let pinCode = PinCodeTextField()
        pinCode.configure()
        return pinCode
    }()

//    lazy var pinStackView: UIStackView = {
//        let pinStack = UIStackView()
//        let pin_one = UITextField()
//        let pin_two = UITextField()
//        let pin_three = UITextField()
//        let pin_four = UITextField()
//        pinStack.distribution = .fillEqually
//        pinStack.spacing = 10
//        pinStack.axis = .horizontal
//        pinStack.addArrangedSubview(pin_one)
//        pinStack.addArrangedSubview(pin_two)
//        pinStack.addArrangedSubview(pin_three)
//        pinStack.addArrangedSubview(pin_four)
//        return pinStack
//
//    }()


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


     override func viewDidLoad() {
         super.viewDidLoad()
       view.backgroundColor = UIColor.aquaColor

       configureUI()
     }//


    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func configureUI() {
       view.addSubviewsUsingAutolayout(backView)
       setupBackView()
    }

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

        middleView.addSubviewsUsingAutolayout(pinCodeTextField)
          middleView.anchor(
             size: .init(width: backView.frame.width, height: 250)
          )
        middleView.translatesAutoresizingMaskIntoConstraints = false
        middleView.backgroundColor = UIColor.aquaColor

        pinCodeTextField.anchor(
            leading: middleView.leadingAnchor, trailing: middleView.trailingAnchor, bottom: middleView.centerYAnchor,
            padding: .init(top: 25, left: 35, bottom: -25, right: -35)
        )
        pinCodeTextField.clipsToBounds = true

       bottomView.anchor(

       )
       bottomView.translatesAutoresizingMaskIntoConstraints = false
       bottomView.backgroundColor = UIColor.aquaColor

    }//

 }//
