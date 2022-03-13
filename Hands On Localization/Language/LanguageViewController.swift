//
//  LanguageViewController.swift
//  Hands On Localization
//
//  Created by Bhanuteja on 25/02/22.
//

import UIKit

class LanguageViewController: UIViewController {

    private lazy var languageTableView: UITableView = {
        var tableview = UITableView(frame: self.view.frame, style: .grouped)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(LanguageTableCell.self, forCellReuseIdentifier: LanguageTableCell.identifier)
        tableview.tableFooterView = UIView()
        tableview.rowHeight = 50
        return tableview
    }()

    var languageScreenData = [LanguageScreenDisplayData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings.General.Language".localized()
        view.addSubview(languageTableView)
        languageScreenData = LanguageScreenData.shared.generateLanguageScreenData()
        languageTableView.reloadData()
    }
}

extension LanguageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageScreenData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LanguageTableCell.identifier, for: indexPath) as! LanguageTableCell
        cell.data = languageScreenData[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedLanguage = languageScreenData[indexPath.row].languageCode!
        languagePopViewController(selectedLanguage)
    }
}
