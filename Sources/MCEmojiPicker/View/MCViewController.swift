//
//  MCViewController.swift
//  MCEmojiPicker
//
//  Created by icon on 2023/9/27.
//

import UIKit

class MCViewController: UIViewController {

    override var prefersHomeIndicatorAutoHidden: Bool {
        Self.keyWindow()?.rootViewController?.prefersHomeIndicatorAutoHidden ?? false
    }
    
    override var prefersStatusBarHidden: Bool {
        Self.keyWindow()?.rootViewController?.prefersStatusBarHidden ?? false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 告诉编译器忽略特定的警告
    @available(*, deprecated, message: "This method is deprecated. Use anotherMethod instead.")
    static func keyWindow() -> UIWindow? {
        
        var keyWindow = UIApplication.shared.keyWindow

        if keyWindow == nil {
            keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        }

        if #available(iOS 13.0, *), keyWindow == nil {
            keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        }
        return keyWindow
    }
}
