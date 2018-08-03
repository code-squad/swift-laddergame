import Foundation

struct LadderStep {
    //가로줄 사다리 생성 -> LadderStep
    func createLadderFoothold() -> String {
        let rowCreate: Bool = arc4random_uniform(2) == 0 ? true : false
        guard rowCreate == true else {
            return  "     " }
        return "-----"
    }
}
