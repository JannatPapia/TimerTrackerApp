//
//  Home.swift
//  TimerApp
//
//  Created by Jannatun Nahar Papia  on 15/5/22.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var pomodoroModel: PomodoroModel
    var body: some View {
        VStack{
            Text("Pomodoro Timer")
                .font(.title2.bold())
                .foregroundColor(.white)
            
            GeometryReader { proxy in
                VStack(spacing: 15){
                    //MARK: Timer Ring
                    ZStack{
                        Circle()
                            .fill(.white.opacity(0.03))
                            .padding(-40)
                        
                        Circle()
                            .trim(from: 0, to: pomodoroModel.progress)
                            .stroke(Color.white.opacity(0.03),lineWidth: 80)
                        
                        //MARK: Shadow
                        Circle()
                            .stroke(Color.purple,lineWidth: 5)
                            .blur(radius: 15)
                            .padding(-2)
                        
                        Circle()
                            .fill(Color.blue.opacity(0.03))
                        
                        Circle()
                            .trim(from: 0, to: pomodoroModel.progress)
                            .stroke(Color.purple.opacity(0.7),lineWidth: 15)
                        
                        //MARK: Knob
                        GeometryReader { proxy in
                            let size = proxy.size
                            
                            Circle()
                                .fill(Color.purple.opacity(0.7))
                                .frame(width: 30, height: 30)
                                .overlay(content: {
                                    Circle()
                                        .fill(.white)
                                        .padding(5)
                                })
                                .frame(width: size.width, height: size.height, alignment: .center)
                            //MARK: Since View is Rotated Thats Why Using X
                                .offset(x: size.height/2)
                                .rotationEffect(.init(degrees: pomodoroModel.progress * 360))
                            
                        }
                        
                        Text(pomodoroModel.timerStringValue)
                            .font(.system(size: 45, weight: .light))
                            .rotationEffect(.init(degrees: -90))
                            .animation(.none, value: pomodoroModel.progress)
                    }
                    .padding(60)
                    .frame(height: proxy.size.width)
                    .rotationEffect(.init(degrees: -90.0))
                    .animation(.easeInOut, value: pomodoroModel.progress)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

                    Button{
                        if pomodoroModel.isStarted{
                            
                        } else {
                            pomodoroModel.addNewTimer = true
                        }
                    }label:{
                        Image(systemName: !pomodoroModel.isStarted ? "timer" : "pause")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80)
                            .background{
                                Circle()
                                    .fill(Color.purple.opacity(0.7))
                            }
                            .shadow(color: Color.purple.opacity(0.7), radius: 8, x: 0, y: 0)
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
        .padding()
        .background{
            Color.purple.opacity(0.08)
                .ignoresSafeArea()
        }
        .overlay(content: {
            ZStack{
                Color.black
                    .opacity(pomodoroModel.addNewTimer ? 0.25 : 0)
                    .onTapGesture {
                        pomod
                    }
                
                NewTimerView()
                    .frame(maxHidth: .infinity, alignment: .bottom)
                    .offset(y: PomodoroModel.addNewTimer ? 0 : 400)
            }
            .animation(.easeInOut, value: PomodoroModel.addNewTimer)
        })
        .preferredColorScheme(.dark)
    }
    
    //MARK: New Timer Bottom Sheet
    @ViewBuilder
    func NewTimerView() -> some View {
        VStack(spacing: 15) {
            Text("Add New Timer")
                .font(.title2.bold())
                .foregroundColor(.white)
                .padding(.top, 10)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.purple)
                .ignoresSafeArea()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PomodoroModel())
    }
}
