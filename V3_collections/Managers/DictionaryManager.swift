//
//  DictionaryManager.swift
//  V3_collections
//
//  Created by Alex on 21.04.2023.
//

import Foundation

class DictionaryManager {
    
    let queue = DispatchQueue(label: "Dictionary_manager_queue_working", qos: .userInitiated)
    struct Contact {
        var name = String()
        var phoneNumber = String()
    }
    var contactArr: [Contact] = []
    
    
//    func createArrAndDict(completion: ((Double) -> Void)?) {
        //    init() {
        func fillArray() {
            for i in 0..<100 {
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
            for i in 0..<100 {
                let name = "dictionaryName\(i)"
                var randomNumber = Int.random(in: 1111111...9999999)
                let phoneNumber = String(randomNumber)
                
                contactDictionary[name] = phoneNumber
                
            }
            print(contactDictionary)
        }
    
    func findFirstElenemtInArray(completion: ((Double, String?) -> Void)?) {
        
        queue.async { [weak self] in
            guard let self else { return }
            
            let start = CFAbsoluteTimeGetCurrent()
            
            let firstElement = self.contactArr.first?.name //firstIndex //first?
//            let firstElement = String(element)
            print(firstElement ?? "")
            
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100

            
            DispatchQueue.main.async {
                completion?(result, firstElement)
                
//                не могу понять почему не работает комлишн хендлер.
            }
        }
        print("1")
    }
    
    
    }
//}

let dictionaryManager = DictionaryManager()


