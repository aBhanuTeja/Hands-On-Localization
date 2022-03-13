//
//  Language.swift
//  Hands On Localization
//
//  Created by Bhanuteja on 26/02/22.
//

import Foundation
import UIKit

let APPLE_LANGUAGE_KEY = "AppleLanguages"
/*
protocol SceneResetable {
    func reset(scene: UIScene)
}
*/
open class Language {
    private static var language: Language?
    
    fileprivate init() {}
    
    static func shared() -> Language {
        if language == nil {
            language = Language()
        }
        return language!
    }

    private static let RTLLanguages = ["ar", "fe", "he", "ckb-IQ", "ckb-IR", "ur", "ckb"]

    private static var preferredLangage: [String] {
        let userDefaults = UserDefaults.standard
        let langArray = userDefaults.object(forKey: APPLE_LANGUAGE_KEY) as? [String]
        return langArray ?? []
    }

    public class func currentAppLanguage() -> String {
        let current = preferredLangage.first!
        if let hyphenIndex = current.firstIndex(of: "-") {
            return String(current[..<hyphenIndex])
        }
        return current
    }

    public class func currentAppLanguageFull() -> String {
        let current = preferredLangage.first!
        return current
    }
    
    public class func setLanguageTo(_ selectedLanguage: String) {
        let userdef = UserDefaults.standard
        userdef.set([selectedLanguage, currentAppLanguage()], forKey: APPLE_LANGUAGE_KEY)
        userdef.synchronize()
    }

    public class func setAppLanguageTo(_ language: String) {
        setLanguageTo(language)
        if isRTLLanguage() {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            UIButton.appearance().semanticContentAttribute = .forceRightToLeft
            UITextView.appearance().semanticContentAttribute = .forceRightToLeft
            UITextField.appearance().semanticContentAttribute = .forceRightToLeft
            UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft
            UITabBar.appearance().semanticContentAttribute = .forceRightToLeft
            UISearchBar.appearance().semanticContentAttribute = .forceRightToLeft
            UILabel.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            UIButton.appearance().semanticContentAttribute = .forceLeftToRight
            UITextView.appearance().semanticContentAttribute = .forceLeftToRight
            UITextField.appearance().semanticContentAttribute = .forceLeftToRight
            UINavigationBar.appearance().semanticContentAttribute = .forceLeftToRight
            UITabBar.appearance().semanticContentAttribute = .forceLeftToRight
            UISearchBar.appearance().semanticContentAttribute = .forceLeftToRight
            UILabel.appearance().semanticContentAttribute = .forceLeftToRight
        }
    }
    /*
    open class func resetWithAnimation(duration: Float = 05) {
        func resetWhenNoScenesAvailable() {
            if let delegate = UIApplication.shared.delegate {
                UIView.transition(with: (delegate.window!)!,
                                  duration: TimeInterval(duration),
                                  options: .transitionCrossDissolve, animations: {})
            }
        }

        if let window = UIApplication.shared.delegate?.window, window != nil {
            resetWhenNoScenesAvailable()
        } else {
            for scene in UIApplication.shared.connectedScenes {
                (scene.delegate as? SceneResetable)?.reset(scene: scene)
            }
        }
    }
    */
    public static func isRTLLanguage() -> Bool {
        return !RTLLanguages.filter{ $0 == currentAppLanguageFull() || $0 == currentAppLanguage() }.isEmpty
    }
}

extension UIViewController {
    func languagePopViewController(_ selectedLanguage: String) {
        if Language.currentAppLanguage() == selectedLanguage {
            return
        }
        Language.setAppLanguageTo(selectedLanguage)
        UserDefaults.standard.setValue(selectedLanguage, forKey: "selectedLanguage")
        _ = navigationController?.popViewController(animated: true)
    }
}
