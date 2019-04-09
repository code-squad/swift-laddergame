import Foundation

/// 사람의 숫자와 사다리의 숫자를 입력 받아 사다리를 만들고 출력하는 함수
func make_ladder(){
    print("참여할 사람은 몇 명 인가요?")
    let input_people_num = readLine()!
    let people_num = Int(input_people_num.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789").inverted))
    print("최대 사다리 높이는 몇 개인가요?")
    let input_ladder_num = readLine()!
    let ladder_num = Int(input_ladder_num.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789").inverted))
        
    if people_num != nil && ladder_num != nil && people_num! > 0 && ladder_num! > 0{
        let people:Int = people_num!
        let ladder:Int = ladder_num!
        
        var ladder_array :[[String]] = [[]]
        var horizontal_ladder:String
        
        // 사람의 숫자와 사다리의 숫자를 바탕으로 사다리의 모양을 2차원 배열에 저장
        for i in 0...ladder-1{
            ladder_array.append([])
            for j in 0...people-1{
                ladder_array[i].append("|")
                let random_num = arc4random_uniform(2)
                if(random_num == 1){ horizontal_ladder = "-"}
                else{ horizontal_ladder = " " }
                ladder_array[i].append(horizontal_ladder)
            };ladder_array[i].removeLast()
        }
        // 2차원 배열 출력
        for i in ladder_array{
            for j in i{
                print(j, terminator:"")
            }
            print("")
        }
    }else if people_num != nil && people_num! == 0{
        print("숫자는 0 이상이어야 합니다")
    }else{
        print("숫자(정수)를 입력하세요")
    }
}
make_ladder()
