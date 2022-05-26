//
//  HeaderView.swift
//  Parallax
//
//  Created by Emil Shpeklord on 28.04.2022.
//

import UIKit
import SnapKit

final class HeaderView: UITableViewHeaderFooterView {

    public var imageHeightConstraint: Constraint?
    private var headerImageHeightMultiplier: Double = 0
    public var headerImageHeightOffset: CGFloat {
        return contentView.frame.maxY - headerImageView.frame.maxY
    }

    private var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.font = .boldSystemFont(ofSize: 19)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "21 Savage"
        return label
    }()

    private var headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        if let image = UIImage(named: "21savage") {
            imageView.image = image
        }
        imageView.clipsToBounds = true
        return imageView
    }()
    init(frame: CGRect) {
        super.init(reuseIdentifier: nil)
        self.frame = frame
        createUI()
    }

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        createUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createUI() {
        if (UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0) > 20 {
            headerImageHeightMultiplier = 0.856
        } else {
            headerImageHeightMultiplier = 0.842
        }
        contentView.addSubview(headerImageView)
        contentView.addSubview(headerLabel)

        headerImageView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            imageHeightConstraint = make.height.equalTo(self.frame.height * headerImageHeightMultiplier).constraint
            make.bottom.equalToSuperview()
        }

        headerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.bottom.equalTo(headerImageView.snp.bottom).inset(16)
        }
    }
}
