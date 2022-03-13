//
//  SettingsScreenData.swift
//  Hands On Localization
//
//  Created by Bhanuteja on 24/02/22.
//

import Foundation
import UIKit

struct SettingsScreenDisplayData {
    var header: String?
    var options: [options]?
    var footer: String?
}

struct options {
    var optionImage: UIImage?
    var optionTitle: String?
    var optionDescription: String?
    var optionType: SettingOptionType?
}

enum SettingOptionType {
    case hasSubItemsType
    case switchType
    case defaultType
}

class SettingsScreenData {
    static let shared = SettingsScreenData()
    private init()  {}
    private var data: [SettingsScreenDisplayData]?

    func generateHomeScreenData() -> [SettingsScreenDisplayData] {
        var data = [SettingsScreenDisplayData]()
        data.append(getDefaulBrowserData())
        data.append(getSignInToSyncData())
        data.append(getGeneralData())
        data.append(generateprivacyData())
        data.append(generateSupport())
        data.append(generateAboutData())
        return data
    }

    fileprivate func getDefaulBrowserData() -> SettingsScreenDisplayData {
        var settingsOptions = [options]()
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.DefaultBrowser.setAsDefaultBrowser,
                                       optionType: .defaultType))
        let data = SettingsScreenDisplayData(options: settingsOptions, footer: .SettingsScreenLocalizedString.DefaultBrowser.footerText)
        return data
    }

    fileprivate func getSignInToSyncData() -> SettingsScreenDisplayData {
        var settingsOptions = [options]()
        settingsOptions.append(options(optionImage: UIImage(systemName: "safari"),
                                       optionTitle: .SettingsScreenLocalizedString.SignInToSync.signInToSync,
                                       optionType: .hasSubItemsType))
        let data = SettingsScreenDisplayData(header: .SettingsScreenLocalizedString.SignInToSync.headerText,
                                  options: settingsOptions, footer: .SettingsScreenLocalizedString.SignInToSync.footerText)
        return data
    }

    fileprivate func getGeneralData() -> SettingsScreenDisplayData {
        var settingsOptions = [options]()
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.General.language,
                                       optionType: .hasSubItemsType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.General.search,
                                       optionType: .hasSubItemsType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.General.newTab,
                                       optionType: .hasSubItemsType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.General.homepage,
                                       optionType: .hasSubItemsType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.General.mailApp,
                                       optionType: .hasSubItemsType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.General.theme,
                                       optionType: .hasSubItemsType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.General.siriShortcuts,
                                       optionType: .hasSubItemsType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.General.blockPopup,
                                       optionType: .switchType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.General.openCopiedLinks,
                                       optionDescription: .SettingsScreenLocalizedString.General.openCopiedLinksHelperText,
                                       optionType: .switchType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.General.showLinkPreviews,
                                       optionDescription: .SettingsScreenLocalizedString.General.showLinkPreviewsHelperText,
                                       optionType: .switchType))
        let data = SettingsScreenDisplayData(header: .SettingsScreenLocalizedString.General.headerText,
                                  options: settingsOptions)
        return data
    }

    fileprivate func generateprivacyData() -> SettingsScreenDisplayData {
        var settingsOptions = [options]()
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.Privacy.loginAndPasswords,
                                       optionType: .hasSubItemsType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.Privacy.dataManagement,
                                       optionType: .hasSubItemsType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.Privacy.closePrivateTabs,
                                       optionDescription: .SettingsScreenLocalizedString.Privacy.closePrivateTabsHelperText,
                                       optionType: .switchType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.Privacy.trackingProtection,
                                       optionType: .hasSubItemsType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.Privacy.privacyPolicy,
                                       optionType: .defaultType))
        let data = SettingsScreenDisplayData(header: .SettingsScreenLocalizedString.Privacy.headerText,
                                  options: settingsOptions)
        return data
    }

    fileprivate func generateSupport() -> SettingsScreenDisplayData {
        var settingsOptions = [options]()
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.Support.showTour,
                                       optionType: .defaultType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.Support.sendFeedback,
                                       optionType: .defaultType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.Support.sendUsageData,
                                       optionDescription: .SettingsScreenLocalizedString.Support.sendUsageDataHelperText,
                                       optionType: .switchType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.Support.studies,
                                       optionDescription: .SettingsScreenLocalizedString.Support.studiesHelperText,
                                       optionType: .switchType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.Support.help,
                                       optionType: .defaultType))
        let data = SettingsScreenDisplayData(header: .SettingsScreenLocalizedString.Support.headerText,
                                  options: settingsOptions)
        return data
    }
    
    fileprivate func generateAboutData() -> SettingsScreenDisplayData {
        var settingsOptions = [options]()
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.About.rateOnAppStore,
                                       optionType: .defaultType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.About.fireFoxDaylight,
                                       optionType: .defaultType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.About.licenses,
                                       optionType: .defaultType))
        settingsOptions.append(options(optionTitle: .SettingsScreenLocalizedString.About.yourRights,
                                       optionType: .defaultType))
        let data = SettingsScreenDisplayData(header: .SettingsScreenLocalizedString.About.headerText,
                                  options: settingsOptions)
        return data
    }
}
