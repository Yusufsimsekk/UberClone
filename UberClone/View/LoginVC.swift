
import Foundation
import UIKit

class LoginVC : UIViewController {
    
    //MARK: - Properties
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "UBER"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
    }()
    private lazy var emailContainerView: UIView = {
        let view = UIView()
        
        
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ic_mail_outline_white_2x")
        imageView.alpha = 0.87
        view.addSubview(imageView)
        imageView.centerY(inView: view)
        imageView.anchor(left : view.leftAnchor, paddingLeft: 8, height: 24, width: 24)
         
        view.addSubview(emailTextField)
        emailTextField.anchor(bottom : view.bottomAnchor, right: view.rightAnchor,
                              left : imageView.rightAnchor,  paddingLeft: 10)
        emailTextField.centerY(inView: view)
        
        let seperatorView = UIView()
        view.addSubview(seperatorView)
        seperatorView.backgroundColor = .lightGray
        seperatorView.anchor(bottom: view.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor, paddingLeft: 8, height: 0.75)
        
        return view
    }()
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = .white
        tf.keyboardAppearance = .dark
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        
        
        return tf
    }()
    
    
    //MARK: - Lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 25/255, green: 25/255, blue: 25/255, alpha: 25/255)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        view.addSubview(emailContainerView)
        emailContainerView.anchor(top: titleLabel.bottomAnchor,
                                  right: view.rightAnchor,
                                  left: view.leftAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16, height: 40)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}