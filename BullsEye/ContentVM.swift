//
//  ContentVM.swift
//  BullsEye
//
//  Created by Wiktor Gała on 13/12/2021.
//

import Foundation

class ContentVM: ObservableObject {
    @Published var randomTarget = 0
    @Published var value = 50.0
    @Published var totalScore = 0
    
    @Published var alertMessage = ""
    @Published var presentAlert = false
    
    init() {
        randomizeTarget()
    }
    
    func randomizeTarget() {
        randomTarget = Int.random(in: 1...100)
    }
    
    func submit() {
        let points = 100 - abs(randomTarget - Int(value))
        evaluateScore(score: points)
        randomizeTarget()
    }
    
    func evaluateScore(score: Int) {
        switch score {
        case 100:
            alertMessage = "Bullseye!"
            print("Bullseye")
        case 95...99:
            alertMessage = "Great!"
            print("Great")
        case 80...94:
            alertMessage = "Good!"
            print("Good!")
        case 70...79:
            alertMessage = "Decent!"
            print("Decent!")
        default:
            alertMessage = "Poor!"
            print("Poor!")
        }
        
        presentAlert.toggle()
        value = 50.0
        totalScore += score
    }
}
