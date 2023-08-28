//
//  CustomizeView.swift
//  studi
//
//  Created by Yassa Taiseer on 2023-08-22.
//

import SwiftUI
import UserNotifications



struct CustomizeView: View {
    @State private var notifyMeAbout = false
    @State private var workTime = UserDefaults.standard.float(forKey: "workTime")
    @State private var breakTime = UserDefaults.standard.float(forKey: "breakTime")
    @State private var restTime = UserDefaults.standard.float(forKey: "restTime")
    @State private var restTurn = UserDefaults.standard.float(forKey: "restTurn")
    
    
    @State private var showingPopover = false



    
    @State private var isEditing = false
    @State private var isEditing2 = false

    
    @State var name: String = ""
    @State var address: String = ""
    @State var email: String = ""
    
    var body: some View {
        
        VStack(){
            Text("Pomodoro Customizer⚙️")
                .font(
                    Font.custom("Inter", size: 40)
                        .weight(.bold)
                )
                .foregroundColor(.white)
                .frame(width: .infinity, height: 43, alignment: .center)
            
            Spacer().frame(height: 50)
            Form{
                
                Group{
                    Text("Time Working ✏️:")
                    .font(
                    Font.custom("Inter", size: 20)
                    .weight(.bold)
                    )
                    .foregroundColor(.white)
                    .frame(width: 165, height: 28, alignment: .topLeading)
                    
                    Slider(
                        value: $workTime,
                        in: 5...100,
                        step: 5,
                        onEditingChanged: { editing in
                            isEditing = editing
                        }
                    )
                    Text("\(workTime)"+" Minutes")
                        .foregroundColor( .purple)
                }
                
            
                Group{
                    Text("Break Time 😮‍💨:")
                    .font(
                    Font.custom("Inter", size: 20)
                    .weight(.bold)
                    )
                    .foregroundColor(.white)
                    .frame(width: 165, height: 28, alignment: .topLeading)
                    
                    Slider(
                        value: $breakTime,
                        in: 5...100,
                        step: 5,
                        onEditingChanged: { editing in
                            isEditing2 = editing
                        }
                    )
                    Text("\(breakTime)"+" Minutes")
                        .foregroundColor( .purple)
                }

                      
                Group{
                    Text("Rest Time💤 :")
                    .font(
                    Font.custom("Inter", size: 20)
                    .weight(.bold)
                    )
                    .foregroundColor(.white)
                    .frame(width: 165, height: 28, alignment: .topLeading)


                    
                    Slider(
                        value: $restTime,
                        in: 0...100,
                        step: 5,
                        onEditingChanged: { editing in
                            isEditing2 = editing
                        }
                    )
                    Text("\(restTime)"+" Minutes")
                        .foregroundColor( .purple)
                }

    
                Group{
                    Slider(
                        value: $restTurn,
                        in: 0...10,
                        step: 1,
                        onEditingChanged: { editing in
                            isEditing2 = editing
                        }
                    )

                    Text("Rest After "+"\(restTurn)"+" Turns")
                    .font(
                    Font.custom("Inter", size: 20)
                    .weight(.bold)
                    )
                    .foregroundColor(.white)
                    .frame(width: 400, height: 28, alignment: .topLeading)
                       
                }
                
                Group{

                    Button(action: {
                        UserDefaults.standard.set(workTime, forKey: "workTime")
                        UserDefaults.standard.set(breakTime, forKey: "breakTime")
                        UserDefaults.standard.set(restTime, forKey: "restTime")
                        UserDefaults.standard.set(restTurn, forKey: "restTurn")
                        showingPopover = true


                    }) {
                        Text("Apply").font(
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
                    .popover(isPresented: $showingPopover) {
                        Text("Applied Changes")
                            .font(.headline)
                            .padding()
                                            }
                }
                


                
     
            }
            
            
        }
    }
}

struct CustomizeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeView()
    }
}
