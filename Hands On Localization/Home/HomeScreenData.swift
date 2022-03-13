//
//  HomeScreenData.swift
//  Hands On Localization
//
//  Created by Bhanuteja on 20/02/22.
//

import UIKit.UIImage

enum HomeData: CaseIterable {
    case settings
    case whatIsNew
    case backUpAndSynchronise
    case passwords
    case turnOnNightMode
    case blockImages
    case readingList
    case downloads
    case history
    case bookmarks

    var displayString: String {
        switch self {
        case .settings:
            return .HomeScreenLocalizedString.Home_Settings
        case .whatIsNew:
            return .HomeScreenLocalizedString.Home_whatIsNew
        case .backUpAndSynchronise:
            return .HomeScreenLocalizedString.Home_BackUpAndSynchronise
        case .passwords:
            return .HomeScreenLocalizedString.Home_Passwords
        case .turnOnNightMode:
            return .HomeScreenLocalizedString.Home_TurnOnNightMode
        case .blockImages:
            return .HomeScreenLocalizedString.Home_BlockImages
        case .readingList:
            return .HomeScreenLocalizedString.Home_ReadingList
        case .downloads:
            return .HomeScreenLocalizedString.Home_Downloads
        case .history:
            return .HomeScreenLocalizedString.Home_History
        case .bookmarks:
            return .HomeScreenLocalizedString.Home_Bookmarks
        }
    }
    
    var displayImage: UIImage {
        switch self {
        case .settings:
            return UIImage(systemName: "gearshape")!
        case .whatIsNew:
            return UIImage(systemName: "gift")!
        case .backUpAndSynchronise:
            return UIImage(systemName: "arrow.triangle.2.circlepath")!
        case .passwords:
            return UIImage(systemName: "key")!
        case .turnOnNightMode:
            return UIImage(systemName: "moon.fill")!
        case .blockImages:
            return UIImage(systemName: "person.fill.xmark")!
        case .readingList:
            return UIImage(systemName: "list.bullet.rectangle")!
        case .downloads:
            return UIImage(systemName: "arrow.down.circle")!
        case .history:
            return UIImage(systemName: "clock.arrow.circlepath")!
        case .bookmarks:
            return UIImage(systemName: "bookmark")!
        }
    }
}

struct HomeScreenData {
    var title: String
    var image: UIImage?
}

public class HomeScreenDisplayData {
    static let shared = HomeScreenDisplayData()
    private init()  {}
    private var data: [HomeScreenData]?

    func generateHomeScreenData() -> [HomeScreenData] {
        var data = [HomeScreenData]()
        data.append(HomeScreenData(title: HomeData.settings.displayString, image: HomeData.settings.displayImage))
        data.append(HomeScreenData(title: HomeData.whatIsNew.displayString, image: HomeData.whatIsNew.displayImage))
        data.append(HomeScreenData(title: HomeData.backUpAndSynchronise.displayString, image: HomeData.backUpAndSynchronise.displayImage))
        data.append(HomeScreenData(title: HomeData.passwords.displayString, image: HomeData.passwords.displayImage))
        data.append(HomeScreenData(title: HomeData.turnOnNightMode.displayString, image: HomeData.turnOnNightMode.displayImage))
        data.append(HomeScreenData(title: HomeData.blockImages.displayString, image: HomeData.blockImages.displayImage))
        data.append(HomeScreenData(title: HomeData.readingList.displayString, image: HomeData.readingList.displayImage))
        data.append(HomeScreenData(title: HomeData.downloads.displayString, image: HomeData.downloads.displayImage))
        data.append(HomeScreenData(title: HomeData.history.displayString, image: HomeData.history.displayImage))
        data.append(HomeScreenData(title: HomeData.bookmarks.displayString, image: HomeData.bookmarks.displayImage))
        return data
    }
}
