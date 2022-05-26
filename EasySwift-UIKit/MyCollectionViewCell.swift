
import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    static let reuseId = "MyCollectionViewCell"
    
    let labelStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
        }()
    
    let ownLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
        }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelName: UILabel = {
        let label = UILabel()
        label.text = "COW - Copy on write"
        label.font = UIFont(name:"SF Pro", size: 19)
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelDate: UILabel = {
        let label = UILabel()
        label.text = "28.04.2022"
        label.font = UIFont(name:"SF Pro", size: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelTime: UILabel = {
        let label = UILabel()
        label.text = "56 минут"
        label.font = UIFont(name:"SF Pro", size: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
        
        contentView.addSubview(imageView)
        contentView.addSubview(ownLabelStackView)
        ownLabelStackView.addArrangedSubview(labelName)
        ownLabelStackView.addArrangedSubview(labelStackView)
        labelStackView.addArrangedSubview(labelDate)
        labelStackView.addArrangedSubview(labelTime)
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .white
        
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: ownLabelStackView.topAnchor, constant: -10).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2/3).isActive = true
        
        ownLabelStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        ownLabelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        ownLabelStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        ownLabelStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
    }
}
