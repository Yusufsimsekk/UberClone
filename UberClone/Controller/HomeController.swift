
import UIKit
import Firebase
import MapKit

class HomeController : UIViewController{
    
    
    //MARK: - Properties
    
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    
    //MARK: - Selectors
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        checkUserIfLoggedIn()
        enableLocationServices()
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
        configureMapView()
    }
    func configureMapView(){
        view.addSubview(mapView)
        mapView.frame = view.frame
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
}
//MARK: - Location Services
extension HomeController: CLLocationManagerDelegate{
    
    func enableLocationServices(){
        locationManager.delegate = self
        
        switch locationManager.authorizationStatus{
        case .notDetermined:
            print("DEBUG: not determined..")
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedAlways:
            print("DEBUG: Auth always..")
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        case .authorizedWhenInUse:
            print("DEBUG: Auth when in use..")
            locationManager.requestAlwaysAuthorization()
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse{
            locationManager.requestAlwaysAuthorization()
        }
    }
}
