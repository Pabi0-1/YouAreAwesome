//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Student1 on 1/27/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageString = ""
    @State private var imageNumber = 1
    @State private var messageNumber = 0
    @State private var audioPlayer: AVAudioPlayer!
    @State private var lastSoundNumber = -1
    let numberOfSounds = 5
    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 150)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            
            Image(imageString)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 30)
                .animation(.easeInOut(duration: 0.15), value: imageString)
            
            Spacer()
            
            
            Button("Press Me!") {
                let messages = ["Bruno Mars",
                                "Tyler the Creator",
                                "Kendrick Lamar",
                                "Imagine Dragons",
                                "Kendrick Lamar"]
                
                _ = "image1"
                _ = "image2"
                _ = "image3"
                _ = "image4"
                _ = "image5"
                
                
                imageString = "image\(imageNumber)"
                imageNumber += 1
                
                if imageNumber > 5 {
                    imageNumber = 1
                }
                message = messages[messageNumber]
                messageNumber += 1
                
                if messageNumber == messages.count {
                    messageNumber = 0
                }
                
                var soundNumber: Int
                repeat {
                    soundNumber = Int.random(in: 1...numberOfSounds)
                } while soundNumber == lastSoundNumber
                lastSoundNumber = soundNumber
                let soundName = "sound\(soundNumber)"
                
                playSound(soundName: soundName)
            }
            
        }
        .buttonStyle(.borderedProminent)
        .font(.title2)
        .padding()
        
    }
    
    func playSound(soundName:String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("ERROR: \(error.localizedDescription) creating audioPlayer")
        }
    }
    
}

#Preview {
    ContentView()
    
}
