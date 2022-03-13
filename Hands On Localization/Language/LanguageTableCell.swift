//
//  LanguageTableCell.swift
//  Hands On Localization
//
//  Created by Bhanuteja on 25/02/22.
//

import UIKit

class LanguageTableCell: UITableViewCell {
    static let identifier = "LanguageTableCell"

    var data: LanguageScreenDisplayData? {
        didSet {
            languageLabel.text = data?.language?.localized()
            if Language.currentAppLanguage() == data?.languageCode {
                accessoryType = .checkmark
            }
        }
    }
    
    private lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.systemFont(ofSize: 16)
        return label
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
        addSubview(languageLabel)
        NSLayoutConstraint.activate([
            languageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            languageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5),
            languageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            languageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
}
