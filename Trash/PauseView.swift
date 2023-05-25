//
//  PauseView.swift
//  Trash
//
//  Created by Irvan P. Saragi on 24/05/23.
//

import SwiftUI

struct PauseView: View {
    @State private var GoHome :Bool = false
    @State private var tryAgain :Bool = false
    var body: some View {
        //
        
        if GoHome{
            HomeView()
        }
        else if tryAgain{
            ContentView()
                .ignoresSafeArea(.all)
        }
        else{
            ZStack{
                Image("Back")
                    .resizable()
                    .frame(width: 850, height: 410)
                    .ignoresSafeArea()
                HStack(){
                    Button {
                        print("BackHome")
                        GoHome.toggle()
                    } label: {
                        ZStack{
                            Image("Brush2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 500, height: 400)
                            Text("Home")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .fontWeight(.heavy)
                                .padding(.bottom)
                        }
                    }
                    
                    Button {
                        tryAgain.toggle()
                    } label: {
                        ZStack{
                            Image("Brush2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 500, height: 400)
                            Text("Try Again")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .fontWeight(.heavy)
                                .padding(.bottom)
                        }
                    }
                    
                }
            }
        }
    }
    
}
    
    struct PauseView_Previews: PreviewProvider {
        static var previews: some View {
            PauseView()
        }
    }
