//
//  CardSellectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by Mikolaj Lukasik on 24/04/2020.
//  Copyright © 2020 Mikolaj Lukasik. All rights reserved.
//

import UIKit

class CardSellectionVC: UIViewController {
    
    var cards: [UIImage]    = []
    var timer: Timer!
    
    let cardImageView       = UIImageView()
    let stopButton          = CWButton(backgroundColor: .systemRed, title: "STOP!")
    let restartButton       = CWButton(backgroundColor: .systemGreen, title: "RESET")
    let rulesButton         = CWButton(backgroundColor: .systemBlue, title: "RULES")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        // Do any additional setup after loading the view.
        populateCards()
        configureUI()
        startTimer()
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        stopTimer()
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.125, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement()
    }
    
    @objc func stopTimer(){
        timer.invalidate()
    }
    
    @objc func restartTimer(){
        stopTimer()
        startTimer()
    }
    
    
    func populateCards() {
        let cardsRange = (2...10).map{String($0)}
        let cardsFigures = ["J", "Q", "K", "A"]
        let cardValues = cardsRange + cardsFigures
        let cardColours = ["C", "D", "H", "S"]
        
        for i in cardValues {
           for j in cardColours {
            cards.append(UIImage(named: i+j) ?? UIImage())
           }
        }
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
        
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
    }
    
    
    func configureRestartButton() {
        view.addSubview(restartButton)
        NSLayoutConstraint.activate([
            restartButton.widthAnchor.constraint(equalToConstant: 110),
            restartButton.heightAnchor.constraint(equalToConstant: 50),
            restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 30),
            restartButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -15)
        ])
        
        restartButton.addTarget(self, action: #selector(restartTimer), for: .touchUpInside)
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
