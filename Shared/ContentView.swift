//
//  ContentView.swift
//  Shared
//
//  Created by Zach Cervi on 5/27/22.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self.resizable().scaledToFit()
    }
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.gray)
            .opacity(0.5)
    }
}


struct ContentView: View {
    private let imageURL: String = "https://media.gettyimages.com/photos/labrador-retriever-dog-smiles-on-bench-outdoors-picture-id530330473?s=2048x2048"
    var body: some View {
     // AsyncImage(url: URL(string: imageURL))
//        AsyncImage(url: URL(string: imageURL), scale:  1.0)
        
//        AsyncImage(url: URL(string: imageURL)) {image in
//            image.imageModifier()
//
//
//        } placeholder: {
//            Image(systemName: "photo.circle.fill")
//                .iconModifier()
//        }.padding(40)
//        AsyncImage(url: URL(string: imageURL)){
//            phase in
//            //SUCCESS
//            //FAILURE
//            //EMPTY
//            if let image = phase.image {
//                image.imageModifier()
//            } else if phase.error != nil {
//                Image(systemName: "ant.circle.fill").iconModifier()
//            } else {
//                Image(systemName: "photo.circle.fill").iconModifier()
//            }
//
//        }
//        .padding(40)
        Text("Who is a good boy?")
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.25, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image.imageModifier()
                   // .transition(.move(edge: .bottom))
                   // .transition(.slide)
                .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
