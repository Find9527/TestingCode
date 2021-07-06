//
//  StartView.swift
//  CombineToUIKit
//
//  Created by Orange on 2021/7/4.
//

import SwiftUI


struct AddPageView: View {
    
    @State var startyear:String = ""
    @State var startmonth:String = ""
    @State var startday:String = ""
    
    @State var endyear:String = ""
    @State var endmonth:String = ""
    @State var endday:String = ""
    
    @State var displaytext:String = ""
        
    var body: some View {
        
        VStack {
            
            HStack {
                VStack() {
                    HStack {
                        TextField("请输入年", text: $startyear)
                    }
                    HStack {
                        TextField("请输入月", text: $startmonth)
                        Picker("月", selection: $startmonth, content: {
                            ForEach(1..<13, id: \.self){ item in
                                Text("\(item)")
                            }
                        })
                        .frame(width:80, height: 120)
                        .clipped()
                    }
                    HStack {
                        TextField("请输入日", text: $startday)
                        Picker("日", selection: $startday, content: {
                            ForEach(1..<32, id: \.self){ item in
                                Text("\(item)")
                            }
                        })
                        .frame(width:80, height: 120)
                        .clipped()
                    }
                }
                .frame(width: 300)
                .padding(.horizontal, 20)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Rectangle()
                    .frame(width: 2, height: 240, alignment: .center)
                
    //MARK: -
                
                VStack() {
                    HStack {
                        TextField("请输入年", text: $endyear)
                    }
                    HStack {
                        TextField("请输入月", text: $endmonth)
                        Picker("月", selection: $endmonth, content: {
                            ForEach(1..<13, id: \.self){ item in
                                Text("\(item)")
                            }
                        })
                        .frame(width:80, height: 120)
                        .clipped()
                    }
                    HStack {
                        TextField("请输入日", text: $endday)
                        Picker("日", selection: $endday, content: {
                            ForEach(1..<32, id: \.self){ item in
                                Text("\(item)")
                            }
                        })
                        .frame(width:80, height: 120)
                        .clipped()
                    }
                }
                .frame(width: 300)
                .padding(.horizontal, 20)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }//---上Hstack----
            TextField("请输入文本", text: $displaytext)
                .frame(minWidth: 200, idealWidth: 500, maxWidth: 600, minHeight: 200, idealHeight: 300, maxHeight: 300, alignment: .center)
                .padding(.horizontal, 20)
                .border(Color.blue)
        }//---外层Vstack--
        .padding(.top, 40)
    }
}

struct AddPageView_Previews: PreviewProvider {
    static var previews: some View {
        AddPageView()
    }
}
