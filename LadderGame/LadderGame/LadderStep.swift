import Foundation

struct LadderStep {
    //가로줄 사다리 생성 -> LadderStep
    func createLadderFoothold() -> Bool {
        let rowCreate = Int(arc4random_uniform(2))
        guard rowCreate % 2 == 0 else { return false }
        
        return true
    }
}
