
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
        return UIView().inputContainerView(image:  UIImage(named: "ic_mail_outline_white_2x")!, textField: emailTextField)
    }()
    private lazy var passwordContainerView: UIView = {
        return UIView().inputContainerView(image:  UIImage(named: "ic_lock_outline_white_2x")!, textField: passwordTextField)
    }()
    private let emailTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    private let passwordTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
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
        
        view.addSubview(passwordContainerView)
        passwordContainerView.anchor(top: emailContainerView.bottomAnchor,
                                  right: view.rightAnchor,
                                  left: view.leftAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16, height: 40)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
