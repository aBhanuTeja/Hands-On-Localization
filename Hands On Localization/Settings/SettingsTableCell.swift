//
//  SettingsTableCell.swift
//  Hands On Localization
//
//  Created by Bhanuteja on 24/02/22.
//

import UIKit

class SettingsTableCell: UITableViewCell {
    static let identifier = "SettingsTableCell"
    
    var data: options? {
      didSet {
          settingsOptionLabel.text = data?.optionTitle?.localized()
          if let image = data?.optionImage {
              settingsOptionImage.image = image
              settingsOptionImage.isHidden = false
              settingsOptionImage.tintColor = .label
          } else {
              settingsOptionImage.isHidden = true
          }

          switch data?.optionType {
          case .defaultType:
              accessoryType = .none
              accessoryView = .none
          case .switchType:
              accessoryView = settingSwitch
              accessoryType = .none
          case .hasSubItemsType:
              accessoryType = .disclosureIndicator
              accessoryView = .none
          case .none:
              break
          }
      }
    }

    private lazy var settingsOptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()

    private lazy var settingsOptionImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 5).isActive = true
        image.widthAnchor.constraint(equalToConstant: 35).isActive = true
        return image
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [settingsOptionImage, settingsOptionLabel])
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()

    private lazy var settingSwitch: UISwitch = {
        let settingsSwitch = UISwitch(frame: CGRect.zero) as UISwitch
        settingsSwitch.isOn = false
        settingsSwitch.addTarget(self, action: #selector(switchTriggered(_:)), for: .valueChanged)
//        settingsSwitch.tag = indexPath.row
        return settingsSwitch
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
        addSubview(stackView)
        addSubview(seperatorView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            seperatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            seperatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            seperatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    @objc func switchTriggered(_ sender: UISwitch) {
        if sender.isOn {
            
        } else {
            
        }
    }
}
