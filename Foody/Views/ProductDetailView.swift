
import SwiftUI

struct ProductDetailView: View {
    
    @State var viewModel: ProductDetailViewModel
    
    // @State private var size = "Маленький"
    
    @State private var  count = 1
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack{
            Image(.details)
            VStack(alignment: .leading){
                
                ScrollView{
                    Image(uiImage: self.viewModel.image)
                        .resizable()
                        .frame(maxWidth: screen.width, maxHeight: 260)
                        .onAppear{
                            self.viewModel.getImage()
                        }
                }
                
                
                VStack(alignment: .leading, spacing: 30){
                    
                    
                    HStack {
                        Text(viewModel.product.title).foregroundStyle(Color.foodyRed)
                            .font(.title2.bold())
                        
                        Spacer()
                        
                        
                        Text("\(viewModel.getPrice(count: self.count)) din")
                            .font(.title2).foregroundStyle(Color.foodyRed)
                    }
                    
                    .padding(.horizontal)
                    
                    Text("\(viewModel.product.descript)")
                        .foregroundStyle(Color.foodyRed)
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                    
                    HStack {
                        Stepper("", value: $count, in: 1...10)
                        Text("\(self.count)").foregroundStyle(Color.foodyRed)
                            .padding(.leading, 50)
                        
                        
                    }.padding(.horizontal)
                    
                    HStack{
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            HStack(spacing: 5){
                                Image("BackButton")
                                Text("Back to\n catalog").foregroundStyle(Color("darkRed")).font(.system(size: 10))
                            }
                        }
                        .padding()
                        
                        Spacer()
                        
                        Button {
                            print("add")
                            let position = Position(id: UUID().uuidString, product: viewModel.product, count: self.count)
                            //Вычисление ценника для добавленного в корзину
                            viewModel.product.price = viewModel.getPrice(count: self.count)
                            CartViewModel.shared.addPositions(position)
                            presentationMode.wrappedValue.dismiss()
                            
                        } label: {
                            HStack{
                                Image(.addCart)
                                Text("Add to\n cart").foregroundStyle(Color("darkRed")).font(.system(size: 8))
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationBarBackButtonHidden()
            
            .frame(width: screen.width, height: screen.height * 0.65 )
            .background(Color.white).ignoresSafeArea()
            //Spacer()
        }
        .onAppear {
            self.viewModel.getImage()
            print("getImage")
        }
        
        .frame(width: screen.width, height: screen.height).ignoresSafeArea()
        .background(Color.foodyRed).ignoresSafeArea()
        
    }
    
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: "0", title: "pelmeni", imageUrl: "nil", price: 100, descript: "Самые лучшие среди пельменей")))
        
    }
}

