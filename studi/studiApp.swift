//
//  studiApp.swift
//  studi
//
//  Created by Yassa Taiseer on 2023-08-22.
//

import SwiftUI
import UserNotifications


@main
struct studiApp: App {

    init(){
        print("init here")
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        if(UserDefaults.standard.float(forKey: "workTime")==0){
            UserDefaults.standard.set(5, forKey: "workTime")
            UserDefaults.standard.set(5, forKey: "breakTime")
            UserDefaults.standard.set(0, forKey: "restTime")
            UserDefaults.standard.set(0, forKey: "restTurn")
        }
        
    }

    var body: some Scene {
        WindowGroup {
            ContentView().frame(minWidth: 1000, minHeight:600).cornerRadius(12)
        }
        
    }
}
