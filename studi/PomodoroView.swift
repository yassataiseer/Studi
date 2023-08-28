//
//  PomodoroView.swift
//  studi
//
//  Created by Yassa Taiseer on 2023-08-23.
//

import SwiftUI
import UserNotifications


struct PomodoroView: View {

    @State private var workTime = UserDefaults.standard.float(forKey: "workTime")
    @State private var breakTime = UserDefaults.standard.float(forKey: "breakTime")
    @State private var restTime = UserDefaults.standard.float(forKey: "restTime")
    @State private var restTurn = UserDefaults.standard.float(forKey: "restTurn")

    @State private var timeRemaining = Int(UserDefaults.standard.float(forKey: "workTime")*60)
    @State private var pause = true

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    @State private var Action = ["Work Time", "Break Time", "Rest Time"]
    @State private var ActionTime = [UserDefaults.standard.float(forKey: "workTime"), UserDefaults.standard.float(forKey: "breakTime"),UserDefaults.standard.float(forKey: "restTime")]
    @State private var Index = 0
    @State private var Turn = 1
    @State private var Cycles = 1
    var body: some View {
        VStack{
            Group{
                Text("\(Action[Turn-1])" + " For: "+"\(ActionTime[Turn-1])"+" Minutes")
                    .font(
                        Font.custom("Inter", size: 40)
                            .weight(.bold)
                    )
                    .foregroundColor(.white)
                    .frame(width: .infinity, height: 43, alignment: .center)
                //Text("Cycle Number: " + "\(Cycles)")
                Text("Count Down: "+"\(timeRemaining)"+" Seconds")
                    .onReceive(timer) { _ in
                        if (timeRemaining > 0 && !pause ) {
                            timeRemaining -= 1
                        }
                        if(timeRemaining==0){
                            Forward()
                        }
                    }
                    .font(
                        Font.custom("Inter", size: 40)
                            .weight(.bold)
                    )
                    .foregroundColor(.white)
                    .frame(width: .infinity, height: 43, alignment: .center)
            }
        }
        HStack{
            
            

            
            
            Group{

                
                Button(action: {
                    pause = !pause
                }) {
                    Text(Image(systemName: "playpause.fill")).font(
                        Font.custom("Inter", size: 20)
                            .weight(.bold)
                    )
                    .frame(width: 192, height: 41)
                    .foregroundColor(.white)
                    .background(Color(red: 0.62, green: 0, blue: 1))
                    
                }
                .clipShape(Capsule())
                .buttonStyle(PlainButtonStyle())
                .contentShape(Rectangle())
                
                
                Button(action: {
                    Forward()
                }) {
                    Text(Image(systemName: "forward.fill")).font(
                        Font.custom("Inter", size: 20)
                            .weight(.bold)
                    )
                    .frame(width: 192, height: 41)
                    .foregroundColor(.white)
                    .background(Color(red: 0.62, green: 0, blue: 1))
                    
                }
                .clipShape(Capsule())
                .buttonStyle(PlainButtonStyle())
                .contentShape(Rectangle())
                
                
            }

            
        }
        
    }
    func Forward(){
        
        Turn = Turn+1
        
        if(Turn>Action.count){
            Turn = 1
            Cycles = Cycles+1
        }

        
        if(ActionTime[Turn-1]==0){
            Turn = 1;
        }
        if(Turn==3){
            print("Turn")
            
            if(Int(restTurn)==Cycles){
                Cycles = 0;
            }else{
                Turn = 1
                Cycles = Cycles+1;
            }
        }
        timeRemaining = Int(ActionTime[Turn-1]*60)
        
        let content = UNMutableNotificationContent()
        content.title = "Next Phase"
        content.subtitle = "It is now "+"\(Action[Turn-1])"
        content.sound = UNNotificationSound.default

        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
}

struct PomodoroView_Previews: PreviewProvider {
    static var previews: some View {
        PomodoroView()
    }
}
