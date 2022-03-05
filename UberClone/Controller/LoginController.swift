
import Foundation
import UIKit

class LoginController : UIViewController {
    
    //MARK: - Properties
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "UBER"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
    }()
    
    private lazy var emailContainerView: UIView = {
        let view = UIView().inputContainerView(image:  UIImage(named: "ic_mail_outline_white_2x")!, textField: emailTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image:  UIImage(named: "ic_lock_outline_white_2x")!, textField: passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let emailTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
    private let passwordTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()
    
    private let loginButton : AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    private let dontHaveAccountButton : UIButton = {
       let button = UIButton()
        let attrString = NSMutableAttributedString(string: "Don't have an account? ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
             NSAttributedString.Key.foregroundColor : UIColor.white])
        attrString.append(NSMutableAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
             NSAttributedString.Key.foregroundColor : UIColor.mainBlueTint]))
        button.setAttributedTitle(attrString, for: .normal)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavigationBar()
    }

    
    //MARK: - Selectors
    @objc func handleShowSignUp(){
        let controller = SignUpController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - HelperFuncitons
    
    func configureUI(){
        view.backgroundColor = .backgroundColor
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
       let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                  passwordContainerView,
                                                  loginButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 24
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor,
                     paddingTop: 16,  paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom : view.safeAreaLayoutGuide.bottomAnchor, height: 32)
    }
    func configureNavigationBar(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
}
