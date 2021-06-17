
import SwiftUI


struct BarALotView2: View {
    @State var amodel:ModelData = ModelData()
    @State var modelindex:ModelIndex = ModelIndex()
    @State var yearnumbers:YearNumbers = YearNumbers()
    
    @Binding var width:CGFloat
    
    var body: some View {
        VStack(alignment:.leading,spacing:0) {
            
            CenturyView2(width: $width)
                .offset(x: width/2, y: 0)
            
            HStack {
                GeometryReader { _ in
                    ForEach(modelindex.list) { k in
                        if amodel.list.count >= 100 {

                        if (k.indexstart-yearnumbers.start <= 99) && (k.indexstart>=yearnumbers.start) {
                            if (k.indexend-yearnumbers.start <= 99) && (k.indexend>=yearnumbers.start) {
                                if k.indexstart-yearnumbers.start <= 19 {
                                    if abs(k.indexstart-yearnumbers.start) < 80 {
                                        BarView2(dot1: amodel.list[k.indexstart-yearnumbers.start], dot2: amodel.list[k.indexend-yearnumbers.start])
                                            .offset(x: (CGFloat(k.indexstart-yearnumbers.start)+0.5)*(width-100)+50, y: 0)
                                    }
                                }else {
                                    BarView2(dot1: amodel.list[k.indexstart-yearnumbers.start], dot2: amodel.list[k.indexend-yearnumbers.start])
                                        .offset(x: (CGFloat(k.indexstart-yearnumbers.start)+0.5)*(width-100)+50, y: 0)

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




struct BarALotView2_Previews: PreviewProvider {
    @State static var width:CGFloat=100
    static var previews: some View {
        HStack {
            ScrollView(.horizontal) {
                BarALotView2(width: $width)
                    .frame(minWidth: 800, idealWidth: 800, maxWidth: 2000, minHeight: 700, idealHeight: 700, maxHeight: 700, alignment: .center)

            }
        }

    }
}





