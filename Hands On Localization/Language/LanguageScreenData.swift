//
//  LanguageScreenData.swift
//  Hands On Localization
//
//  Created by Bhanuteja on 25/02/22.
//

import Foundation

struct LanguageScreenDisplayData {
    let language: String?
    let languageCode: String?
}

class LanguageScreenData {
    static let shared = LanguageScreenData()
    private init()  {}
    private var data: [SettingsScreenDisplayData]?

    func generateLanguageScreenData() -> [LanguageScreenDisplayData] {
        var data = [LanguageScreenDisplayData]()
        data.append(LanguageScreenDisplayData(language: .Language.English, languageCode: "en"))
        data.append(LanguageScreenDisplayData(language: .Language.Arabic, languageCode: "ar"))
        data.append(LanguageScreenDisplayData(language: .Language.French, languageCode: "fr"))
        data.append(LanguageScreenDisplayData(language: .Language.Russian, languageCode: "ru"))
        data.append(LanguageScreenDisplayData(language: .Language.Spanish, languageCode: "es"))
        return data
    }
}
