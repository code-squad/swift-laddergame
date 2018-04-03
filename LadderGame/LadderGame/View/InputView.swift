//
//  InputView.swift
//  LadderGame
//
//  Created by Jung seoung Yeo on 2018. 4. 2..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//
struct InputView {
    
    private func inputText() throws -> String {
        guard let inputText = readLine() else {
            throw LadderGameError.isEmptyError
        }
        return inputText
    }
    
    func height() throws -> Int {
        let inputText = try self.inputText()
        guard let height = Int(inputText) else {
            throw LadderGameError.convertError
        }
        
        return height
    }
    
    func playerNames() throws -> [LadderPlayer] {
        let names = try inputText()
        return names.split(separator: ",").map{
            String($0)
            }.map{ LadderPlayer(name: $0) }
    }
}
