//
//  CardSellectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by Mikolaj Lukasik on 24/04/2020.
//  Copyright © 2020 Mikolaj Lukasik. All rights reserved.
//

import UIKit

class CardSellectionVC: UIViewController {
    
    let cardImageView   = UIImageView()
    let stopButton      = CWButton(backgroundColor: .systemRed, title: "STOP!")
    let restartButton   = CWButton(backgroundColor: .systemGreen, title: "RESET")
    let rulesButton     = CWButton(backgroundColor: .systemBlue, title: "RULES")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        // Do any additional setup after loading the view.
        configureUI()
        
    }
    
    
    
    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureRestartButton()
        configureRulesButton()
    }

    
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    func configureStopButton() {
        view.addSubview(stopButton)
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 250),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    func configureRestartButton() {
        view.addSubview(restartButton)
        NSLayoutConstraint.activate([
            restartButton.widthAnchor.constraint(equalToConstant: 110),
            restartButton.heightAnchor.constraint(equalToConstant: 50),
            restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 30),
            restartButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -15)
        ])
    }
    
    
    func configureRulesButton() {
        view.addSubview(rulesButton)
        
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 110),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 30),
            rulesButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 15)
        ])
    }
    
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
    }
    
}
