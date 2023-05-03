//
//  DictionaryManager.swift
//  V3_collections
//
//  Created by Alex on 21.04.2023.
//

import Foundation

class DictionaryManager {
    
    
    struct Contact {
        var name = String()
        var phoneNumber = Int()
    }
    
    let contactArr: [Contact] = []
    
    
    
    let queue = DispatchQueue(label: "Dicitionary_manager_queue_working", qos: .userInitiated)
    
    
    
//    let arr = [Int](0..<1_000)
//
//    func printArr() {
//
//        print("herr")
//
//    }
    
}
