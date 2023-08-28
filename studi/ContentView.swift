//
//  ContentView.swift
//  studi
//
//  Created by Yassa Taiseer on 2023-08-22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var hover: Bool = false
    @State private var showCustomizeView = false
    @State var selection: Int?

    var body: some View {
        
        VStack(spacing: 10) {
            
            
            NavigationView {
                
                List {
                    Spacer()
                    NavigationLink(destination: PomodoroView(), tag: 0,selection: self.$selection) {
                            Label("Pomodoro", systemImage: "timer.circle").font(
                                Font.custom("Inter", size: 20)
                                .weight(.bold)
                                ).frame( maxWidth: 120).listStyle(SidebarListStyle())

                    }
                    
                    NavigationLink(destination: CustomizeView(), tag: 1, selection: self.$selection) {
                            Label("Customize", systemImage: "wrench.adjustable").font(
                                Font.custom("Inter", size: 20)
                                .weight(.bold)
                                ).frame( maxWidth: 125).listStyle(SidebarListStyle())
                    }
                    
                }.frame(minWidth: 40).onAppear {
                    self.selection = 0
                }
                
            }.background(Color.black)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
struct DetailView: View {
    var body: some View {
        Text("This is the detail view")
    }
}
