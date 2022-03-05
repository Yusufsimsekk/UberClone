//
//  AuthButton.swift
//  UberClone
//
//  Created by Yusuf Şimşek on 5.03.2022.
//

import UIKit

class AuthButton: UIButton {

    override init(frame: CGRect){
        super.init(frame: frame)
        setTitleColor(UIColor(white: 1, alpha: 0.8), for: .normal)
        backgroundColor = .mainBlueTint
        layer.cornerRadius = 10
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
