//
//  InputView.swift
//  Laddergame
//
//  Created by yangpc on 2017. 10. 16..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import Foundation
public enum InputError: Error {
    case emptyInput
    case invalidInput
    case outOfLength
}
struct InputView {
    private var names = [String]()
    private var height = 0
    
    mutating func read() throws -> ([String], Int)? {
        print("참여할 사람 이름을 입력하세요.")
        guard let n = readLine() else { throw InputError.emptyInput }
        switch n {
        case "": return nil
        case "s":
            if self.names.isEmpty { throw InputError.emptyInput }
        default:
            self.names = n.split(separator: ",").map(String.init)
            for name in self.names {
                if name == "" { throw InputError.invalidInput }
                if name.count > 5 { throw InputError.outOfLength }
            }
        }
        
        print("최대 사다리 높이는 몇 개인가요?")
        guard let m = readLine() else { throw InputError.emptyInput }
        switch m {
        case "" : return nil
        case "s": break
        default:
            guard let height = Int(m) else { throw InputError.invalidInput }
            self.height = height
        }
        return (self.names, self.height)
    }
    
}

