//
//  ToSwiftUI.swift
//  TestViewControllerRepresent
//
//  Created by Orange on 2021/7/21.
//

import SwiftUI

struct BackToSwiftUI: View {
    @EnvironmentObject var model:Model

    @State var count:Int = 1
    let name:[String] = ["Peter", "Mike", "Jack"]
    
    var body: some View {
        VStack {
            RepresentView()
                
            HStack {
                Button("增加"){
                    self.count += 1
                    switch count {
                    case 1:
                        model.name = name[0]
                    case 2:
                        model.name = name[1]
                    case 3:
                        model.name = name[2]
                    default:
                        break
                    }
                }
                Button("归零") {
                    self.count = 0
                }
            }
            
        }
    }
}

struct BackToSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        BackToSwiftUI()
            .environmentObject(Model())
    }
}
