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
            let phoneNumber = "333-333-\(i)"
            let contact = Contact(name: name, phoneNumber: phoneNumber)
            
            contactArr.append(contact)
            
            //        print(contactArr[i].name)
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
