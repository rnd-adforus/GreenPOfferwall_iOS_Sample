//
//  ViewController.swift
//  GreenpOfferwallSample
//
//  Created by adforus_m1 on 4/26/24.
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
    }
    
    @IBAction func show(_ sender: Any) {
        greenp.show(on: self)
    }
}

extension ViewController : GreenPDelegate {
    func greenPSettingsDidEnd(with message: String) {
        Task { @MainActor in
            resultLabel.text = message
        }
        
    }
}


