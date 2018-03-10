//
//  ViewController.swift
//  Trailer
//
//  Created by SimpuMind on 3/3/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    private lazy var coverImageView: UIImageView = {
       let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "movie")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "logo")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var logoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "TRAILER"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Black", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var coverView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var facebookButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.231372549, green: 0.3490196078, blue: 0.5960784314, alpha: 1)
        button.setTitle("Facebook", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "Avenir", size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var googleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Google", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.8666666667, green: 0.2941176471, blue: 0.2235294118, alpha: 1), for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "Avenir", size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var twitterButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1)
        button.setTitle("Twitter", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "Avenir", size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)
        [coverImageView, coverView].forEach {view.addSubview($0)}
        [logoImageView, logoTitleLabel, facebookButton, googleButton, twitterButton, skipButton].forEach{coverView.addSubview($0)}
        skipButton.addTarget(self, action: #selector(handleSkip), for: .touchUpInside)
    }
    
    @objc fileprivate func handleSkip(button: UIButton){
        UIApplication.shared.keyWindow?.rootViewController = MainTabViewController()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupContraints()
    }
    
    func setupContraints(){
        
        coverImageView.fill(view)
        coverView.fill(view)
        
        logoImageView.topAnchor.align(to: coverView.topAnchor, offset: 120)
        logoImageView.centerXAnchor.align(to: coverView.centerXAnchor)
        logoImageView.widthAnchor.equal(to: 104)
        logoImageView.heightAnchor.equal(to: 123)
        
        logoTitleLabel.widthAnchor.equal(to: 240)
        logoTitleLabel.topAnchor.align(to: logoImageView.bottomAnchor, offset: 60)
        logoTitleLabel.centerXAnchor.align(to: view.centerXAnchor)
        logoTitleLabel.heightAnchor.equal(to: 16)
        
        twitterButton.bottomAnchor.align(to: coverView.bottomAnchor, offset: -40)
        twitterButton.heightAnchor.equal(to: 45)
        twitterButton.leftAnchor.align(to: coverView.leftAnchor, offset: 20)
        twitterButton.widthAnchor.equal(to: (view.frame.width / 2) - 30)
        
        googleButton.bottomAnchor.align(to: coverView.bottomAnchor, offset: -40)
        googleButton.heightAnchor.equal(to: 45)
        googleButton.rightAnchor.align(to: coverView.rightAnchor, offset: -20)
        googleButton.widthAnchor.equal(to: (view.frame.width / 2) - 30)
        
        facebookButton.bottomAnchor.align(to: twitterButton.topAnchor, offset: -20)
        facebookButton.leftAnchor.align(to: coverView.leftAnchor, offset: 20)
        facebookButton.rightAnchor.align(to: coverView.rightAnchor, offset: -20)
        facebookButton.heightAnchor.equal(to: 45)
        
        skipButton.topAnchor.align(to: coverView.topAnchor, offset: 30)
        skipButton.rightAnchor.align(to: coverView.rightAnchor, offset: -10)
        skipButton.widthAnchor.equal(to: 60)
        skipButton.heightAnchor.equal(to: 45)
    }
}

class ButtonWithImage: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - 65), bottom: 5, right: 5)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)! + 40)
        }
    }
}

