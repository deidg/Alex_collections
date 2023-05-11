//
//  SetManager.swift
//  V3_collections
//
//  Created by Alex on 10.05.2023.
//

import Foundation
import UIKit

class SetManager {
    //MARK: methods
    func findMatching(textField1: String, textField2: String, answerLabel1: UILabel) {
        let textFromTF1: String = textField1
        let charSet1 = Set(textFromTF1)
        let textFromTF2: String = textField2
        let charSet2 = Set(textFromTF2)
        let intersectionResult = String(charSet1.intersection(charSet2))
        answerLabel1.isHidden = false
        answerLabel1.text = intersectionResult
    }
    func findDifference(textFromTF1: String, textFromTF2: String, answerLabel2: UILabel) {
        let textFromTF1: String = textFromTF1
        let charSet1 = Set(textFromTF1)
        let textFromTF2: String = textFromTF2
        let charSet2 = Set(textFromTF2)
        let symmetricDifferenceResult = String(charSet1.symmetricDifference(charSet2))
        answerLabel2.isHidden = false
        answerLabel2.text = symmetricDifferenceResult
    }
    func findUniqueChars(textFromTF1: String, textFromTF2: String, answerLabel3: UILabel) {
        let textFromTF1: String = textFromTF1
        let charSet1 = Set(textFromTF1)
        let textFromTF2: String = textFromTF2
        let charSet2 = Set(textFromTF2)
        let intersectionResult = charSet1.intersection(charSet2)
        let unitedSet = intersectionResult.union(charSet2)
        let uniqueCharSet = String(charSet1.subtracting(unitedSet))
        answerLabel3.isHidden = false
        answerLabel3.text = uniqueCharSet
    }
    
}
