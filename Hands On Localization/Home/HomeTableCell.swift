//
//  HomeTableCell.swift
//  Hands On Localization
//
//  Created by Bhanuteja on 23/02/22.
//

import UIKit

class HomeTableCell: UITableViewCell {
    static let identifier = "HomeTableCell"

    var data: HomeScreenData? {
      didSet {
          homeOptionLabel.text = data?.title.localized()
          homeOptionImage.image = data?.image
          homeOptionImage.tintColor = .label
      }
    }

    private lazy var homeOptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    private lazy var homeOptionImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 25).isActive = true
        image.widthAnchor.constraint(equalToConstant: 25).isActive = true
        return image
    }()

    private lazy var seperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        view.backgroundColor = .separator
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        self.selectionStyle = .none
        accessoryType = .disclosureIndicator
        addSubview(homeOptionImage)
        addSubview(homeOptionLabel)
        addSubview(seperatorView)
        NSLayoutConstraint.activate([
            homeOptionImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            homeOptionImage.centerYAnchor.constraint(equalTo: centerYAnchor),

            homeOptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            homeOptionLabel.leadingAnchor.constraint(equalTo: homeOptionImage.trailingAnchor, constant: 12),

            seperatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            seperatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            seperatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
