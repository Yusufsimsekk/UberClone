
import Foundation
import UIKit

extension UIView {
    
    func inputContainerView(image: UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.alpha = 0.87
        view.addSubview(imageView)
        imageView.centerY(inView: view)
        imageView.anchor(left : view.leftAnchor, paddingLeft: 8, height: 24, width: 24)
         
        view.addSubview(textField)
        textField.anchor(bottom : view.bottomAnchor, right: view.rightAnchor,
                              left : imageView.rightAnchor,  paddingLeft: 10)
        textField.centerY(inView: view)
        
        let seperatorView = UIView()
        view.addSubview(seperatorView)
        seperatorView.backgroundColor = .lightGray
        seperatorView.anchor(bottom: view.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor, paddingLeft: 8, height: 0.75)
        
        
        return view
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right : NSLayoutXAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                paddingTop:CGFloat = 0,
                paddingBottom:CGFloat = 0,
                paddingLeft:CGFloat = 0,
                paddingRight:CGFloat = 0,
                height : CGFloat? = nil,
                width : CGFloat? = nil){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    
    func centerX(inView view : UIView) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    func centerY(inView view :UIView){
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}


extension UITextField {
    func textField(withPlaceholder : String, isSecureTextEntry : Bool) -> UITextField {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = .white
        tf.keyboardAppearance = .dark
        tf.isSecureTextEntry = isSecureTextEntry
        tf.attributedPlaceholder = NSAttributedString(string: withPlaceholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        return tf
    }
}
