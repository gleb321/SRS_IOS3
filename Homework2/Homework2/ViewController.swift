//
//  ViewController.swift
//  Homework2
//
//  Created by Gleb Evlakhov on 10.10.2022.
//  Copyright © 2022 Gleb Evlakhov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var value: Int = 0
    private let valueLabel: UILabel = UILabel()
    private let commentLabel: UILabel = UILabel()
    private let incrementButton: UIButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = UIColor.lightGray
        self.setupUI()
    }

    private func setupButton() {
        self.view.addSubview(incrementButton)
        incrementButton.setTitle("Press me", for: .normal)
        incrementButton.setTitleColor(UIColor.black, for: .normal)
        incrementButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        incrementButton.backgroundColor = UIColor.white
        incrementButton.layer.cornerRadius = 15
        incrementButton.pinCenter(to: self.view)
        incrementButton.setHeight(60)
        incrementButton.setWidth(300)
        incrementButton.addTarget(self, action: #selector(incrementButtonPressed), for: .touchUpInside)
    }
    
    private func setupValueLabel() {
        self.view.addSubview(valueLabel)
        valueLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        valueLabel.textColor = UIColor.black
        valueLabel.text = "\(value)"
        valueLabel.textAlignment = NSTextAlignment.center
        valueLabel.pinCenterX(to: self.view)
        valueLabel.pinBottom(to: incrementButton.topAnchor, 20)
    }
    
    private func setupCommentLabel() {
        self.view.addSubview(commentLabel)
        commentLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        commentLabel.text = "Welcome"
        commentLabel.textColor = UIColor.black
        commentLabel.textAlignment = NSTextAlignment.center
        commentLabel.backgroundColor = UIColor.white
        commentLabel.setHeight(100)
        commentLabel.setWidth(250)
        commentLabel.numberOfLines = 2
        commentLabel.layer.masksToBounds = true
        commentLabel.layer.cornerRadius = 20
        commentLabel.pinCenterX(to: self.view)
        commentLabel.pinTop(to: self.view.safeAreaLayoutGuide.topAnchor, 20)
    }

    @objc
    private func incrementButtonPressed() {
        value += 1
        updateUI();
    }
    
    private func setupUI() {
        setupButton()
        setupValueLabel()
        setupCommentLabel()
        setupMenuButtons()
    }
    
    private func updateUI() {
        self.updateValueLabel()
        self.updateCommentLabel()
    }

    private func updateValueLabel() {
        valueLabel.text = "\(value)"
    }
    
    private func updateCommentLabel() {
        var text: String?
        switch value {
            case 0...10:
                text = "Come on lil snail\n🐌"
            case 10...20:
                text = "Nah, ur a turtle\n🐢"
            case 20...30:
                text = "Oh, looks like a caterpillar\n🐛"
            case 30...40:
                text = "You are a butterfly now\n🦋"
            case 40...50:
                text = "Mb you are cheetah\n🐆"
            case 50...60:
                text = "Daaaamn\n👀"
            case 60...70:
                text = "Damn ur fast\n🏎"
            case 70...80:
                text = "You are a star\n⭐"
            case 80...90:
                text = "Go little rockstar\n🎸"
            case 90...100:
                text = "To the moon\n🚀"
            default:
                text = "Well done\n🌑"
        }
        
        if (value % 10 == 1) {
            self.incrementButton.isEnabled = false
            UIView.animate(withDuration: 1.5, animations: {
                self.commentLabel.alpha = 0
                self.commentLabel.text = text
                self.commentLabel.alpha = 1
            }) {completion in self.incrementButton.isEnabled = true}
        } else {
            self.commentLabel.text = text
        }
    }
    
    private func setupMenuButtons() {
        let colorsButton = makeMenuButton(title: "🎨")
        let notesButton = makeMenuButton(title: "📝")
        let newsButton = makeMenuButton(title: "📰")
        let buttonsSV = UIStackView(arrangedSubviews: [colorsButton, notesButton, newsButton])
        buttonsSV.spacing = 15
        buttonsSV.axis = .horizontal
        buttonsSV.distribution = .fillEqually
        self.view.addSubview(buttonsSV)
        buttonsSV.pin(to: self.view, [.left: 24, .right: 24])
        buttonsSV.pinBottom(to: self.view.safeAreaLayoutGuide.bottomAnchor, 24)
    }
    
    private func makeMenuButton(title: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        return button
    }
}
