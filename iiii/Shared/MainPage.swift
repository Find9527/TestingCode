
import SwiftUI

struct BarView:View {
    var dot:Dot
    func makerect3(x:CGFloat,y:CGFloat) -> Path {
        var path=Path()
        path.addRect(CGRect(x: x, y: y, width:100, height: 50))
        return path
    }
    var body: some View {
        makerect3(x: dot.nodepointX, y: dot.nodepointY)
    }
}
struct ReadIndex {
    var myindex:IndexOfList
    func readindex() -> Int {
        var oneint:Int
        oneint=myindex.indexint
        return oneint
    }
}
//需要解析出结构体中的数组

   

struct MainPageView: View {
    @EnvironmentObject var amodel:ModelData
    @EnvironmentObject var modelindex:ModelIndex
    @State var ispresent:Bool=false
        
    let width:CGFloat = 300
    let count:Int = 100
    
    let initial_spacing:CGFloat=10
    let anchor:Int=23
    
    private var minZoom:CGFloat=1
    private var maxZoom:CGFloat=7
    @GestureState private var magnificationLevel:CGFloat=1
    @State private var zoomLevel:CGFloat=1
    
    var body: some View {
        
        let magnify=MagnificationGesture()
            .updating($magnificationLevel, body:{(value,state,_) in
                state=value
                })
            .onEnded({ value in
                self.zoomLevel=setZoom(para: value)
                })
        
        
        VStack(spacing:0) {
            Button("按钮"){
                self.ispresent=true
            }
            .font(.largeTitle)
            .sheet(isPresented: $ispresent, content: {
                AddView(ispresent:$ispresent)
            })
            ScrollViewReader { proxy in
                HStack {
                    Button("滚动到前"){
                                    withAnimation {
                                        proxy.scrollTo(0,anchor: .bottomLeading)
                                    }
                    }
                    Button("滚动到后"){
                                    withAnimation {
                                        proxy.scrollTo(19,anchor: .bottomTrailing)
                                    }
                    }
                }
                ScrollView(.horizontal) {
                    VStack {
                        HStack {
                            GeometryReader {_ in
                                ForEach(amodel.list,id:\.self){ i in
                                    ForEach(modelindex.list) { k in
                                        BarView(dot:amodel.list[ReadIndex(myindex: k).readindex()])
                                    }
                                   
                                }
                            }

                        }
                        .frame(width:width*CGFloat(count),height:200,alignment:.leading)
                        .border(Color.yellow,width:3)

                        HStack {
                            GeometryReader { fullView in
                                ForEach(0..<20) { index in
                                    HStack{
                                        GeometryReader { innerview in
                                            Rectangle()
                                                .overlay(Text("\(index)").font(.largeTitle).foregroundColor(.white))
                                                .frame(width:80,height:40)
                                                .id(index)
                                                .position(x: 50, y: 50)
                                                .onAppear(){
                                                    amodel.list.append(Dot(id: UUID(), nodepointX: innerview.frame(in: .global).origin.x, nodepointY: 44))
                                                    print(amodel.list,amodel.list.count)
                                                }
                                        }
                                    }
                                    .frame(width: 100,height:100,alignment:.center)
                                    .position(x:CGFloat(index)*100, y: 50)
                                    .onAppear(){
                                        proxy.scrollTo(0, anchor: .bottomLeading)
                                    }
                                    
                                }
                            }
                            
                        }
                        .frame(width:width*CGFloat(count),height:100)
                        .border(Color.black)
                        
                    }
                    .frame(width:width*CGFloat(count)+200,height:400,alignment: .bottomLeading)
                    .border(Color.green,width:3)
                    
                    
                  
                    
                }
                
            }
            .gesture(magnify)
        }

//------------------body的括号---------------------------------
    }
//------------------缩放控制函数--------------------------------
    func setZoom(para:CGFloat) -> CGFloat {
        max(min(zoomLevel*para, maxZoom), minZoom)
    }
    
    func magnifyFun(multiple:Int) -> CGFloat {
        var mywidth:CGFloat
        mywidth=CGFloat(multiple)*setZoom(para:magnificationLevel)
        return mywidth
    }
    
    func keepCenter() -> CGFloat {
        var offset:CGFloat
        let Anchor:CGFloat=CGFloat(anchor)
        offset = -((magnifyFun(multiple: 3)*Anchor - Anchor*initial_spacing))
        return offset
    }
    
    func makepoint() -> [CGFloat] {
        var list:[CGFloat]=[]
        var num:CGFloat
        for item in 0..<20 {
            num=magnifyFun(multiple:100)*CGFloat(item)
            list.append(num)
        }
        return list
    }
    
    func makepointInt() -> [Int] {
        var list:[Int]=[]
        var num:Int
        for item in 0..<20 {
            num=Int(magnifyFun(multiple:100))*item
            list.append(num)
        }
        return list
    }
    
    func makerect(x1:CGFloat,x2:CGFloat,y1:CGFloat,y2:CGFloat) -> Path {
        var path=Path()
        path.addRect(CGRect(x: x1, y: y1, width: x2-x1, height: y2-y1))
        return path
    }
    func makerect2(param1:CGPoint,width:CGFloat,height:CGFloat) -> Path {
        var path=Path()
        path.addRect(CGRect(origin: param1, size: CGSize(width: width, height: height)))
        return path
    }
//-------------------------------------------------------------
}



struct MainPage_Previews:PreviewProvider {
    static var previews: some View{
        #if os(macOS)
        MainPageView()
            .environmentObject(ModelData())
            .environmentObject(ModelIndex())
            .frame(minWidth: 500, idealWidth: 540, maxWidth: 540, minHeight: 600, idealHeight: 650, maxHeight: 700, alignment: .center)
        #else
        MainPageView()
            .environmentObject(ModelData())
            .environmentObject(ModelIndex())
        #endif
    }
}

