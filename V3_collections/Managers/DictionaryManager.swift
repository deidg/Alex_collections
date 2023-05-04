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
        var phoneNumber = String()
    }
    var contactArr: [Contact] = []

//    init() {
    func fillArray() {
        for i in 0..<10 {
            let name = "name\(i)"
            var randomNumber = Int.random(in: 1111111...9999999)
            let phoneNumber = String(randomNumber)
            let contact = Contact(name: name, phoneNumber: phoneNumber)

            contactArr.append(contact)

            print(contactArr[i].name)
            print(contactArr[i].phoneNumber)
        }
    }
    
    var contactDictionary: [String: String] = [:]
    

    func fillDictionary() {
        for i in 0..<10 {
            let name = "dictionaryName\(i)"
            var randomNumber = Int.random(in: 1111111...9999999)
            let phoneNumber = String(randomNumber)

            contactDictionary[name] = phoneNumber

        }
        print(contactDictionary)
    }
}

let dictionaryManager = DictionaryManager()
