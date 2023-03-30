//
//  ContentView.swift
//  MoonshotTutorial
//
//  Created by Danjuma Nasiru on 17/01/2023.
//

import SwiftUI

//note that lazy stacks will take up the entire space available to them while regular stacks take up only as much space as their content require
struct CustomText : View{
    var text: String
    
    var body: some View{
        Text(text)
    }
    
    init(_ text : String){
        print("creating a new custom text")
        self.text = text
    }
}

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    var imageNames = ["apollo16", "apollo17","apollo1", "apollo7", "apollo8", "apollo10", "apollo11", "apollo12", "apollo14", "apollo15"]
    var body: some View {
        //        GeometryReader{geo in
        //            Image("apollo14").resizable().scaledToFit().frame(width: geo.size.width * 0.8).frame(width: geo.size.width, height: geo.size.height)}
        
        //        ScrollView(.vertical, showsIndicators: false, content: {
        //            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120, maximum: 120))], alignment: .leading, spacing: 5.0, pinnedViews: .sectionHeaders, content: {ForEach(0..<400, content: {CustomText("Text \($0)")}).frame(maxWidth: .infinity, maxHeight: .infinity)})
        //        })
        NavigationView{
            ScrollView(.vertical, showsIndicators: true){
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 250))], alignment: .center, spacing: 10){
                    ForEach(imageNames, id: \.self){image in
                        VStack{
                            Image(image).resizable().scaledToFit()
                            
                        }
                    }
                }.padding(.vertical, 10).background(.primary)
            }.navigationTitle("Apollo Gallery").navigationBarTitleDisplayMode(.inline)
            
        }
        
        //        NavigationView{
        //            List(0..<100){row in
        //
        //                NavigationLink{Text("detail \(row)")} label: {
        //                    Text("row \(row)").padding()
        //                }.buttonStyle(.plain)
        //            }.navigationTitle("SwiftUI")
        //        }
        
        //        Button("Decode JSON") {
        //            let input = """
        //            {
        //                "name": "Taylor Swift",
        //                "address": {
        //                    "street": "555, Taylor Swift Avenue",
        //                    "city": "Nashville"
        //                }
        //            }
        //            """
        //            let data = Data(input.utf8)
        //            let decoder = JSONDecoder()
        //            if let user = try? decoder.decode(User.self, from: data) {
        //                print(user.address.street)
        //            }
        //            // more code to come
        //        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
