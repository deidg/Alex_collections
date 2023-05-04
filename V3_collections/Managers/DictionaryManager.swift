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
        var phoneNumber = String() //Int()
    }
    
    var contactArr: [Contact] = []
    
    //    var i = 0
    //    while i < 3 {
    init() {
        for i in 0..<10 {
            let name = "name\(i)"
            var randomNumber = Int.random(in: 1111111...9999999)
            let phoneNumber = String(randomNumber)
            let contact = Contact(name: name, phoneNumber: phoneNumber)
            
            contactArr.append(contact)
            
                    print(contactArr[i].name)
            print(contactArr[i].phoneNumber)
            //        i += 1
        }
    }
}




//    let queue = DispatchQueue(label: "Dicitionary_manager_queue_working", qos: .userInitiated)



//    let arr = [Int](0..<1_000)
//
//    func printArr() {
//
//        print("herr")
//
//    }

//}
