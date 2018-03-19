//
//  LadderConnectController.swift
//  LadderGame
//
//  Created by Jung seoung Yeo on 2018. 3. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

func isConnect() -> Bool {
    if (makeRandomValue() % 2) == 0 {
        return true
    }
    return false
}

private func makeRandomValue() -> Int {
    return Int(arc4random_uniform(UINT32_MAX))
}
