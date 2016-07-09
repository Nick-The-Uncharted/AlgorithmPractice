//
//  HouseRob.swift
//  AlgorithmPractice
//
//  Created by administrasion on 7/9/16.
//  Copyright © 2016 NJU. All rights reserved.
//

import Foundation
class HouseRob {
    var cache = [Int: Int]()
    
    func rob(nums: [Int]) -> Int {
        return maxRobValue(nums, start: 0)
    }
    
    func maxRobValue(nums: [Int], start: Int) -> Int {
        if let result = cache[start] {
            return result
        }
        guard start < nums.count else {return 0}
        if start +  1 == nums.count {
            return nums[start]
        } else if start + 2 == nums.count {
            return max(nums[start], nums[start + 1])
        }
        
        
        var maxValue = 0;
        for i in 0 ..< min(2, nums.count - start) {
            maxValue = max(maxValue, nums[start + i] + maxRobValue(nums, start: start + i + 2))
        }
        
        cache[start] = maxValue
        return maxValue
    }
    
    func rob2(nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        var odd = 0, even = 0
        for (index, num) in nums.enumerate() {
            if index % 2 == 0 {
                even += num
                even = max(odd, even)
            } else {
                odd += num
                odd = max(odd, even)
            }
        }
        
        return max(odd, even)
    }
}