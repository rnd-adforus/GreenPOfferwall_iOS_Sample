## GreenPOfferwall_Extends_iOS

## Version 3.3.0.0
- Swift version 5.8
- Minimum iOS version 14.0

## Greenp Offerwall iOS v3 For Extend 
Greenp Offerwall iOS v3 For Extend은 그린피 오퍼월 광고와 구글 광고(배너, 전면, 리워드, 네이티브)를 모두 지원 받을 수 있는 통합 SDK 서비스입니다.
그린피 오퍼월 내에서도 다음과 같이 구글 광고가 지원됩니다. <br>

**_구글 광고 송출을 위한 운영 프로세스를 선 진행해 주시길 바랍니다._**<br>[GreenPOfferwall + Google 통합 MCM 가이드](https://www.notion.so/Greenp-Google-MCM-59a57e636bbc411d90c14918d1bc8de8)<br>

![그린피 오퍼월 통합 내 구글 광고](https://i.imgur.com/hY5rrWh.png)
[안드로이드 연동 가이드 바로가기](https://github.com/rnd-adforus/GreenpSDK_Android/wiki/Greenp-Offerwall-Android-v3-For-Extend-%EC%97%B0%EB%8F%99%EA%B0%80%EC%9D%B4%EB%93%9C)<br>
## Installation
GreenPOfferwall Extends SDK는 Cocoapods으로 지원됩니다. 다음과 같이, Podfile을 작성하시어 적용하여 주기실 바랍니다.  
```
//Podfile
platform :ios, '14.0'
source 'https://github.com/CocoaPods/Specs.git'

target 'Runner' do
  use_frameworks!
  pod 'GreenPOfferWallExs', '3.3.0.0'
end

post_install do |pi|
  pi.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings[‘BUILD_LIBRARY_FOR_DISTRIBUTION’] = ‘YES’
    end
  end
end
```
```
//terminal
$ pod update
$ pod install
```
## Info.plist
광고 추적 권한<br>
광고 추적 권한 허용 여부에 사용 되는 문구 설정 및 오퍼월 광고 지원을 위한 api 통신 설정이 다음과 같이 필요합니다. 다음의 설정이 올바르지 않을 시 오퍼월 리워드 지급이 원활하지 않을 수 있습니다.
<b>[광고 추적 권한에 따른 문구 설정]</b><br>

<img width="1234" alt="스크린샷 2023-11-21 오후 9 05 22" src="https://i.imgur.com/liFxkik.png">
<br>http 통신 예외처리<br>
<img width="803" alt="스크린샷 2023-11-21 오후 9 08 45" src="https://i.imgur.com/l1k18ai.png">

GADApplicationIdentifier키 값에  Application Id를 입력하세요.  (앱별 Application ID를 Adforus 운영팀에 문의해주세요.)
<img width="1234" alt="AppID" src="https://i.imgur.com/kmNgWv6.png">
또는
```xml
<key>GADApplicationIdentifier</key>  
<string>Your Application ID</string>  
```
<br>
광고 최적화를 위해 광고 추적 예외 설정에 필요한 값을 추가합니다. 아래 스니펫을 Info.plist에 포함하여 주세요.
<details><br>
<summary><b>작성예시</summary>

```xml
<key>SKAdNetworkItems</key>
<array>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>cstr6suwn9.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>4fzdc2evr5.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>4pfyvq9l8r.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>2fnua5tdw4.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>ydx93a7ass.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>5a6flpkh64.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>p78axxw29g.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>v72qych5uu.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>ludvb6z3bs.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>cp8zw746q7.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>3sh42y64q3.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>c6k4g5qg8m.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>s39g8k73mm.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>3qy4746246.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>f38h382jlk.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>hs6bdukanm.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
	<string>v4nxqhlyqp.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>wzmmz9fp6w.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>yclnxrl5pm.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>t38b2kh725.skadnetwork</string>
  </dict>
  <dict>
	<key>SKAdNetworkIdentifier</key>
	<string>7ug5zh24hu.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>gta9lk7p23.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>vutu7akeur.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>y5ghdn5j9k.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>n6fk4nfna4.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>v9wttpbfk9.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>n38lu8286q.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>47vhws6wlr.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>kbd757ywx3.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>9t245vhmpl.skadnetwork</string>
  </dict>
  <dict>
	<key>SKAdNetworkIdentifier</key>
	<string>eh6m2bh4zr.skadnetwork</string>
  </dict>
  <dict>
	<key>SKAdNetworkIdentifier</key>
	<string>a2p9lx4jpn.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>22mmun2rn5.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>4468km3ulz.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>2u9pt9hc89.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>8s468mfl3y.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>klf5c3l5u5.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>ppxm28t8ap.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>ecpz2srf59.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>uw77j35x4d.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>pwa73g5rt2.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
	 <string>mlmmfzh3r3.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>578prtvx9j.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>4dzt52r2t5.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>e5fvkxwrpn.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>8c4e2ghe7u.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>zq492l623r.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>3rd42ekr43.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>3qcr597p9d.skadnetwork</string>
  </dict>
</array>
```
<br>
</details>

## Initialize
```swift
import GreenpOfferwall

private lazy var greenP = GreenPSettings(delegate: self)

/// 오퍼월 초기화 및 사용자 등록
greenP.set(appCode: "Your Code", userID: "user ID") /// 화면에 오퍼월 충전소를 호출하는 함수.
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
|etc       |`int`    |referrer 값. 매체용 추가 정보(매체 uniq 클릭값 등) etc 대신 원하는 파라미터로 변경가능 |

## Changes
### 3.3.0.0
- 광고 표시 유형 리스트/피드형 버튼, 문의하기 버튼 그린피 어드민에서 ON/OFF 되도록 지원
- 광고 초기화 델리게이트 GreenPDelegate의 콜백 함수 greenPSettingsDidEnd에 초기화 성공 여부에 대한 파라미터를 지원
- 개인정보동의 팝업이 그린피 오퍼월 UI 팝업 이후 표시 되도록 수정
- ATT 동의 여부에 상관없이 그린피 오퍼월 UI가 팝업 되도록 수정. (단, 미 동의 시 광고 목록에 제한이 있음)
- 그린피 오퍼월 아이콘 ON/OFF 기능과 관련된 버그 픽스

### 3.2.1.0
- 그린피 어드민에 버전 정보 표시 기능 적용

### 3.2.0.0
- 광고 검색 기능 그린피 어드민으로 ON/OFF 되도록 수정
- 클릭 체류형 광고타입 적용
- 대메뉴, 소메뉴, 프로필 입력 UI 그린피 어드민으로 ON/OFF 되도록 수정
- 광고 표시 유형 리스트/피드형 초기 설정이 그린피 어드민 설정을 따르도록 수정
- 마이페이지의 참여 광고 목록 정렬 순서 수정
- 화면 전환 버그 픽스

### 3.1.2.0
- Distribute Error - Invalid Binary Fix

### 3.1.1.1
- Privacy Manifest - required reason API 수정

## support for other platforms
1. [Flutter](https://github.com/rnd-adforus/GreenPOfferwall_iOS_Sample/wiki/Flutter-GreenpOfferwall-forExtends-SDK-for-%08iOS)
2. [ReactNative](https://github.com/rnd-adforus/GreenpSDK_Android/wiki/ReactNative-GreenpOfferwall-forExtends-SDK-%EA%B0%80%EC%9D%B4%EB%93%9C)
