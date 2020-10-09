//
//  ContentView.swift
//  Messaging
//
//  Created by Mackenzie Bryant on 10/9/20.
//

import SwiftUI

struct ContentView: View {
    @State var NumberToMessage = ""
    @State var Message = ""
    
    
    var body: some View {
        VStack {
            TextField("Enter a Mobile Number", text: $NumberToMessage)
            // $ = binding to whatever state - what number do we want to message?
            TextField("Write a Message", text: $Message)
            Button(action: {
                sendMessage()
            }, label: {
                Text("Send Message").font(.title).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            })
        }
            .padding()
    }
    func sendMessage(){
        let sms: String = "sms:\(NumberToMessage)&body=\(Message)"
        let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
