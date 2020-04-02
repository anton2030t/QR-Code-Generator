//
//  ContentView.swift
//  QR Code Generator
//
//  Created by Антон Ларченко on 02.04.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var txt = ""
    
    var body: some View {
        
        VStack {
            
            TextField("Enter Data", text: $txt).textFieldStyle(RoundedBorderTextFieldStyle())
            
            if txt != "" {
                Image(uiImage: UIImage(data: returnData(str: self.txt))!).resizable().frame(width: 150, height: 150)
            }
        }.padding()
    }
    
    func returnData(str: String) -> Data {
        
        let filter = CIFilter(name: "CIQRCodeGenerator")
        let data = str.data(using: .ascii, allowLossyConversion: false)
        filter?.setValue(data, forKey: "inputMessage")
        let image = filter?.outputImage
        let uiimage = UIImage(ciImage: image!)
        return uiimage.pngData()!
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
