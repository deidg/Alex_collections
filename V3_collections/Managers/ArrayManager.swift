//
//  ArrayManager.swift
//  V3_collections
//
//  Created by Alex on 02.04.2023.
//
//  TODO:  округлить значения до 0.00


import Foundation
import UIKit
import SnapKit

class ArrayManager {
    
    let queue = DispatchQueue(label: "Array_manager_queue_working", qos: .userInitiated)
    var arr = [Int]()
    var arr2 = [Int]()

    
//посмотреть еще раз что такое комплишн
    func createArr(completion: ((Double) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }    //  TODO: guard let self -  почитать
            
            let start = CFAbsoluteTimeGetCurrent()
            
            let arr = [Int](0..<3_000_000)
            let arr2 = [Int](0..<1_000)
                        
            let result = (CFAbsoluteTimeGetCurrent() - start).rounded()
            self.arr = arr
            self.arr2 = arr2
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
 
    func insertElementsBeginning1by1(completion: ((Double) -> Void)?) {
        
        queue.async { [weak self] in
            guard let self else { return }
            
            let start = CFAbsoluteTimeGetCurrent()
            
            for i in (0..<1_000).reversed() {
                self.arr.insert(i, at: 0)
            }
            
            let result = (CFAbsoluteTimeGetCurrent() - start).rounded()

            DispatchQueue.main.async {
                completion?(result)
            }
        }
        print("1")
    }
    
    func insertElementsBeginningAtOnce(completion: ((Double) -> Void)?) {
        
        queue.async { [weak self] in
            guard let self else { return }
            
            let start = CFAbsoluteTimeGetCurrent()
            
            self.arr.insert(contentsOf: self.arr2, at: 0)
           
            let result = CFAbsoluteTimeGetCurrent() - start
            
            DispatchQueue.main.async {
                completion?(result)
            }
        }
        print("2")
    }
    
    func insertElementsMiddle1by1(completion: ((Double) -> Void)?) {
        
        queue.async { [weak self] in
            guard let self else { return }
            
            let start = CFAbsoluteTimeGetCurrent()
            
            for i in (0...1_000).reversed() {
                self.arr.insert(i, at: (self.arr.count/2)) // TODO: added backwords
            }
            let result = CFAbsoluteTimeGetCurrent() - start
            
            DispatchQueue.main.async {
                completion?(result)
            }
        }
        print("3")
    }

    
    func insertElementsMiddleAtOnce(completion: ((Double) -> Void)?) {
        
        queue.async { [weak self] in
            guard let self else { return }
            
            let start = CFAbsoluteTimeGetCurrent()
            
            self.arr.insert(contentsOf: self.arr2, at: self.arr.count/2)

            let result = CFAbsoluteTimeGetCurrent() - start
            
            DispatchQueue.main.async {
                completion?(result)
            }
        }
        print("4")
    }

    func insertElementsEnd1by1(completion: ((Double) -> Void)?) {
        
        queue.async { [weak self] in
            guard let self else { return }
            
            let start = CFAbsoluteTimeGetCurrent()
            
            for var i in 0..<1_000 {
                self.arr.append(i) //+= i
                i += 1
            }
            let result = CFAbsoluteTimeGetCurrent() - start
            
            DispatchQueue.main.async {
                completion?(result)
            }
        }
        print("5")
    }
 
    func insertElementsEndAtOnce(completion: ((Double) -> Void)?) {
        
        queue.async { [weak self] in
            guard let self else { return }
            
            let start = CFAbsoluteTimeGetCurrent()
            
            self.arr.append(contentsOf: self.arr2)

            let result = CFAbsoluteTimeGetCurrent() - start
            
            DispatchQueue.main.async {
                completion?(result)
            }
        }
        print("6")
    }
 
    ///==================================
    func removeElementsBeginning1by1(completion: ((Double) -> Void)?) {
        
        queue.async { [weak self] in
            guard let self else { return }
            
            let start = CFAbsoluteTimeGetCurrent()
            
            for var i in 0..<1_000 {
                self.arr.remove(at: 0)
                i += i+1
            }
            let result = CFAbsoluteTimeGetCurrent() - start
            
            DispatchQueue.main.async {
                completion?(result)
            }
        }
        print("7")
    }
  
    func removeElementsBeginningAtOnce(completion: ((Double) -> Void)?) {
        
        queue.async { [weak self] in
            guard let self else { return }
            
            let start = CFAbsoluteTimeGetCurrent()
            
            self.arr.removeFirst(1_000)  // TODO: added backwords

            let result = CFAbsoluteTimeGetCurrent() - start
            
            DispatchQueue.main.async {
                completion?(result)
            }
        }
        print("8")
    }
    
    func removeElementsMiddle1by1(completion: ((Double) -> Void)?) {
        
        queue.async { [weak self] in
            guard let self else { return }
            
            let start = CFAbsoluteTimeGetCurrent()
            
            for var i in 0..<1_000 {   //  counted both ways + change number of row!
                self.arr.remove(at: self.arr.count/2)
                i += i+1
            }
            let result = CFAbsoluteTimeGetCurrent() - start
            
            DispatchQueue.main.async {
                completion?(result)
            }
        }
        print("9")
    }
    
    func removeElementsMiddleAtOnce(completion: ((Double) -> Void)?) {
        
        queue.async { [weak self] in
            guard let self else { return }
            
            let start = CFAbsoluteTimeGetCurrent()
            
            self.arr.removeSubrange(self.arr.count/2 ..< ((self.arr.count/2) + self.arr2.count)) //(arr2.count, at: arr.count/2)
            
            let result = CFAbsoluteTimeGetCurrent() - start
            
            DispatchQueue.main.async {
                completion?(result)
            }
        }
        print("10")
    }
 
    func removeElementsEnd1by1(completion: ((Double) -> Void)?) {
        
        queue.async { [weak self] in
            guard let self else { return }
            
            let start = CFAbsoluteTimeGetCurrent()
            
            for var i in 0..<1_000 {
                self.arr.removeLast()
                i += 1
            }
            
            let result = CFAbsoluteTimeGetCurrent() - start
            
            DispatchQueue.main.async {
                completion?(result)
            }
        }
        print("11")
    }
    
    func removeElementsEndAtOnce(completion: ((Double) -> Void)?) {
            
            queue.async { [weak self] in
                guard let self else { return }
                
                let start = CFAbsoluteTimeGetCurrent()
                
                self.arr.removeLast(1_000)// TODO: added backwords
                
                let result = CFAbsoluteTimeGetCurrent() - start

                
                DispatchQueue.main.async {
                    completion?(result)
                }
            }
            print("12")
        }
}


