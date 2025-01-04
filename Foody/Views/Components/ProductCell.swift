
import SwiftUI

struct ProductCell: View {
    
    @State var uiImage =  UIImage(named: "View")
    
    var product: Product
    
    var body: some View {
        VStack(spacing: 5){
            Image(uiImage: uiImage!)
                .resizable()
                .scaledToFill()
                //.aspectRatio(contentMode: .fit)
               // .frame(maxWidth: screen.width * 0.45)
                .clipped()
            
            
            /*
            HStack{
                Text(product.title)
                    .font(.custom("AvenirNext-regular", size: 12))
                Spacer()
                
                Text("\(product.price) din")
                    .font(.custom("AvenirNext-bold", size: 12))
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 7)
           */
                
        }.frame(width: screen.width * 0.45, height: screen.width * 0.45, alignment: .center)
            .background(Color("ColorMenu"))
            .cornerRadius(15)
            .shadow(radius: 5)
        
            .overlay(content: {
                HStack{
                    Text(product.title)
                        .font(.custom("AvenirNext-regular", size: 12)).foregroundStyle(Color.white).padding(3)
                    
                    Text("\(product.price) din")
                        .font(.custom("AvenirNext-bold", size: 10)).foregroundStyle(Color.white).padding(3)
                }.frame(width: screen.width * 0.44)
                    .frame(height: 40)
                    
                    .background(GlassView(removeEffects: false))
                    .cornerRadius(10)
                    .offset(y: 70)
                    .padding(.bottom,3)
                    
                
            })
        
            .onAppear {
                StorageService.shared.downLoadImageProduct(id: self.product.id) { result in
                    switch result{
                        
                    case .success(let data):
                        if let img = UIImage(data: data){
                            self.uiImage = img
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product(id: "0", title: "pelmeni", imageUrl: "nil", price: 100, descript: "nilnilnil"))
    }
}
