//
//  SettingsViewController.swift
//  Hands On Localization
//
//  Created by Bhanuteja on 24/02/22.
//

import UIKit

class SettingsViewController: UIViewController {

    private lazy var settingsTableView: UITableView = {
        var tableview = UITableView(frame: self.view.frame, style: .grouped)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(SettingsTableCell.self, forCellReuseIdentifier: SettingsTableCell.identifier)
        tableview.tableFooterView = UIView()
        tableview.separatorStyle = .none
        tableview.rowHeight = 50
        return tableview
    }()

    var settingsScreenData = [SettingsScreenDisplayData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(settingsTableView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Home.Settings".localized()
        settingsScreenData.removeAll()
        settingsScreenData = SettingsScreenData.shared.generateHomeScreenData()
        settingsTableView.reloadData()
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsScreenData.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsScreenData[section].options?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableCell.identifier, for: indexPath) as! SettingsTableCell
        cell.data = settingsScreenData[indexPath.section].options![indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return settingsScreenData[section].header?.localized()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selection = settingsScreenData[indexPath.section].options![indexPath.row].optionTitle
        if selection == .SettingsScreenLocalizedString.General.language {
            self.navigationController?.pushViewController(LanguageViewController(), animated: true)
        }
    }
    /*
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        <#code#>
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        <#code#>
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        <#code#>
    }

    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        <#code#>
    }*/
}
