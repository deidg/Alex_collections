//
//  DictionaryManager.swift
//  V3_collections
//
//  Created by Alex on 21.04.2023.
//


//увеличить кол- во элементов и посомтреть на большоам количестве.
//сделать активит индикатор во время создания коллекций
//разделить в разные потоки поиск несуществующих элементов
//зачистить всё.

import Foundation

class DictionaryManager {
    
    let queue = DispatchQueue(label: "Dictionary_manager_queue_working", qos: .userInitiated)
    struct Contact {
        var name = String()
        var phoneNumber = String()
    }
    var contactArr: [Contact] = []
    
        func fillArray() {
            for i in 0..<10_000_000 {
                let name = "name\(i)"
                var randomNumber = Int.random(in: 1111111...9999999)
                let phoneNumber = String(randomNumber)
                let contact = Contact(name: name, phoneNumber: phoneNumber)
                
                contactArr.append(contact)
                
//                print(contactArr[i].name)
//                print(contactArr[i].phoneNumber)
            }
    }
    
    var contactDictionary: [String: String] = [:]
    func fillDictionary() {
        for i in 0..<10_000_000 {
            let name = "dictionaryName\(i)"
            var randomNumber = Int.random(in: 1111111...9999999)
            let phoneNumber = String(randomNumber)
            
            contactDictionary[name] = phoneNumber
        }
//        print(contactDictionary)
    }
    //ARRAY
    // FIRST
    func findFirstElenemtInArray(completion: ((Double, Int) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            
            let start = CFAbsoluteTimeGetCurrent()
            
            let elementFromArray = self.contactArr.startIndex 
            let element = Int(elementFromArray)
            print(element)
            
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
            
            DispatchQueue.main.async {
                completion?(result, element)
            }
        }
        print("1")
    }
    //LAST
    func findLastElenemtInArray(completion: ((Double, Int) -> Void)?) {
        
        queue.async { [weak self] in
            guard let self else { return }
            
            let start = CFAbsoluteTimeGetCurrent()
            
            let elementFromArray = (self.contactArr.count)-1
            print(elementFromArray)
            
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
            
            DispatchQueue.main.async {
                completion?(result, elementFromArray)
            }
        }
        print("1")
    }
    // NOT EXISTING
        func findNotExistingElenemtInArray(completion: ((Double, Bool) -> Void)?) {
    
            queue.async { [weak self] in
                guard let self else { return }
    
                let start = CFAbsoluteTimeGetCurrent()
    
                let notExistingNumber = String((self.contactArr.count))
                print("not existing number - \(notExistingNumber)") // удалить

                let notExistingElement = "name234458678"//"name\(notExistingNumber)" //"name2"//
                print(notExistingElement)  // удалить

                let doesContain = self.contactArr.contains { $0.name == notExistingElement }

                let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
    
                DispatchQueue.main.async {
                    completion?(result, doesContain )
                }
            }
            print("1")
        }
    
    //DICTIONARY
    // FIRST element
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
        print("4")
    }
    // LAST element
    func findLastElenemtInDictionary(completion: ((Double, Int) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            
            let start = CFAbsoluteTimeGetCurrent()
            
            guard let elementFromDictionary = self.contactDictionary["dictionaryName99"] else { return }
            let element = Int(elementFromDictionary)
            
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
            
            DispatchQueue.main.async {
                completion?(result, element ?? 0)
            }
        }
        print("from Dictionary manager 6") // to delete
    }

//NOT EXISTING
func findNotExistingElenemtInDictionary(completion: ((Double, Bool) -> Void)?) {

    queue.async { [weak self] in
        guard let self else { return }

        let start = CFAbsoluteTimeGetCurrent()

        let notExistingNumber = String((self.contactDictionary.count))
        print("not existing number - \(notExistingNumber)")  // удалить

        let notExistingElement = "name234458678"// "name\(notExistingNumber)" //"name2"//
        print(notExistingElement)   // удалить

        let doesContain = self.contactArr.contains { $0.name == notExistingElement }

        let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100

        DispatchQueue.main.async {
            completion?(result, doesContain )
        }
    }
    print("1")
}

}

let dictionaryManager = DictionaryManager()


