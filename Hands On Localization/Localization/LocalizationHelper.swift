//
//  LocalizationHelper.swift
//  Hands On Localization
//
//  Created by Bhanuteja on 23/02/22.
//

import Foundation

public func LocalizedString(_ key: String, tableName: String? = nil, value: String = "", comment: String) -> String {
    let bundle: Bundle = .main
    return NSLocalizedString(key, tableName: tableName, bundle: bundle, value: value, comment: comment)
}

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
