
import Foundation
import UIKit
import Firebase

class SignUpController : UIViewController {
    
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
    private lazy var fullNameContainerView: UIView = {
        let view = UIView().inputContainerView(image:  UIImage(named: "ic_person_outline_white_2x")!, textField: fullNameTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image:  UIImage(named: "ic_lock_outline_white_2x")!, textField: passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var accountTypeContainerView: UIView = {
        let view = UIView().inputContainerView(image: UIImage(named: "ic_person_outline_white_2x")!,
                                               segmentedControl: accountTypeSegmentedControl)
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
    
    private let emailTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
    private let fullNameTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Full Name", isSecureTextEntry: false)
    }()
    
    private let passwordTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()
    
    private let signUpButton : AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    private let accountTypeSegmentedControl : UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Rider", "Driver"])
        sc.backgroundColor = UIColor.white
        sc.selectedSegmentTintColor = .backgroundColor
        sc.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        sc.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    private let alreadyHaveAccountButton : UIButton = {
       let button = UIButton()
        let attrString = NSMutableAttributedString(string: "Already have an account? ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
             NSAttributedString.Key.foregroundColor : UIColor.white])
        attrString.append(NSMutableAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
             NSAttributedString.Key.foregroundColor : UIColor.mainBlueTint]))
        button.setAttributedTitle(attrString, for: .normal)
        button.addTarget(self, action: #selector(handleShowLogIn), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavigationBar()
    }
    
    //MARK: - Selectors
    
    @objc func handleSignUp(){
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else {return}
        guard let fullname = fullNameTextField.text else {return}
        let accountTypeIndex = accountTypeSegmentedControl.selectedSegmentIndex
        
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to register with error : \(error)")
                return
            }
            guard let uid = result?.user.uid else {return}
            
            let values = ["email" : email,
                          "fullname" : fullname,
                          "password" : password,
                          "AccountType" : accountTypeIndex ] as [String : Any]
            Database.database().reference().child("users").child(uid).updateChildValues(values) { error, ref in
                print("succesfully registered user and saved data..")
            }
        }
    }
    
    @objc func handleShowLogIn(){
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Helper Functions
    
    func configureUI(){
        view.backgroundColor = .backgroundColor
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
       let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                  fullNameContainerView,
                                                  passwordContainerView,
                                                  accountTypeContainerView,
                                                  signUpButton
                                                  ])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 24
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor,
                     paddingTop: 16,  paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom : view.safeAreaLayoutGuide.bottomAnchor, height: 32)
    }

    func configureNavigationBar(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
   
}
