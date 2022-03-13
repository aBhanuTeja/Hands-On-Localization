//
//  HomeViewController.swift
//  Hands On Localization
//
//  Created by Bhanuteja on 23/02/22.
//

import UIKit

//public protocol DataFetchable {
//    func generateHomeScreenData()
//}

class HomeViewController: UIViewController {

    /*  let dataFetchable: DataFetchable

      init(dataFetchable: DataFetchable) {
          self.dataFetchable = dataFetchable
          super.init(nibName: nil, bundle: nil)
      }

      public required init?(coder: NSCoder) {
          fatalError()
      }*/

    private lazy var homeTableView: UITableView = {
        var tableview = UITableView(frame: self.view.frame, style: .plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(HomeTableCell.self, forCellReuseIdentifier: HomeTableCell.identifier)
        tableview.tableFooterView = UIView()
        tableview.separatorStyle = .none
        tableview.rowHeight = 50
        return tableview
    }()

    var homeScreenData = [HomeScreenData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(homeTableView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Home".localized()
        homeScreenData.removeAll()
        homeScreenData = HomeScreenDisplayData.shared.generateHomeScreenData()
        homeTableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeScreenData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableCell.identifier, for: indexPath) as! HomeTableCell
        cell.data = homeScreenData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = HomeData.allCases[indexPath.row]
        switch selectedItem {
        case .settings:
            self.navigationController?.pushViewController(SettingsViewController(), animated: true)
        default:
            break
        }
    }
}
