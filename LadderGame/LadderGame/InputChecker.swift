//
//  InputChecker.swift
//  LadderGame
//
//  Created by moon on 2018. 3. 26..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//


/// Invalid check player names and height
struct InputChecker {
    
    func check(height: Int, names: [String]) -> Bool {
        return self.checkHeight(height) || self.checkName(names)
    }
    
    private func checkHeight(_ height: Int) -> Bool {
        return 1 > height || height > Int.max
    }
    
    private func checkName(_ names: [String]) -> Bool {
        var flag = false
        
        for name in names {
            flag = checkNameLength(name)
        }
        
        return flag || names.isEmpty
    }
    
    private func checkNameLength(_ name: String) -> Bool {
        return name.count > 5
    }
}
