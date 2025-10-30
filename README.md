## GreenPOfferwall_(3v~4v)_iOS

## Version 4.0.1
- Swift version 6.0
- Minimum iOS version 14.0
  
## Installation
3.1.0 이상 부터 Cocoapods으로 지원됩니다. 다음과 같이, Podfile을 작성하시어 적용하여 주기실 바랍니다.  
!GreenPOfferwall Changed PackageManager  
```
//Podfile
platform :ios, '14.0'
source 'https://github.com/CocoaPods/Specs.git'

target 'Runner' do
  use_frameworks!
  pod 'GreenPOfferWall', '4.0.1'
  #  pod 'UAdKit', '1.3.1' #Optional - 오퍼월 내 구글 광고를 사용하시는 경우 추가해주세요.
end

post_install do |pi|
  pi.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings[‘BUILD_LIBRARY_FOR_DISTRIBUTION’] = ‘YES’
    end
  end
end
```
## Info.plist
광고 추적 권한<br>
<img width="1234" alt="스크린샷 2023-11-21 오후 9 05 22" src="https://i.imgur.com/liFxkik.png">
<br>http 통신 예외처리<br>
<img width="803" alt="스크린샷 2023-11-21 오후 9 08 45" src="https://i.imgur.com/l1k18ai.png">
<br>

### (Optional)Google Admob GADApllicationIdentifer 작성
<details>
<summary>더 보기</summary>
오퍼월 내에 AdMob 광고를 표시하려면, Info.split에 GADApllicationIdentifer키값을 추가해야 합니다. <br>
앱 마다 고유한 GADApllicationIdentifer의 값은 애드포러스 플랫폼 3팀에 문의하여주세요. <br>

<img width="1000" alt="app_id" src="https://i.imgur.com/acKz0Uf.png">

</details>

<br>

## BuildSettings
GreenPOffewall SDK는 Dynamic Framework로 라이브러리 파일이 런타임으로 로딩 되도록 하는 방식을 취하고 있습니다. Dynamic Framework는 SDK를 의존하여 늘어나는 앱 용량을 대폭 축소합니다. 다음의 RUN_PATH, LINK_FRAMEWORK 설정을 추가하여주세요.

### RUN_PATH 
Dynamic Framework를 로딩할 경로를 설정합니다 . TARGETS > BuildSettings > Linking - General > Runpath Search Paths의 값 확인하여 동일한 path가 없다면 추가해 주세요. 
<table>
<th> copy values </th>
<th>Build Settings Example</th>
<tr>
<td>
<code>/usr/lib/swift</code> <br>
<code>@executable_path/Frameworks</code><br>
<code>@loader_path/Frameworks</code>
</td>
<td>
<img alt="run_path" src="https://i.imgur.com/4sncUYS.png">
</td>
</tr>
</table>


### LINK_FRAMEWORK
Dynamic Framework를 링킹할 경로를 설정합니다 .  TARGETS > BuildSettings > Linking - General > Other Linker Flags의 값 확인하여 동일한  flag가 없다면 추가해 주세요. 

<table>
<th> copy values </th>
<th>Build Settings Example</th>
<tr>
<td>
<code>-framework
"GreenpOfferwall"</code> <br><br>
<small><small>Optional - 오퍼월 내 구글 광고 사용시에만 추가 적용</small></small> <br>
<code>-framework
"UAdFramework"</code><br>
</td>
<td>
<img alt="run_path" src="https://i.imgur.com/5iVEko3.png">
</td>
</tr>
</table>
<br>

## Initialize
```swift
import GreenpOfferwall

private lazy var greenP = GreenPSettings(delegate: self)

/// 오퍼월 초기화 및 사용자 등록
greenP.set(appCode: "Your App Code", userID: "user ID") /// 화면에 오퍼월 충전소를 호출하는 함수.
greenp.setAuthMessage(msg: "개인화된 광고 제공을 위해 추적 허용 권한을 요청합니다.") // 광고 추적 거부시 권한 요청 팝업 문구 커스텀 용

/// 버튼을 누를 때 호출
greenP.show(on: self)


extension ViewController : GreenPDelegate {
    func greenPSettingsDidEnd(with message: String, result: Bool) {
      // 성공 & 실패 시 메세지 노출
    }
}

```
※ 유저 구분값 생성 규칙
1. 각각의 유저별 고유한 값을 이용해야 합니다.
2. 개인정보 및 IDFA는 사용할 수 없습니다. ( 암호화 후 사용 가능 )
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
|etc       |`int`    |referrer 값. 매체용 추가 정보(매체 uniq 클릭값 등) etc 대신 원하는 파라미터로 변경가능 |

## Changes
### 4.0.1
- 마이페이지 내 표시 오류 수정
- 그린피 이벤트 버그 픽스

### 4.0.0
- 4v 전용 커스텀 디자인 적용
- 그린피 이벤트 기능 지원

### 3.5.3
- Flutter.framework Privacy Manifest 적용 버전으로 업데이트 

### 3.5.2
- 오퍼월 팝업 관련 버그 픽스

### 3.5.1
- 리워드 포인트 색상 그린피 어드민에서 설정하는 기능 추가
- GADApllicationIdentifer 확인 기능 내부 컨트롤 기능 추가

### 3.5.0 
- Swift6 지원
- 멀티 리워드 광고 타입 지원
- 다크모드 지원, 버튼 UI, 광고 리스트 표시 형식 등 디자인 변경 
- 초기화 실패 사유로 App Code, User ID를 빈값을 사용 하는 경우를 추가
- 메뉴 버튼 이름이 그린피 Admin 페이지 설정으로 변경, 통합 되는 기능 추가
- 오퍼월 내 구글 광고가 UAdKit SDK 의존성을 추가하여 적용될 수 있도록 변경
- Alamofire, SnapKit, Kingfisher 라이브러리 의존성 제거

### 3.4.0 
- 개인정보동의 팝업 관련 UI가 그린피 어드민에서 컨트롤되도록 설정 지원
- iOS 플랫폼 형식에 맞지 않는 AppCode로 초기화 시도 시 실패 되도록 수정
- 기타 데이터 수집과 관련한 버그 픽스
- UI 표시 여부와 관련된 버그 픽스

### 3.3.0
- 광고 표시 유형 리스트/피드형 버튼, 문의하기 버튼 그린피 어드민에서 ON/OFF 되도록 지원
- 개인정보동의 팝업이 그린피 오퍼월 UI 팝업 이후 표시 되도록 수정
- ATT 동의 여부에 상관없이 그린피 오퍼월 UI가 팝업 되도록 수정. (단, 미 동의 시 광고 목록에 제한이 있음)
- 그린피 오퍼월 아이콘 ON/OFF 기능과 관련된 버그 픽스

### 3.2.1
- 그린피 어드민에 버전 정보 표시 기능 적용

### 3.2.0
- 광고 검색 기능 그린피 어드민으로 ON/OFF 되도록 수정
- 클릭 체류형 광고타입 적용
- 대메뉴, 소메뉴, 프로필 입력 UI 그린피 어드민으로 ON/OFF 되도록 수정
- 광고 표시 유형 리스트/피드형 초기 설정이 그린피 어드민 설정을 따르도록 수정
- 마이페이지의 참여 광고 목록 정렬 순서 수정
- 대매뉴 화면 전환 버그 픽스

### 3.1.1
- 메뉴 버튼 UI 수정 및 버그 픽스

### 3.1.0
- 광고 UI 표시 피드형, 리스트형 전환 기능 추가
- Privacy Manifest - required reason API 적용
- 광고 리스트 검색기능 적용
- 프로필 작성 기능 추가
- 보상 표시 단위 소숫점 이하 적용 기능 추가
- 광고 추적 거부 시 권한 요청 팝업 문구 수정용 인터페이스 추가
- 광고 리스트 페이징 버그 및 UI 픽스

## support for other platforms
1. [Flutter](https://github.com/rnd-adforus/GreenPOfferwall_iOS_Sample/wiki/Flutter-GreenpOfferwall-SDK-for-%08iOS)
2. [ReactNative](https://github.com/rnd-adforus/GreenpSDK_Android/wiki/ReactNative-GreenpOfferwall-SDK-%EA%B0%80%EC%9D%B4%EB%93%9C)
