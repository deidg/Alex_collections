//
//  DictionaryController.swift
//  V3_collections
//
//  Created by Alex on 22.03.2023.
//

import UIKit


class DictionaryController: UIViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(arr)
//        print(dictionary)
        view?.backgroundColor = .cyan
        
        makingCollections()
    }
    
    
    func makingCollections() {
        let array = [Int](0..<1_000_000)
        var dictionary: [Int: String] = [:]
        for i in 0...100 {
            dictionary[i] = "\(i)"
        }
        print(dictionary)
        
    }
}
