
import SwiftUI


struct BarALotView: View {
    @EnvironmentObject var amodel:ModelData
    @EnvironmentObject var modelindex:ModelIndex
    @EnvironmentObject var yearnumbers:YearNumbers
    
    @Binding var width:CGFloat
    
    var body: some View {
        VStack(alignment:.leading,spacing:0) {
            
            CenturyView(width: $width)
                .offset(x: width/2, y: 0)
                
            
            HStack {
                GeometryReader { _ in
                    ForEach(modelindex.list) { k in
                        if amodel.list.count >= 100 {

                        if (k.indexstart-yearnumbers.start <= 99) && (k.indexstart>=yearnumbers.start) {
                            if (k.indexend-yearnumbers.start <= 99) && (k.indexend>=yearnumbers.start) {
                                if k.indexstart-yearnumbers.start <= 19 {
                                    if abs(k.indexstart-yearnumbers.start) < 80 {
                                        BarView(dot1: amodel.list[k.indexstart-yearnumbers.start], dot2: amodel.list[k.indexend-yearnumbers.start])
//                                            .offset(x: (CGFloat(k.indexstart-yearnumbers.start)+0.5)*(width-100)+50, y: 0)
                                            .offset(x: -500, y: 0)
                                    }
                                }else {
                                    BarView(dot1: amodel.list[k.indexstart-yearnumbers.start], dot2: amodel.list[k.indexend-yearnumbers.start])
//                                        .offset(x: (CGFloat(k.indexstart-yearnumbers.start)+0.5)*(width-100)+50, y: 0)
                                        .offset(x: -500, y: 0)
                                }

                            }
                        }

                            
                            

                        }
                    }
                }
            }
            

            
        }
        .frame(width:10*10*width, height:240)
        .border(Color.blue,width: 3)
       
//---body-----
    }
}




struct BarALotView_Previews: PreviewProvider {
    @State static var width:CGFloat=100
    static var previews: some View {
        HStack {
            ScrollView(.horizontal) {
                BarALotView(width: $width)
                    .environmentObject(ModelData())
                    .environmentObject(ModelIndex())
                    .environmentObject(YearNumbers())
                    .environmentObject(GestureClass())
                    .environmentObject(WindowWidth())
                    .environmentObject(AnchorModel())
                    .frame(minWidth: 800, idealWidth: 800, maxWidth: 2000, minHeight: 700, idealHeight: 700, maxHeight: 700, alignment: .center)

            }
        }

    }
}










//            HStack {
//                GeometryReader { _ in
//                    ForEach(modelindex.list) { k in
//                        if amodel.list.count>=100 {
//                            BarView(dot1: amodel.list[k.indexstart], dot2: amodel.list[k.indexend])
//                        }
//                    }
//                }
//
//            }
//            .frame(width:10*10*width, height:200)
//            .onChange(of: width, perform: { value in
//                print(amodel.list)
//            })















//ForEach(modelindex.list) { k in
//BarView(width:$width, dot:amodel.list[ReadIndex(myindex: k).readindex()])
//.offset(x: XXX(item: ReadIndex(myindex: k).readindex())-50, y: 0)

//BarView(dot1: initModel()[k.indexstart-yearnumbers.start], dot2: initModel()[k.indexend-yearnumbers.start])
//    .offset(x: XXX(item: abs(k.indexstart-yearnumbers.start)), y: 0)







//HStack {
//    GeometryReader { _ in
//        ForEach(initIndex()) { k in
//            if amodel.list.count>=100 {
//
//            if !(amodel.list.count == 0){
//                if (k.indexstart-yearnumbers.start <= 99) && (k.indexstart>=yearnumbers.start) {
//                    if (k.indexend-yearnumbers.start <= 99) && (k.indexend>=yearnumbers.start) {
//                        if k.indexstart-yearnumbers.start<=19 {
//                            if abs(k.indexstart-yearnumbers.start) < 80 {
//                                BarView(dot1: amodel.list[k.indexstart-yearnumbers.start], dot2: amodel.list[k.indexend-yearnumbers.start])
//                                    .offset(x: XXX(item: abs(k.indexstart-yearnumbers.start)), y: 0)
//                            }
//                        }else {
//                            BarView(dot1: amodel.list[k.indexstart-yearnumbers.start], dot2: amodel.list[k.indexend-yearnumbers.start])
//                                .offset(x: XXX(item: abs(k.indexstart-yearnumbers.start)), y: 0)
//                        }
//
//                    }
//                }
//            }
//
//
//
//            }
//        }
//    }
//}
