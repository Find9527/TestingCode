//
//  ForeachView.swift
//  MakePoint
//
//  Created by Orange on 2021/7/5.
//

import SwiftUI

struct ForeachView: View {
    @EnvironmentObject var yearnumbers:YearNumbers
    @EnvironmentObject var uikitmodel:UIKitModelData
    let solution = Solution()
    
    @State private var outerstart:Int = 10
    @State private var innerstart:Int = 10

    @State private var outerend:Int = 12
    @State private var innerend:Int = 12
    
    @State var displaynumber:Int = 0
    
    var width:CGFloat = 100
        
    
    var body: some View {
        HStack(spacing:0) {
            ForEach(outerstart ..< outerend, id: \.self) { count in
                HStack {
                    GeometryReader { geo in
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(.blue)
                            .overlay(Text(changeOuterText(item: count))
                                    .foregroundColor(.white))
                            .position(x: width/2, y: 100)
                    }
                }
                .frame(width: width)
                .border(Color.black)
                
                ForEach(innerstart ..< innerend, id: \.self) { point in
                    HStack {
                        GeometryReader { geo in
                            PointView()
                                .overlay(Text(changeInnerText(count: count, item: point)).foregroundColor(.white))
                                .position(x: width/2, y: 100)
                        }
                    }
                    .frame(width: width)
                    .border(Color.black)
                }
                
                if innerend > 20 {
                    if solution.numberOfDays(yearnumbers.yearstart, count+yearnumbers.monthstart) > 28 {
                        ForEach(innerend ..< solution.numberOfDays(yearnumbers.yearstart, count)+1, id: \.self) { point in
                            HStack {
                                GeometryReader { geo in
                                    PointView()
                                        .overlay(Text(changeInnerText(count: count, item: point)).foregroundColor(.white))
                                        .position(x: width/2, y: 100)
                                }
                            }
                            .frame(width: width)
                            .border(Color.black)
                        }
                    }
                }
            }
        }
        .frame(height:200)
        .onAppear() {
            self.changeBasicPoint()
        }
        .onChange(of: uikitmodel.count, perform:{ value in
            changeBasicPoint()
        })
        .onChange(of: yearnumbers.monthstart, perform: { value in
            changeBasicPoint()
        })
        
    }
    
//  MARK: - 改变基本点个数的函数，每次要更新视图都需执行
    private func changeBasicPoint() {
        switch uikitmodel.count {
        case 6:
            outerstart = yearnumbers.monthstart
            outerend = yearnumbers.monthstart + 4
            innerstart = 2
            innerend = 29
        case 5:
            outerstart = yearnumbers.yearstart
            outerend = yearnumbers.yearstart + 10
            innerstart = 2
            innerend = 13
        default:
            innerstart = 1
            outerstart = 1
            outerend = 10
            innerend = 10
        }
    }
    
// MARK: - 内部方法，改变基本点上的文字，每次要更新视图都需执行
    private func changeOuterText(item:Int) -> String {
        var overlaytext:String = ""
        switch uikitmodel.count {
        case 6:
            if item > 12 {
                overlaytext = "1月"
            }else {
                overlaytext = "\(item)月"
            }
        case 5:
            overlaytext = "\(item)年"
        case 4:
            overlaytext = "\(item*10)"
        case 3:
            overlaytext = "\(item*100)"
        case 2:
            overlaytext = "\(item*1000)"
        case 1:
            overlaytext = "\(item*10000)"
        default:
            overlaytext = ""
        }
        return overlaytext
    }
    
    
    private func changeInnerText(count:Int, item:Int) -> String {
        var overlaytext:String = ""
        switch uikitmodel.count {
        case 6:
            overlaytext = "\(item)日"
        case 5:
            overlaytext = "\(item)月"
        case 4:
            overlaytext = "\(item + count*10)"
        case 3:
            overlaytext = "\(item*10 + count*100 )"
        case 2:
            overlaytext = "\(item*100 + count*1000 )"
        case 1:
            overlaytext = "\(item*1000 + count*10000 )"
        default:
            overlaytext = ""
        }
        return overlaytext
    }
    
}







// MARK: - 基本点视图
struct PointView: View {
    @State var item:Int = 0
    @State var text:String = "测试"
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .frame(width: 60, height: 25, alignment: .center)
    }
    
}

// MARK: - 计算一个月有几天的类
//class Solution {
//    func numberOfDays(_ Y: Int, _ M: Int) -> Int {
//        if Y % 400 == 0 || (Y % 100 != 0 && Y % 4 == 0)
//        {
//            if M == 2 {return 29}
//        }
//        let mon:[Int] = [31,28,31,30,31,30,31,31,30,31,30,31]
//        return mon[M - 1]
//    }
//}

class Solution {
    func numberOfDays(_ Y: Int, _ M: Int) -> Int {
        var month:Int = 0
        if M > 12 {
            month = 1
        } else {
            month = M
        }
        if Y % 400 == 0 || (Y % 100 != 0 && Y % 4 == 0)
        {
            if month == 2 {return 29}
        }
        let mon:[Int] = [31,28,31,30,31,30,31,31,30,31,30,31]
        return mon[month - 1]
    }
}






struct ForeachView_Previews: PreviewProvider {
    static var previews: some View {
        ForeachView()
            .frame(width: 600, height: 600, alignment: .center)
            .environmentObject(YearNumbers())
            .environmentObject(UIKitModelData())
        
    }
}
