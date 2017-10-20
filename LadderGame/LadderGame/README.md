## 사다리 게임 요구사항

간단한 사다리 게임을 구현한다.
n개의 사람과 m개의 사다리 개수를 입력할 수 있어야 한다.
사다리는 랜덤으로 있거나 없을 수도 있다.
사다리가 있으면 -를 표시하고 없으면 " " 빈공백을 표시한다. 양옆에는 |로 세로를 표시한다.
사다리 상태를 화면에 출력한다. 어느 시점에 출력할 것인지에 대한 제약은 없다.

<br/>

## Git 협업

### Git - 리모트 저장소

- 협업한다는 것은 데이터를 리모트 저장소에 push, pull, 관리하는 것을 의미.
- 리모트 저장소를 관리하는 것은 저장소 추가/삭제, 브랜치 관리/추적 등을 말함.

1. 리모트 저장소 확인
    - git remote [-v] : 현재 프로젝트에 등록된 리모트 저장소를 확인할 수 있음. 저장소를 Clone하면 origin이라는 리모트 저장소가 자동으로 등록됨.
2. 리모트 저장소 추가
    - git remote add [단축이름] [url]
3. 리모트 저장소 Pull / Fetch
    - git fetch [remote-name] : 로컬에는 없지만 리모트 저장소에는 있는 데이터를 모두 가져옴. 단, 자동으로 merge하지는 않음. (수동으로 해야)
    - git pull : fetch와 동시에 자동으로 로컬 브랜치와 merge 함.
    - git clone : 자동으로 로컬의 master 브랜치가 리모트의 master를 추적하도록 함. 그 후 pull 명령을 쓰면 clone한 서버에서 데이터를 가져오고 자동으로 현재 작업하는 코드와 merge 시킴.
4. 리모트 저장소에 Push
    - git push [리모트저장소 이름] [브랜치 이름]
5. 리모트 저장소 삭제 / 이름변경
    - git remote rname [이전이름] [새이름]
    - git remote rm [리모트저장소 이름]
6. 리모트 저장소의 모든 브랜치 목록 보기
    - git branch -r
    - 로컬 브랜치 목록은 git branch -l
    - 둘 다 보려면 git branch -a
7. 리모트 저장소 살펴보기
    - git remote show [리모트저장소 이름]

### 협업과정 (Pull Request)

#### 큰 그림: 단계별 branch를 만들고, 완성 시 code-squad(origin)로 pull request. code-squad 측에서 승인이 나면 내 저장소의 [내 아이디] 브랜치로 fetch 해 옴.

1. 타겟 프로젝트의 저장소(repository)를 내 저장소로 **fork** 한 후, 내 컴퓨터로 clone 한다.
2. clone 한 폴더로 이동하여 내 아이디로 브랜치를 만들기 위해 checkout 한다.
	- **git checkout -t origin/[내 아이디]** : origin/[내 아이디]로 upstream이 설정된 [내 아이디] 브랜치를 로컬에 만들고 현재 브랜치에서 [내 아이디] 브랜치로 이동한다는 뜻.
	- -t 옵션 : 새 branch를 만들 때, **upstream** 설정을 해 준다. 이 옵션을 쓰려면 upstream에 이미 본인 아이디 브랜치가 있어야 한다.
3. 기능 구현을 위한 branch 를 생성한다. (단계별로 따로 생성)
	- **git checkout -b ladder-step1** : ladder-step1 브랜치를 생성해서 이동.
4. 과제 코딩 후 로컬에서 commit
5. 내 원격 저장소에 올린다.
	- git push --set-upstream origin ladder-step1 : ladder-step1 브랜치를 origin 서버를 (upstream으로) 연결


## 기타

### 삼항연산자
> Conditional operator - () : () ? ()
> Nil-coalescing operator - ??
 

### Error Handling
> throws : 함수를 실행하다가 중간에 돌아올 수 있다는 뜻.
> 중간에 빠져나올 수 있는 함수는 실행 시 do { try } catch가 필요함.

- 정의부

```
func makeASandwich() throws {
	...
}
```

- 호출부

```
do{
	try makeASandwich()
}catch 조건비교 {
	다른동작
}
```


- 반면, 리턴타입이 옵셔널 타입인 경우, 반환값만 가지고 예외처리를 할 수 있기 때문에 중간에 돌아올 필요가 없기 때문에 do-try는 필요없다.

 
`let result = try? buySandwich()` 

> 옵셔널타입 으로 반환(권장)

`let result = try! buySandwich()` 

> 값타입 으로 반환


### XCode
> break point를 잡으면 그 줄 직전까지만 실행되고 멈춤. break point 잡은 줄부터 한 줄씩 실행 가능.