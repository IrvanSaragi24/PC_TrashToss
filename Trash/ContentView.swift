//
//  ContentView.swift
//  Trash
//
//  Created by Irvan P. Saragi on 23/05/23.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    @State var buttonPause : Bool = true
    var scene = GameScene()
    var body: some View {
        ZStack{
            SpriteView(scene: scene)
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                ZStack{
                    Image("Brush2")
                        .resizable()
                        .frame(width: 730, height: 150)
                    Text("Trow 5 piece botol into the Trashbin")
                        .font(.body)
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                    
                }
                .padding(.top, -50)
                .padding(.leading, -400)
                Spacer()
            }
            HStack{
                Spacer()
                if buttonPause{
                    Button {
                        buttonPause = false
                    } label: {
                        Image(systemName: "pause.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .padding(.bottom, 280)
                            .padding(.trailing, 20)
                            .foregroundColor(.black)
                    }
                }
                else{
                    PauseView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
