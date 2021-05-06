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
            Text("Msg:")
                .font(.largeTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding()
            List {
                ForEach(socketIOVM.messages, id: \.self) { msg in
                    Text(msg)
                        .padding()
                }
            }
            
            Spacer()
            
            HStack {
                TextField("Send msg:", text: $socketIOVM.msg)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding()
                
                Button("Send"){
                    socketIOVM.sendMsg()
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
