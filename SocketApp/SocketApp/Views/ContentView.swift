//
//  ContentView.swift
//  SocketApp
//
//  Created by Thongchai Subsaidee on 6/5/2564 BE.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var socketIOVM = SocketIOViewModel()
    
    var body: some View {
        VStack {
            Text("Received message from Node.js:")
                .font(.largeTitle)
            ForEach(socketIOVM.messages, id: \.self) { msg in
                Text(msg)
                    .padding()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
