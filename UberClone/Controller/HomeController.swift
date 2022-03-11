
import UIKit
import Firebase
import MapKit

class HomeController : UIViewController{
    
    
    //MARK: - Properties
    
    private let mapView = MKMapView()
    
    //MARK: - Selectors
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        checkUserIfLoggedIn()
//        signOut()
    }
    
    //MARK: - API
    
    func checkUserIfLoggedIn(){
        if Auth.auth().currentUser?.uid == nil{
            print("DEBUG: user is not logged in..")
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            configureUI()
            print("DEBUG: user id is :\(Auth.auth().currentUser?.uid)")
        }
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error signing out")
        }
    }
    
    //MARK: - Helper Functions
    
    func configureUI(){
        view.addSubview(mapView)
        mapView.frame = view.frame
    }
    
}
