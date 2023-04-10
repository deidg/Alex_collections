//
//  ArrayManager.swift
//  V3_collections
//
//  Created by Alex on 02.04.2023.
//

import Foundation
import UIKit
import SnapKit

class ArrayManager {
    
    let queue = DispatchQueue(label: "Array_manager_queue_working", qos: .userInitiated)
    
    var arr = [Int]()
    var arr2 = [Int]()
    
    
    func createArr(completion: ((Double) -> Void)?) {
        queue.async { [weak self] in
            guard let self else { return }
            
            
            
            let start = CFAbsoluteTimeGetCurrent()
            
            let arr = [Int](0..<10_000_000)
//            print(arr)
            let arr2 = [Int](0..<1_000)
            
            let result = CFAbsoluteTimeGetCurrent() - start
            self.arr = arr
            self.arr2 = arr2
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
    
//    var activityIndicator: UIActivityIndicatorView = {
//        let  activityIndicator = UIActivityIndicatorView()
//        activityIndicator.hidesWhenStopped = true
//        activityIndicator.style = .large
//        activityIndicator.color = UIColor.red
//       
//        return activityIndicator
//    }()
    
//    func activityIndicatorSetup() {
//        .addSubview(activityIndicator)
//        activityIndicator.snp.makeConstraints{ make in
//            make.center.equalToSuperview()
//        }
//    }
    
    func insertElementsBeginning1by1(){
//        activityIndicator.startAnimating()
        
        for i in (0..<1_000).reversed() {
            arr.insert(i, at: 0)
        }
//        activityIndicator.stopAnimating()
//        print(arr) // ("inserted 1000 elements at the beginning of the array one-by-one")
        print("1")
    }
    
    func insertElementsBeginningAtOnce(){
        arr.insert(contentsOf: arr2, at: 0)
        print(arr)
        print("2")
    }
    
    func insertElementsMiddle1by1(){
        for i in (0...1_000).reversed() {
            arr.insert(i, at: (arr.count/2)) // TODO: added backwords
        }
        print(arr)
        print("3")
        //    case "Insert 1000 elements in the middle of / the array one-by-one": print("3")
    }
    
    func insertElementsMiddleAtOnce(){
        arr.insert(contentsOf: arr2, at: arr.count/2)
        print(arr)
        print("4")
    }
 
    func insertElementsEnd1by1(){
        for var i in 0..<1_000 {
            arr.append(i) //+= i
            i += 1
        }
        print(arr)
        
        print("5")
        //        }
        //    case "Insert 1000 elements in the end of the array one-by-one": print("5")
    }
    
    func insertElementsEndAtOnce(){
        arr.append(contentsOf: arr2)  //insert(contentsOf: arr2, at: arr.endIndex)
        print(arr)
        print("6")
        //    case "Insert 1000 elements in the end of the array all at once": print("6")
    }
    
    ///==================================
    
    
    func removeElementsBeginning1by1(){
        for var i in 0..<1_000 {
            arr.remove(at: 0)
            i += i+1
        }
        print(arr)
        print("7")
        //case "Remove 1000 elements at the beginning of the array one-by-one": print("7")
    }
    
    func removeElementsBeginningAtOnce(){
        arr.removeFirst(1_000)  // TODO: added backwords
        print(arr)
        print("8")
        //case "Remove 1000 elements at the beginning of the array": print("8")
    }
    
    
    func removeElementsMiddle1by1(){
        for var i in 0..<1_000 {   //  counted both ways + change number of row!
            arr.remove(at: arr.count/2)
            i += i+1
        }
        
        print(arr)
        print("9")
        //case "Remove 1000 elements in the middle of the array one-by-one": print("9")
    }
    
    func removeElementsMiddleAtOnce(){
        
//        let range = arr.coun
        arr.removeSubrange(arr.count/2..<((arr.count/2)+arr2.count)) //(arr2.count, at: arr.count/2)
        
        print(arr)
        print("10")
        //case "Remove 1000 elements in the middle of the array": print("10")
    }
    
    
    
    func removeElementsEnd1by1(){
        for var i in 0..<1_000 {
            arr.removeLast()
            i += 1
        }
        print(arr)
        print("11")
    }
    
    //case "Remove 1000 elements at the end of the array one-by-one": print("11")
    //    }
    
    func removeElementsEndAtOnce(){
        
        arr.removeLast(1_000)// TODO: added backwords
        
        print(arr)
        print("12")   //case "Remove 1000 elements at the end of the array": print("12")
    }
   
}


