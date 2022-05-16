//
//  Home.swift
//  TimerApp
//
//  Created by Jannatun Nahar Papia  on 15/5/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PomodoroModel())
    }
}
