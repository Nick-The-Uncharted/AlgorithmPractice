//
//  HouseRob2.swift
//  AlgorithmPractice
//
//  Created by administrasion on 7/9/16.
//  Copyright © 2016 NJU. All rights reserved.
//

import Foundation

//
//  HouseRob.swift
//  AlgorithmPractice
//
//  Created by administrasion on 7/9/16.
//  Copyright © 2016 NJU. All rights reserved.
//

import Foundation
class HouseRob2 {
    var cache = [Int: Int]()
    
    func rob(nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        //        return max(maxRobValue(nums, start: 0, end: nums.count - 1), maxRobValue(nums, start: 1, end: nums.count))
        return max(rob2(nums, start: 0 , end: nums.count - 1), rob2(nums, start: 1 , end: nums.count))
    }
    
    func maxRobValue(nums: [Int], start: Int, end: Int) -> Int {
        if let result = cache[start * nums.count + end] {
            return result
        }
        guard start < end else {return 0}
        if start +  1 == end {
            return nums[start]
        } else if start + 2 == end {
            return max(nums[start], nums[start + 1])
        }
        
        
        var maxValue = 0;
        for i in 0 ..< min(2, end - start) {
            maxValue = max(maxValue, nums[start + i] + maxRobValue(nums, start: start + i + 2, end: end))
        }
        
        cache[start * nums.count + end] = maxValue
        return maxValue
    }
    
    func rob2(nums: [Int], start: Int, end: Int) -> Int {
        if nums.isEmpty {
            return 0
        }
        var odd = 0, even = 0
        for (index, num) in nums[start ..< end].enumerate() {
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

Solution().rob([1])