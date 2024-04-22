//
//  ViewController.swift
//  GreenPOfferWallSample
//
//  Created by adforus_m1 on 4/22/24.
//

import UIKit
import GreenpOfferwall

class ViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    private lazy var greenp = GreenPSettings(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc private func handleTap(_ tap: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func didTapRegistBtn(_ sender: Any) {
        let userID = idTextField.text!
        greenp.set(appCode: "B8PcNMrpS7", userID: userID)
        greenp.setAuthMessage(msg: "개인화된 광고 제공을 위해 추적 허용 권한을 요청합니다.") // 광고 추적 거부시 권한 요청 팝업 문구 커스텀 용
    }
    
    @IBAction func show(_ sender: Any) {
        greenp.show(on: self)
    }
}

extension ViewController : GreenPDelegate {
    func greenPSettingsDidEnd(with message: String) {
        resultLabel.text = message
    }
}
