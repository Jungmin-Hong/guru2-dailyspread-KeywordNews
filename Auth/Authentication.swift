//
//  Authentication.swift
//  KeywordNews
//
//  Created by 이현영 on 2022/02/02.
//

import UIKit
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import UserNotifications 

class Authentication: UIViewController, FUIAuthDelegate  {
    var handle:AuthStateDidChangeListenerHandle!
    let authUI = FUIAuth.defaultAuthUI()
    let userNotificationCenter = UNUserNotificationCenter.current()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //authUI!.delegate = self
        navigationController?.navigationBar.isHidden = false //back버튼 생기게 하는 코드(false일떄)
        self.navigationItem.hidesBackButton = true
        userNotificationCenter.delegate = self
        requestNotificationAuthorization()
        sendNotification() //알림
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            if let currentUser = auth.currentUser {
                //로그인 된 상태
                NSLog("Logged In")
                if let displayName = currentUser.displayName {
                    let alertController = UIAlertController(title: "Welcome,\(displayName)!", message: "Daily Spread에 오신 것을 환영합니다.", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                        //ok버튼 누르면 화면 넘어감
                        let nextVC = GetKeyword.init(nibName: nil, bundle: nil)
                        self.navigationController?.pushViewController(nextVC, animated: true)
                    }))
                    self.present(alertController, animated: false, completion: nil)
                }
            }else{
                NSLog("Logged out")
                //로그아웃된 상태
                self.authUI!.delegate = self
                let googleAuthProvider = FUIGoogleAuth(authUI: self.authUI!)
                let providers: [FUIAuthProvider] = [
                  googleAuthProvider
                  
                ]
                self.authUI!.providers = providers
                let authVC = self.authUI?.authViewController()
                authVC?.modalPresentationStyle = .fullScreen
                self.present(authVC!, animated: false, completion: nil)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    // 로그인이 안되어 있으면 무조건 로그인 창을 켜라
    // 로그 아웃 기능 실행 후에 로그인 창을 띄워라
    // 한쪽에 앱을 켜놓고 -> 다른쪽에 로그인을 했다.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    

    @IBAction func doSignOut(_ sender: UIButton) {
        try? authUI?.signOut()
        
    }
    
    func requestNotificationAuthorization() { //알림 권한 요청
        let authOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        userNotificationCenter.requestAuthorization(options: authOptions) { success, error in
            print("Error: \(error)")
        }
    }
    
    func sendNotification() { //알림 보내기
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Daily Spread"
        notificationContent.body = "오늘의 키워드별 뉴스를 확인해보세요!"
        
        var dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        dateComponents.hour = 09
        dateComponents.minute = 00
        dateComponents.second = 00

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: "Noti", content: notificationContent, trigger: trigger)
        
        userNotificationCenter.add(request) { error in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
    }
}

extension Authentication: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
}

extension FUIAuthBaseViewController {
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = nil
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}





