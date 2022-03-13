//
//  Localize.swift
//  Hands On Localization
//
//  Created by Bhanuteja on 26/02/22.
//

import UIKit
import Foundation

open class Localizer: NSObject {
    open var maximumLocalizableTag: Int = -1 {
        didSet {
            assert(maximumLocalizableTag <= -1, "Tag should be less than or equal -1 , since 0 will corrupt UIKit-Made UIs e.g. UIAlertView/Share...")
        }
    }

    class func DoTheMagic() {
        swizzle(cls: Bundle.self, originalSelector: #selector(Bundle.localizedString(forKey:value:table:)),
                overrideSelector: #selector(Bundle.specialLocalizedStringForKey(_:value:table:)))
        swizzle(cls: UIApplication.self, originalSelector: #selector(getter: UIApplication.userInterfaceLayoutDirection),
                overrideSelector: #selector(getter: UIApplication.cstm_userInterfaceLayoutDirection))
//        swizzle(cls: UIViewController.self, originalSelector: #selector(UIViewController.viewDidLayoutSubviews),
//                overrideSelector: #selector(UIViewController.mirroringviewDidLoad))
        swizzle(cls: UIControl.self, originalSelector: #selector(UIControl.awakeFromNib),
                overrideSelector: #selector(UIControl.cstmlayoutSubviews))
//        swizzle(cls: UITextField.self, originalSelector: #selector(UITextField.layoutSubviews),
//                overrideSelector: #selector(UITextField.cstmlayoutSubviews))
//        swizzle(cls: UITextView.self, originalSelector: #selector(UITextView.layoutSubviews),
//                overrideSelector: #selector(UITextView.cstmlayoutSubviews))
        swizzle(cls: UILabel.self, originalSelector: #selector(UILabel.layoutSubviews),
                overrideSelector: #selector(UILabel.cstmlayoutSubviews))
    }
}

fileprivate func swizzle(cls: AnyClass, originalSelector: Selector, overrideSelector: Selector) {
    guard let origMethod: Method = class_getInstanceMethod(cls, originalSelector),
        let overrideMethod: Method = class_getInstanceMethod(cls, overrideSelector) else {
        return
    }
    if (class_addMethod(cls, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod))) {
        class_replaceMethod(cls, overrideSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, overrideMethod)
    }
}

extension Bundle {
    @objc func specialLocalizedStringForKey(_ key: String, value: String?, table tableName: String?) -> String {
        let translate = { (tableName: String?) -> String in
            var bundle = Bundle()
            if let _path = Bundle.main.path(forResource: Language.currentAppLanguageFull(), ofType: "lproj") {
                bundle = Bundle(path: _path)!
            } else if let _path = Bundle.main.path(forResource: Language.currentAppLanguage(), ofType: "lproj") {
                bundle = Bundle(path: _path)!
            } else if let _path = Bundle.main.path(forResource: "Base", ofType: "lproj") {
                bundle = Bundle(path: _path)!
            }
            return bundle.specialLocalizedStringForKey(key, value: value, table: tableName)
        }
        
        if self == Bundle.main {
            return translate(tableName)
        } else {
            return (self.specialLocalizedStringForKey(key, value: value, table: tableName))
        }
    }
}

extension UIApplication {
    @objc var cstm_userInterfaceLayoutDirection : UIUserInterfaceLayoutDirection {
        get {
            var direction = UIUserInterfaceLayoutDirection.leftToRight
            if Language.currentAppLanguage() == "ar" {
                direction = .rightToLeft
            }
            return direction
        }
    }
}

extension UIImage {
    public func flippedImage() -> UIImage?{
        if let _cgImag = self.cgImage {
            let flippedimg = UIImage(cgImage: _cgImag, scale:self.scale , orientation: UIImage.Orientation.upMirrored)
            return flippedimg
        }
        return nil
    }
    
    public func flipIfNeeded() -> UIImage? {
        if Language.isRTLLanguage() {
            return self.flippedImage()
        }
        return self
    }
}
/*
extension UIViewController {
    @objc func mirroringviewDidLoad() {
        mirroringviewDidLoad()
        if UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft {
            loopThroughSubViewAndFlipTheImageIfItsNeeded(self.view.subviews)
        }
    }
    
    fileprivate func loopThroughSubViewAndFlipTheImageIfItsNeeded(_ subviews: [UIView]) {
        if subviews.count > 0  && Language.isRTLLanguage() {
            for subView in subviews where subView.tag <= Localizer().maximumLocalizableTag  {
                // Flip UIImageView
                if subView.isKind(of: UIImageView.self)    {
                    let toRightArrow = subView as! UIImageView
                    toRightArrow.image = toRightArrow.image?.flipIfNeeded()
                }
                // Flip UISlider thumb image
                if subView.isKind(of: UISlider.self) {
                    let toRightArrow = subView as! UISlider
                    let _img = toRightArrow.thumbImage(for: UIControl.State())
                    let flipped = _img?.flipIfNeeded()
                    toRightArrow.setThumbImage(flipped, for: UIControl.State())
                    toRightArrow.setThumbImage(flipped, for: .selected)
                    toRightArrow.setThumbImage(flipped, for: .highlighted)
                }
                // Flip UIButton image
                if subView.isKind(of: UIButton.self) {
                    let _subView = subView as! UIButton
                    var image = _subView.image(for: UIControl.State())
                    image = image?.flippedImage()
                    _subView.setImage(image, for: UIControl.State())
                    _subView.setImage(image, for: UIControl.State.selected)
                    _subView.setImage(image, for: UIControl.State.highlighted)
                }
                loopThroughSubViewAndFlipTheImageIfItsNeeded(subView.subviews)
            }
        }
    }
}
*/
extension UIControl {
    internal func handleControlSwitching(forceSwitchingRegardlessOfTag: Bool) {
        if self.tag < Localizer().maximumLocalizableTag + 1  || forceSwitchingRegardlessOfTag {
            if Language.isRTLLanguage()  {
                if self.contentHorizontalAlignment == .right { return }
                self.contentHorizontalAlignment = .right
            } else {
                if self.contentHorizontalAlignment == .left { return }
                self.contentHorizontalAlignment = .left
            }
        }
    }

    @objc public  func cstmlayoutSubviews() {
        self.cstmlayoutSubviews()
        handleControlSwitching(forceSwitchingRegardlessOfTag: false)
    }
}

extension UILabel {
    @objc public func cstmlayoutSubviews() {
        self.cstmlayoutSubviews()
        if self.tag <= 0  {
            if Language.isRTLLanguage()  {
                if self.textAlignment == .right { return }
                self.textAlignment = .right
            } else {
                if self.textAlignment == .left { return }
                self.textAlignment = .left
            }
        }
    }
}
