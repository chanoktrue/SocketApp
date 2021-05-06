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
    @Published var msg: String = ""
      
    var manager = SocketManager(
        socketURL: URL(string: "ws://homenano.trueddns.com:24349")!,
        config: [.log(true), .compress]
    )
    
    init() {
        
        let socket = manager.defaultSocket
        
        socket.on(clientEvent: .connect) { data, ack in
            print("Connected")
            socket.emit("msg", "Hi Node.JS server!")
            
            socket.on("msg") { [weak self] data, ack in
                if let data = data[0] as? [String: String], let rawMessage = data["msg"] {
                    DispatchQueue.main.async {
                        self?.messages.append(rawMessage)
                    }
                }
            }
        }
        socket.connect()
    }
    
    func sendMsg() {
        let socket = manager.defaultSocket
        
        socket.emit("msg", msg)
    }
    
}
