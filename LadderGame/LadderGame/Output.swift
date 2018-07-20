//
//  Output.swift
//  LadderGame
//
//  Created by 이동건 on 20/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    static func display(_ ladder: [String]){
        ladder.forEach {print($0)}
    }
}
