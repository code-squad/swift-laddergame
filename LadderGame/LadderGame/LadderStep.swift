import Foundation

struct LadderStep {
    //가로줄 사다리 생성 -> LadderStep
    /*
     LadderStep 객체 인스터스 역할은 무엇일까요?
     Array<Array<Boo>> 보다 Array<Array<LadderStep>> 으로 만들었으면 어땠을까요?
     객체의 역할과 책임은 단지 코드만 포함하는게 아니라 어떤 하나의 부분을 책임지는 것을 의미합니다.
 */
    func createLadderFoothold() -> Bool {
        let rowCreate = Int(arc4random_uniform(2))
        guard rowCreate % 2 == 0 else { return false }
        
        return true
    }
}
