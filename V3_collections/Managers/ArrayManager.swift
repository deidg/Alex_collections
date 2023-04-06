//
//  ArrayManager.swift
//  V3_collections
//
//  Created by Alex on 02.04.2023.
//

import Foundation

class ArrayManager {
    
    let queue = DispatchQueue(label: "Array_manager_queue_working", qos: .userInitiated)
    
    var arr = [Int]()
    
    func createArr(completion: ((Double) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            
            let start = CFAbsoluteTimeGetCurrent()
            
            let arr = [Int](0..<100_000)
            
            let result = CFAbsoluteTimeGetCurrent() - start
            self.arr = arr
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
  
}
