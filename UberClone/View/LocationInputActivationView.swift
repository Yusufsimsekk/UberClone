//
//  LocationInputActivationView.swift
//  UberClone
//
//  Created by Yusuf Şimşek on 12.03.2022.
//

import UIKit

protocol LocationInputActivationViewDelegate: AnyObject {
    func presentLocationInputView()
}

class LocationInputActivationView : UIView {
    //MARK: - Properties
    
    weak var delegate :LocationInputActivationViewDelegate?
    
    private let indicatorView : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let placeHolderLabel: UILabel = {
       let label = UILabel()
        label.text = "Where To?"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addShadow()
        
        addSubview(indicatorView)
        indicatorView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 16 )
        indicatorView.setDimensions(height: 7, width: 7)
//                indicatorView.anchor(left: leftAnchor, paddingLeft: 16, height: 6, width: 6)
        indicatorView.layer.cornerRadius = 3.5
        addSubview(placeHolderLabel)
        placeHolderLabel.centerY(inView: self, leftAnchor: indicatorView.rightAnchor, paddingLeft: 20)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(presentLocationInputView))
        addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    MARK: - Selectors
    @objc func presentLocationInputView(){
        delegate?.presentLocationInputView()
    }
}
