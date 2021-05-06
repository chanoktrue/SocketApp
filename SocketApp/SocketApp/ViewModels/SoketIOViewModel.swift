//
//  SoketIOViewModel.swift
//  SocketApp
//
//  Created by Thongchai Subsaidee on 6/5/2564 BE.
//

import SwiftUI
import SocketIO

class SocketIOViewModel: ObservableObject {
    
    @Published var messages = [String]()
      
    var manager = SocketManager(
        socketURL: URL(string: "http://homenano.trueddns.com:24349")!,
        config: [.log(true), .compress]
    )
    
    init() {
        let socket = manager.defaultSocket
        socket.on(clientEvent: .connect) { data, ack in
            print("Connected")
            socket.emit("NodeJS Server Port", "Hi Node.JS server!")
        }
        
        socket.on("iOS Client Prot") { [weak self] data, ack  in
            if let data = data[0] as? [String: String], let rawMessage = data["msg"] {
                DispatchQueue.main.async {
                    self?.messages.append(rawMessage)
                }
            }
        }
        
        socket.connect()

    }
    
}
