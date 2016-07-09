//
//  TwoSum.swift
//  AlgorithmPractice
//
//  Created by administrasion on 7/8/16.
//  Copyright © 2016 NJU. All rights reserved.
//

import Foundation
import Foundation

extension Array where Element: Comparable {
    func binarySearch(num: Generator.Element, startIndex: Int = 0, endIndex: Int = -1) -> Int? {
        //        return self.indexOf(num)
        var endIndex = endIndex
        if endIndex == -1 {
            endIndex = self.count
        }
        let midIndex = (startIndex + endIndex) / 2
        let midNum = self[midIndex]
        
        if midNum == num {
            return midIndex
            
        } else if num < midNum && midIndex - startIndex >= 1 {
            return binarySearch(num, startIndex: startIndex, endIndex: midIndex)
        } else if num > midNum && endIndex - midIndex - 1 >= 1 {
            return binarySearch(num, startIndex: midIndex + 1, endIndex: endIndex)
        } else {
            return nil
        }
    }
}


class TwoSum {
    func twoSum(nums: [Int], _ target: Int) -> [Int] {
        if let min = nums.minElement(), max = nums.maxElement() {
            // $0.0 是index， $0.1 是 element
            let filteredNums = nums.enumerate().filter {target - max ... target - min ~= $0.1}
            let equalPart = filteredNums.filter {$0.1 * 2 == target}
            if equalPart.count >= 2 {
                return Array(equalPart[0 ... 1].map{$0.0})
            }
            var smallPart = filteredNums.filter {$0.1 * 2 < target}
            smallPart.sortInPlace {$0.1 < $1.1}
            var bigPart = filteredNums.filter {$0.1 * 2 > target}
            bigPart.sortInPlace {$0.1 < $1.1}
            
            var examPart = [(index: Int,element: Int)]()
            var otherPart = [(index: Int,element: Int)]()
            if smallPart.count < bigPart.count {
                examPart = smallPart
                otherPart = bigPart
            } else {
                examPart = bigPart
                otherPart = smallPart
            }
            
            let otherPartElements = otherPart.map {$0.element}
            
            for tuple in examPart {
                if let index = otherPartElements.binarySearch(target - tuple.element) {
                    return [tuple.index, otherPart[index].index]
                }
            }
        }
        fatalError("nums is Empty")
    }
}