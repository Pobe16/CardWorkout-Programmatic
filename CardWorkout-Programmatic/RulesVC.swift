//
//  RulesVC.swift
//  CardWorkout-Programmatic
//
//  Created by Mikolaj Lukasik on 24/04/2020.
//  Copyright © 2020 Mikolaj Lukasik. All rights reserved.
//

import UIKit

class RulesVC: UIViewController {
    
    let titleLabel = UILabel()
    let rulesLabel = UILabel()
    let exerciseLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureTitleLabel()
        configureRulesLabel()
        configureExerciseLabel()
    }
    
    
    func configureTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.text = "Rules"
        
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        
        titleLabel.textAlignment = .center
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }

    
    func configureRulesLabel() {
        view.addSubview(rulesLabel)
        
        rulesLabel.text =
        """
        The value of each card represents the number of exercises you do.
        
        J= 11, Q=12, K=13, A=14
        """
        
        rulesLabel.numberOfLines = 0
        rulesLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        rulesLabel.textAlignment = .center
        
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
    }
    
    func configureExerciseLabel() {
        view.addSubview(exerciseLabel)
        
        exerciseLabel.text =
        """
        ♠️ = Push-up
        
        ♥️ = Sit-up
        
        ♣️ = Burpees
        
        ♦️ = Jumping Jacks
        """
        
        exerciseLabel.numberOfLines = 0
        exerciseLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        exerciseLabel.textAlignment = .natural
        
        exerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 75),
            exerciseLabel.widthAnchor.constraint(equalToConstant: 200),
            exerciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
