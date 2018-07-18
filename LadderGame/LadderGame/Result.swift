//
//  Display.swift
//  LadderGame
//
//  Created by 이동건 on 17/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct Result{
    
    private enum Bridge: String{
        case exist = "-----"
        case none = "     "
    }
    
    private var element: [[Bool]]?
    private var applicants: [LadderPlayer]?
    
    init(element: [[Bool]]?, applicants: [LadderPlayer]?) {
        self.element = element
        self.applicants = applicants
    }
    
    func display() {
        guard let element = element else { return }
        guard let applicants = applicants else { return }
        element.forEach{print(generateLadderDisplayForm(stage: $0))}
        let names = generateApplicantsDisplayForm(applicants)
        names.forEach {print($0, terminator: "")}
    }
    
    private func generateLadderDisplayForm(stage: [Bool]) -> String {
        let displayForm = stage.reduce("   |") { (result, isBridge) -> String in
            let bridge = isBridge ? Bridge.exist.rawValue : Bridge.none.rawValue
            return "\(result)\(bridge)|"
        }
        return displayForm
    }
    
    private func generateApplicantsDisplayForm(_ applicants: [LadderPlayer]) -> [String] {
        return applicants.map {addBlank(to: $0.name)}
    }
    
    // 이름들을 일정한 간격을 두고 출력하기 위해
    private func addBlank(to name: String)-> String {
        switch name {
        case let value where value.count == 5:
            return " \(value)"
        case let value where value.count == 4:
            return " \(value) "
        case let value where value.count == 3:
            return "  \(value) "
        case let value where value.count == 2:
            return "  \(value)  "
        case let value where value.count == 1:
            return "   \(value)  "
        default: return name
        }
    }
}
