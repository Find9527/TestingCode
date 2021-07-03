

import SwiftUI


struct AddView: View {
    @EnvironmentObject var yearnumbers:YearNumbers
    @EnvironmentObject var modelindex:ModelIndex

    
    @Binding var ispresent:Bool
    
    @State var selectStart:Int=0
    @State var selectEnd:Int=0
    let range:CountableRange=0..<400
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    
    var body: some View {
        VStack {
            List {
                Section {
                    Text("起始时间"+"\(selectStart)")
                    TextField("输入", value:$selectStart,formatter:formatter)
                    Picker("xuanz", selection: $selectStart) {
                        ForEach(range, id: \.self){ item in
                            Text("\(item)")
                        }
                    }
                    .frame(height:200)
                        
                }
                Section {
                    Text("起始时间"+"\(selectEnd)")
                    TextField("输入", value:$selectEnd,formatter:formatter)
                    Picker("xuanz", selection: $selectEnd) {
                        ForEach(range, id: \.self){ item in
                            Text("\(item)")
                        }
                    }
                    .frame(height:200)
                        
                }
                
            }
            .frame(width: 400, height: 700, alignment: .center)
            
            HStack {
                Button("添加"){
                    mathofindex(parastart: selectStart, paraend: selectEnd)
                    self.ispresent=false
                }
                Button("取消"){
                    self.ispresent=false
                }
            }
        }
    }
    
    
    func mathofindex(parastart:Int, paraend:Int) -> Void {
        var dis:Int=0
        let thisyear = yearnumbers.start
        dis = abs(parastart-thisyear)
        if dis <= 99 {
            if abs(paraend-thisyear) <= 99{
                modelindex.addIndex(start: parastart, end: paraend)
            }else{
                modelindex.addIndex(start: parastart, end: thisyear+99)
                modelindex.addIndex(start: thisyear+99, end: paraend)
            }
        }
        else {
            var year:Int
            year = (parastart-parastart%80)/80
            yearnumbers.start = thisyear + year*80
            dis = abs(parastart-yearnumbers.start)
            if dis <= 99 {
                if abs(paraend-yearnumbers.start) <= 99{
                    modelindex.addIndex(start: parastart, end: paraend)
                }else{
                    modelindex.addIndex(start: parastart, end: yearnumbers.start+99)
                    modelindex.addIndex(start: yearnumbers.start+99, end: paraend)
                }
            }
        }
    }
    
}

struct AddView_Previews: PreviewProvider {
    @State static var ispresent:Bool=false
    static var previews: some View {
        AddView(ispresent: self.$ispresent)
            .environmentObject(ModelIndex())
            .environmentObject(YearNumbers())
    }
}
