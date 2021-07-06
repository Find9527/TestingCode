//
//  ContentView.swift
//  Shared
//
//  Created by Orange on 2021/7/4.
//

import SwiftUI

struct ContentView: View {
    @StateObject var yearnumbers = YearNumbers()
    @StateObject var uikitmodel = UIKitModelData()
    
    var body: some View {
        VStack {
            HStack {
                Button("改变视图 +") {
                    uikitmodel.count += 1
                    print(uikitmodel.count)
                }
                Button("改变视图 -") {
                    uikitmodel.count -= 1
                    print(uikitmodel.count)
                }
                Button("减") {
                    yearnumbers.monthstart -= 3
                    if yearnumbers.monthstart < 1 {
                        yearnumbers.monthstart = 10
                        yearnumbers.yearstart -= 1
                    }
                    print(yearnumbers.yearstart,"年",yearnumbers.monthstart,"月")
                }
                Button("加") {
                    yearnumbers.monthstart += 3
                    if yearnumbers.monthstart > 10 {
                        yearnumbers.monthstart = 1
                        yearnumbers.yearstart += 1
                    }
                    print(yearnumbers.yearstart,"年",yearnumbers.monthstart,"月")
                }
            }
            
            
            ScrollView(.horizontal) {
                ForeachView()
                    .environmentObject(yearnumbers)
                    .environmentObject(uikitmodel)
            }
            
            
        }
        .frame(width: 600, height: 600)
        
    }
    
//    func addstart() {
//        switch uikitmodel.count {
//        case 6:
//            <#code#>
//        default:
//            <#code#>
//        }
//    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
