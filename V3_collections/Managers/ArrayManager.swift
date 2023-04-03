//
//  ArrayManager.swift
//  V3_collections
//
//  Created by Alex on 02.04.2023.
//

import Foundation
import UIKit

class ArrayManager {
    
    func createArray() -> Double {
        
        let start = Date()

        var integerArray = [Int](0...4_000_000)
        
        let end = Date()
        
        var consumedTime: Double = end.timeIntervalSince(start)
        var consumedTimeRounded = (consumedTime*100).rounded()/100

        return Double(consumedTimeRounded)
    }
    
    
    
    
    func genarationTimeCounter() {
        let start = Date.timeIntervalSinceReferenceDate
        
        var integerArray = [Int](0...10_000_000)
        
        let end = Date.timeIntervalSinceReferenceDate
        let secondsElapsed = end - start
    }
    
    // insert at the Beginning
    func insertAtBegining1b1(){
        
    }
    func insertAtBeginingAtOnce() {
        
    }
    
   // insert in the Middle
    func insertInMiddle1b1(){
        
    }
    func insertInMiddleAtOnce(){
        
    }
    
    // insert in the End
    func insertInTheEnd1b1(){
        
    }
    func insertInTheEndAtOnce(){
        
    }

    
    // remove at the Beginning
    func removeAtBegining1b1(){
        
    }
    func removeAtBegining() {
        
    }
    
   // remove in the Middle
    func removeInMiddle1b1(){
        
    }
    func removeInMiddle(){
        
    }
    
    // remove in the End
    func removeInTheEnd1b1(){
        
    }
    func removeInTheEnd(){
        
    }
    
    
    
}
