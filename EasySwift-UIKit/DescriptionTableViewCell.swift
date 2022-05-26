//
//  DescriptionTableViewCell.swift
//  Parallax
//
//  Created by Emil Shpeklord on 28.04.2022.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    let identifier: String = "descr"

    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "No Heart"
        return label
    }()

    var discriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.71)
        let titleFont = UIFont.preferredFont(forTextStyle: .title1)
        if let boldDescriptor = titleFont.fontDescriptor.withSymbolicTraits(.traitBold) {
            label.font = .systemFont(ofSize: 13)
        } else {
            label.font = titleFont
        }
        label.numberOfLines = 0
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.text = """
        Young Savage, why you trappin' so hard, huh?
        Why these niggas cappin' so hard, huh?
        Why you got a twelve car garage, huh?
        Why you pullin' all these rappers cards?
        'Cause these niggas pussy and I'm hard
        I turn that fuckin' soft into some hard
        I grew up in the streets without no heart
        I'm prayin' to my Glock and my carbon
        Young Savage, why you trappin' so hard, huh?
        Why these niggas cappin' so hard, huh?
        Why you got a twelve car garage, huh?
        Why you pullin' all these rappers cards?
        'Cause these niggas pussy and I'm hard
        I turn that fuckin' soft into some hard
        I grew up in the streets without no heart
        Young Savage, why you trappin' so hard, huh?
        Why these niggas cappin' so hard, huh?
        Why you got a twelve car garage, huh?
        Why you pullin' all these rappers cards?
        'Cause these niggas pussy and I'm hard
        I turn that fuckin' soft into some hard
        I grew up in the streets without no heart
        
        Young Savage, why you trappin' so hard, huh?
        Why these niggas cappin' so hard, huh?
        Why you got a twelve car garage, huh?
        Why you pullin' all these rappers cards?
        'Cause these niggas pussy and I'm hard
        I turn that fuckin' soft into some hard
        I grew up in the streets without no heart
        I'm prayin' to my Glock and my carbon
        Young Savage, why you trappin' so hard, huh?
        Why these niggas cappin' so hard, huh?
        Why you got a twelve car garage, huh?
        Why you pullin' all these rappers cards?
        'Cause these niggas pussy and I'm hard
        I turn that fuckin' soft into some hard
        I grew up in the streets without no heart
        Young Savage, why you trappin' so hard, huh?
        Why these niggas cappin' so hard, huh?
        Why you got a twelve car garage, huh?
        Why you pullin' all these rappers cards?
        'Cause these niggas pussy and I'm hard
        I turn that fuckin' soft into some hard
        I grew up in the streets without no heart
        """
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(discriptionLabel)

        titleLabel.snp.makeConstraints({ make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
            make.top.equalToSuperview()
        })

        discriptionLabel.snp.makeConstraints({ make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
            make.top.equalTo(titleLabel.snp.bottom).inset(-8)
            make.bottom.equalToSuperview().inset(16)
        })
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
