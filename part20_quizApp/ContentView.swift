//
//  ContentView.swift
//  part20_quizApp
//
//  Created by emi oiso on 2023/11/02.
//

//
// ContentView.swift
// part20_quizApp
//
// Created by emi oiso on 2023/11/02.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    //   各ボタンの初期値
    @State private var tortoiseCheck: Bool = false
    @State private var fishCheck: Bool = false
    @State private var birdCheck: Bool = false
    @State private var bearCheck: Bool = false
    @State private var bearButtonCount = 0
    //    音楽再生の初期値
    @State var player: AVAudioPlayer?
    @State private var isBearButtonEnabled: Bool = true
    
    var body: some View {
        ZStack {
            VStack {
                Text("What's in the box?")
                    .font(.largeTitle)
                    .padding(.bottom, 30)
                Image(systemName: "shippingbox")
                    .font(.largeTitle)
                    .padding(.bottom, 30)
                
                VStack {
                    //カメの処理
                    
                    if tortoiseCheck == true {
                        Image(systemName: "xmark")
                            .font(.system(size: 100))
                            .foregroundColor(Color.blue)
                    }
                    Button {
                        tortoiseCheck = true
                        fishCheck = false
                        birdCheck = false
                        bearCheck = false
                        print("カメだよ")
                    } label: {
                        Image(systemName: "tortoise")
                            .font(.system(size: 30))
                            .padding()
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: 80)
                            .background(Color.orange)
                            .foregroundColor(Color.black)
                            .padding(5)
                    }
                    
                    //サカナの処理
                    if fishCheck == true {
                        Image(systemName: "xmark")
                            .font(.system(size: 100))
                            .foregroundColor(Color.blue)
                    }
                    Button {
                        tortoiseCheck = false
                        fishCheck = true
                        birdCheck = false
                        bearCheck = false
                        print("サカナだよ")
                    } label: {
                        Image(systemName: "fish")
                            .font(.system(size: 30))
                            .padding()
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: 80)
                            .background(Color.orange)
                            .foregroundColor(Color.black)
                            .padding(5)
                    }
                    
                    //ハトの処理
                    if birdCheck == true {
                        Image(systemName: "xmark")
                            .font(.system(size: 100))
                            .foregroundColor(Color.blue)
                    }
                    Button {
                        tortoiseCheck = false
                        fishCheck = false
                        birdCheck = true
                        bearCheck = false
                        print("ハトだよ")
                        
                    } label: {
                        Image(systemName: "bird")
                            .font(.system(size: 30))
                            .padding()
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: 80)
                            .background(Color.orange)
                            .foregroundColor(Color.black)
                            .padding(5)
                    }
                }
                
                
                
                //　くまちゃんの処理
                if bearCheck == true {
                    Text("〜HappyBirthDay〜")
                    Text("🧸🍯🧡")
                }
                
                Button {
                    tortoiseCheck = false
                    fishCheck = false
                    birdCheck = false
                    bearCheck = true
                    
                    //　クマのボタンの有効処理
                    if !isBearButtonEnabled {
                        tortoiseCheck = false
                        return
                    }
                    
                    // 音楽が再生中の場合、停止
                    if player?.isPlaying == true {
                        player?.stop()
                        player = nil
                        isBearButtonEnabled = true
                    } else {
                        // hbdの曲を再生
                        playSound(fileName: "edithbd")
                        isBearButtonEnabled = false
                    };
                    
                    if bearButtonCount > 0 {
                        bearCheck = false
                        if bearButtonCount > 0 {
                        }
                        bearCheck = false;    
                        bearButtonCount  += 1
                    }
                    bearButtonCount += 1
                    
                    
                    
                    print("くまちゃんだよ")
                } label: {
                    Image(systemName: "teddybear")
                        .font(.system(size: 30))
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 80)
                        .background(Color.orange)
                        .foregroundColor(Color.black)
                        .padding(5)
                }
                
                //　リセットの処理
                Button {
                    tortoiseCheck = false
                    fishCheck = false
                    birdCheck = false
                    bearCheck = false
                    bearButtonCount = 0
                    
                    
                    // 音楽を停止する
                    player?.stop()
                    player = nil
                    isBearButtonEnabled = true
                    
                    print("リセット")
                } label: {
                    Text("Reset")
                        .font(.system(size: 30))
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 80)
                        .background(Color.orange)
                        .foregroundColor(Color.black)
                }
                
            }
        }
        .padding()
    }
    func playSound(fileName:String){
        if let soundData = NSDataAsset(name:fileName){
            do {
                player = try AVAudioPlayer(data: soundData.data)
                player?.play()
            } catch {
                print("音楽実行エラー")
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
