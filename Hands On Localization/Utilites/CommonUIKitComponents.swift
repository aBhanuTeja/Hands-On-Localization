//
//  CommonUIKitComponents.swift
//  Hands On Localization
//
//  Created by Bhanuteja on 20/02/22.
//

import UIKit

public class CommonUILabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
