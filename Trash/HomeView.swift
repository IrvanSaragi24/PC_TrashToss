//
//  HomeView.swift
//  Trash
//
//  Created by Irvan P. Saragi on 24/05/23.
//

import SwiftUI

struct HomeView: View {
    @State private var ButtonSound : Bool = false
    @State private var PlayGame : Bool = true
    
    var body: some View {
        if PlayGame{
            ZStack{
                Image("BackGroundGamePlay")
                    .resizable()
//                    .scaledToFit()
                    .frame(width: 850, height: 400)
                    .ignoresSafeArea()
                    .padding(.top)
                VStack{

                    Button {
                        print("Game play")
                        PlayGame.toggle()
                        
                    } label: {
                        Image(systemName: "play.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.brown)
                    }
                    .padding(.top, 50)
                    ZStack{
                        Image("Brush")
                            .resizable()
                            .frame(width: 500, height: 120)
                        Text("Trash Toss")
                            .fontWeight(.heavy)
                            .font(.system(size: 50))
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .padding(.top, -20)
                }
                HStack{
                    Spacer()
                        Button {
                            
                            ButtonSound.toggle()
                            toggleSound()
                        } label: {
                            Image(systemName: ButtonSound ?"speaker.slash.fill" : "speaker.fill" )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.black)
                                .padding(.bottom, 250)
                                .padding(.trailing, 30)
                        }
                }
            }
        }
        else{
            ContentView()
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    func toggleSound() {
            if ButtonSound {
                audioPlayer?.pause()
            } else {
                playSound(sound: "MainSound", type: "mp3")
                audioPlayer?.play()
            }
            
//            isPlaying.toggle()
        }

}






struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
