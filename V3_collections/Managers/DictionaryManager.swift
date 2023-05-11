//
//  DictionaryManager.swift
//  V3_collections
//
//  Created by Alex on 21.04.2023.
//

import Foundation

class DictionaryManager {
    private let queue = DispatchQueue(label: "Dictionary_manager_queue_working", qos: .userInitiated)
    private struct Contact {
        var name = String()
        var phoneNumber = String()
    }
    private var contactArr: [Contact] = []
    func fillArray() {
        for i in 0..<1_000_000 {
            let name = "name\(i)"
            let randomNumber = Int.random(in: 1111111...9999999)
            let phoneNumber = String(randomNumber)
            let contact = Contact(name: name, phoneNumber: phoneNumber)
            contactArr.append(contact)
        }
    }
    private var contactDictionary: [String: String] = [:]
    func fillDictionary() {
        for i in 0..<1_000_000 {
            let name = "dictionaryName\(i)"
            let randomNumber = Int.random(in: 1111111...9999999)
            let phoneNumber = String(randomNumber)
            contactDictionary[name] = phoneNumber
        }
    }
    //MARK: methods
    //ARRAY
    func findFirstElenemtInArray(completion: ((Double, Int) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            let elementFromArray = self.contactArr.startIndex
            let element = Int(elementFromArray)
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
            DispatchQueue.main.async {
                completion?(result, element)
            }
        }
    }
    func findLastElenemtInArray(completion: ((Double, Int) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            let elementFromArray = (self.contactArr.count)-1
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
            DispatchQueue.main.async {
                completion?(result, elementFromArray)
            }
        }
    }
    func findNotExistingElenemtInArray(completion: ((Double, Bool) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            let nonExistingNumber = String((self.contactArr.count)-1)
            let nonExistingItem = "name\(nonExistingNumber)"
            let nonExistingElement = self.contactArr.contains { $0.name == nonExistingItem }
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
            DispatchQueue.main.async {
                completion?(result, nonExistingElement )
            }
        }
    }
    //DICTIONARY
    func findFirstElenemtInDictionary(completion: ((Double, Int) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            guard let elementFromDictionary = self.contactDictionary["dictionaryName0"] else { return }
            let element = Int(elementFromDictionary)
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
            DispatchQueue.main.async {
                completion?(result, element ?? 0)
            }
        }
    }
    func findLastElenemtInDictionary(completion: ((Double, Int) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            
            guard let elementFromDictionary = self.contactDictionary["dictionaryName999999"] else { return }
            let element = Int(elementFromDictionary)
            
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
            DispatchQueue.main.async {
                completion?(result, element ?? 0)
            }
        }
    }
    func findNotExistingElenemtInDictionary(completion: ((Double, Bool) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            let key = "name99999999"
            let keyExist = self.contactDictionary[key] != nil
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
            DispatchQueue.main.async {
                completion?(result, keyExist)
            }
        }
    }
}


