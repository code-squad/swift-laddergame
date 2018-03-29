//
//  Input.swift
//  LadderGame
//
//  Created by Jung seoung Yeo on 2018. 3. 29..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//
struct Input {
    func heigth() throws -> Int {
        guard let inputText = readLine() else {
            throw LadderGameError.isEmptyError
        }
        
        guard let convertInt = Int(inputText) else {
            throw LadderGameError.convertError
        }
        
        return convertInt
    }
    
    func playerNames() throws -> [LadderPlayer] {
        guard let names = readLine() else {
            throw LadderGameError.isEmptyError
        }
        return names.split(separator: ",").map{
                String($0)
                }.map{ LadderPlayer(name: $0) }
    }
}
