//
//  LadderPlayer.swift
//  LadderGame
//
//  Created by 이진영 on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum PlayerNameError: Error {
    case invalidPlayerName
}

extension PlayerNameError: LocalizedError {
    public var errorDescription: String? {
        return "사람 이름 오류"
    }
}

struct LadderPlayer {
    private(set) var name: String
    
    init(name: String) throws {
        guard 1...5 ~= name.count else { throw PlayerNameError.invalidPlayerName }
        self.name = name
    }
}
