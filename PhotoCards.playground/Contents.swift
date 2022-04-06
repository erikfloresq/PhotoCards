//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import UIKit
import PlaygroundSupport

extension Image {
    init(name: String) {
        self.init(uiImage: UIImage(named: name)!)
    }
}


struct PhotoCard: View {
    let imageName: String
    
    var body: some View {
        Image(name: imageName)
            .resizable()
            .cornerRadius(10)
            .shadow(radius: 5)
            .frame(width: 150, height: 200)
    }
}


struct PhotoCards: View {
    @State var expand: Bool = false
    
    var body: some View {
        ZStack {
            PhotoCard(imageName: "isa.jpg")
                .offset(x: expand ? -325 : -120, y: expand ? -90 : 0)
                .rotationEffect(.degrees(expand ? -30 : 0))
            PhotoCard(imageName: "yoon.jpg")
                .offset(x: expand ? -210 : -120, y: expand ? -50 : 0)
                .rotationEffect(.degrees(expand ? -20 : 0))
            PhotoCard(imageName: "seeun.jpg")
                .offset(x: -120, y: 0)
                .rotationEffect(.degrees(0))
            PhotoCard(imageName: "sieun.jpg")
                .offset(x: expand ? -20 : -120, y: expand ? 10 : 0)
                .rotationEffect(.degrees(expand ? 10 : 0))
            PhotoCard(imageName: "sumin.jpg")
                .offset(x: expand ? 95 : -120, y: expand ? 10 : 0)
                .rotationEffect(.degrees(expand ? 25 : 0))
            PhotoCard(imageName: "j.jpg")
                .offset(x: expand ? 190 : -120, y: expand ? -10 : 0)
                .rotationEffect(.degrees(expand ? 40 : 0))
        }
        .onTapGesture {
            withAnimation(.spring()) {
                expand.toggle()
            }
        }
    }
}

struct Canvas: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 800, height: 500, alignment: .center)
            PhotoCards()
        }
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.setLiveView(Canvas())
