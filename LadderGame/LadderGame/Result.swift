//
//  Display.swift
//  LadderGame
//
//  Created by 이동건 on 17/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct Result{
    var element: [[String]]?
    
    func display() {
        guard let element = element else { return }
        element.forEach{print(generateDisplayForm(stage: $0))}
    }
    
    func generateDisplayForm(stage: [String]) -> String {
        let displayForm = stage.reduce("|") { "\($0)\($1)|" }
        return displayForm
    }
}
