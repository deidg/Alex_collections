//
//  ArrayManager.swift
//  V3_collections
//
//  Created by Alex on 02.04.2023.

import Foundation

class ArrayManager {
    private let queue = DispatchQueue(label: "Array_manager_queue_working", qos: .userInitiated)
    private var arr = [Int]()
    private let arr2 = [Int](0..<1_000)
    func createArr(completion: ((Double) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            let arr = [Int](0..<1_000_000)
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
            self.arr = arr
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
    //MARK: methods
    func insertElementsBeginning1by1(completion: ((Double) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            for i in (0..<1_000).reversed() {
                self.arr.insert(i, at: 0)
            }
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
    
    func insertElementsBeginningAtOnce(completion: ((Double) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            self.arr.insert(contentsOf: self.arr2, at: 0)
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
    
    func insertElementsMiddle1by1(completion: ((Double) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            for i in (0...1_000).reversed() {
                self.arr.insert(i, at: (self.arr.count/2))
            }
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
    
    func insertElementsMiddleAtOnce(completion: ((Double) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            self.arr.insert(contentsOf: self.arr2, at: self.arr.count/2)
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
    
    func insertElementsEnd1by1(completion: ((Double) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            for var i in 0..<1_000 {
                self.arr.append(i) //+= i
                i += 1
            }
            let result = ((CFAbsoluteTimeGetCurrent() - start)*1000).rounded() / 1000
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
    
    func insertElementsEndAtOnce(completion: ((Double) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            self.arr.append(contentsOf: self.arr2)
            let result = ((CFAbsoluteTimeGetCurrent() - start)*10000).rounded() / 10000
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
    
    func removeElementsBeginning1by1(completion: ((Double) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            for var i in 0..<1_000 {
                self.arr.remove(at: 0)
                i += i+1
            }
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
    
    func removeElementsBeginningAtOnce(completion: ((Double) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            self.arr.removeFirst(1_000)
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
    
    func removeElementsMiddle1by1(completion: ((Double) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            for var i in 0..<1_000 {
                self.arr.remove(at: self.arr.count/2)
                i += i+1
            }
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
    
    func removeElementsMiddleAtOnce(completion: ((Double) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            self.arr.removeSubrange(self.arr.count/2 ..< ((self.arr.count/2) + self.arr2.count))
            let result = ((CFAbsoluteTimeGetCurrent() - start)*100).rounded() / 100
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
    
    func removeElementsEnd1by1(completion: ((Double) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            for var i in 0..<1_000 {
                self.arr.removeLast()
                i += 1
            }
            let result = ((CFAbsoluteTimeGetCurrent() - start)*10000).rounded() / 10000
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
    
    func removeElementsEndAtOnce(completion: ((Double) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            let start = CFAbsoluteTimeGetCurrent()
            self.arr.removeLast(1_000)
            let result = ((CFAbsoluteTimeGetCurrent() - start)*10000).rounded() / 10000
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
}


