
import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
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
        
        
        VStack(alignment:.leading,spacing:0) {
            Text("center")
            ScrollViewReader { proxy in
                ScrollView(.horizontal) {
                    VStack(alignment:.leading) {
                        GeometryReader {_ in
                            HStack {
                                makerect(x1: 0, x2: width*CGFloat(count), y1: 0, y2: 300)
                                
                            }
                            .frame(width:width*CGFloat(count),height:300,alignment:.leading)
                        }

                        HStack {
                            GeometryReader { fullView in
                                ForEach(0..<count) { index in
                                    HStack{
                                        Rectangle()
                                            .overlay(Text("\(index)").font(.largeTitle).foregroundColor(.white))
                                            .frame(width:80,height:80)
                                            .id(index)
                                            .onAppear(){
                                                proxy.scrollTo(44, anchor: .center)
                                            }
                                                
                                    }
                                    .frame(width: 150,height:200)
                                    .position(x:CGFloat(index)*width+40, y: 100)
                                }
                            }
                            
                        }
                        .frame(width:width*CGFloat(count),height:200)
                    }
                    .frame(height:500)
                    
                  
                    
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
    
    func makerect(x1:CGFloat,x2:CGFloat,y1:CGFloat,y2:CGFloat) -> Path {
        var path=Path()
        path.addRect(CGRect(x: x1, y: y1, width: x2-x1, height: y2-y1))
        return path
    }
//-------------------------------------------------------------
}



struct SwiftUIView5_Previews:PreviewProvider {
    static var previews: some View{
        #if os(macOS)
        ContentView()
            .frame(minWidth: 600, idealWidth: 650, maxWidth: 700, minHeight: 500, idealHeight: 550, maxHeight: 600)
        #else
        ContentView()
        #endif
    }
}

