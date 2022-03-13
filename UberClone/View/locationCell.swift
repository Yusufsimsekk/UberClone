//
//  locationCell.swift
//  UberClone
//
//  Created by Yusuf Şimşek on 12.03.2022.
//

import UIKit

class locationCell: UITableViewCell {

// MARK: - Properties
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "123 M Main Street"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    private let addressLabel : UILabel = {
        let label = UILabel()
        label.text = "123 M Main Street, Washingtion, DC"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
// MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        
        let stackView = UIStackView.init(arrangedSubviews: [titleLabel,addressLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        
        addSubview(stackView)
        stackView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
