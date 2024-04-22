## GreenPFramework_3v_iOS

## Version 3.1.0
- Swift version 5.8
- Minimum iOS version 14.0
  
## Installation
3.1.0 이상 부터 Cocoapods으로 지원됩니다. 다음과 같이, Podfile을 작성하시어 적용하여 주기실 바랍니다.  
!GreenPFramework Changed PackageManager  
```
//Podfile
 pod 'GreenPOfferWall', '3.1.0'
```
## Info.plist
광고 추적 권한<br>
<img width="1234" alt="스크린샷 2023-11-21 오후 9 05 22" src="https://i.imgur.com/liFxkik.png">
<br>http 통신 예외처리<br>
<img width="803" alt="스크린샷 2023-11-21 오후 9 08 45" src="https://i.imgur.com/l1k18ai.png">

## Initialize
```swift
import GreenPFramework

private lazy var greenP = GreenPSettings(delegate: self)

/// 오퍼월 초기화 및 사용자 등록
greenP.set(appCode: "Your Code", userID: "user ID") /// 화면에 오퍼월 충전소를 호출하는 함수.
    greenp.setAuthMessage(msg: "개인화된 광고 제공을 위해 추적 허용 권한을 요청합니다.") // 광고 추적 거부시 권한 요청 팝업 문구 커스텀 용

/// 버튼을 누를 때 호출
greenP.show(on: self)


extension ViewController : GreenPDelegate {
    func greenPSettingsDidEnd(with message: String) {
      // 성공 & 실패 시 메세지 노출
    }
}

```
※ 유저 구분값 생성 규칙
1. 각각의 유저별 고유한 값을 이용해야 합니다.
2. 개인정보 및 IDFA는 사용할 수 없습니다. ( 암호화 후 사용 가능 )
3. 한글, 특수문자, 공백은 반드시 URL 인코딩 후 사용하셔야 합니다.

## Callback Parameter  
> 광고 참여가 정상적으로 완료된 경우, 매체사에서 등록 하신 콜백 URL로 암호화키를 전송해 드립니다.
> <pre><b>CallBack url : 매체사 URL</b></pre>
> <pre><b>Method : GET or POST (기본은 GET 방식이나 요청시 POST 방식으로도 가능합니다.</b></pre>
|Ad Parameter|Type|설명|
|----------------|-------------------------------|-----------------------------|
|ads_idx   |`int`    |광고키             |
|ads_name  |`string` |갬페인 타이틀        |
|rwd_cost  |`int`    |매체사에 지급되는 단가 |
|app_uid   |`string` |매체사에 보낸 유저 구분 값 (UserID) |
|gp_key    |`int`    |전환 건에 대한 유니크 값 |
|etc       |`int`    |referrer 값. 매체용 추가 정보(매체 uniq 클릭값 등) etc 대신 원하는 파라미터로 변경가능 |


## Changes
### 3.1.0
- 광고 UI 표시 피드형, 리스트형 전환 기능 추가
- Privacy Manifest - required reason API 적용
- 광고 리스트 검색기능 적용
- 프로필 작성 기능 추가
- 보상 표시 단위 소숫점 이하 적용 기능 추가
- 광고 추적 거부 시 권한 요청 팝업 문구 수정용 인터페이스 추가
- 광고 리스트 페이징 버그 및 UI 픽스

## support for other platforms
1. [Flutter](https://github.com/rnd-adforus/GreenpSDK_iOS/wiki/Flutter-GreenpOfferwall-SDK-for-%08iOS)
