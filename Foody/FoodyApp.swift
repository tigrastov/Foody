
import SwiftUI
import FirebaseCore
import FirebaseAuth
let screen = UIScreen.main.bounds

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      print("Firebase configured")

    return true
  }
}

@main

struct FoodyApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
        
    
      NavigationView {
       
          if let user = AuthService.shared.currentUser{
              
              if user.uid == "7pCgn3tE3JWpk6ceCo1sao0YYXJ3"{
                  
                  AdminOrdersView()
                  
              }else{
                  let viewModel = MainTabBarViewModel(user: user)
                  TabBar(viewModel: viewModel)
              }
              
          }else{
              AuthView()
          }
          
          
          
      }
    }
      
    
  }
}
