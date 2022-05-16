//
//  TimerAppApp.swift
//  TimerApp
//
//  Created by Jannatun Nahar Papia  on 15/5/22.
//

import SwiftUI

@main
struct TimerAppApp: App {
    //MARK: Since We're doing Background fetching Intilizing Here
    @StateObject var pomodoroModel: PomodoroModel = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pomodoroModel)
        }
    }
}
