//
//  ProductListView.swift
//  notinoTest
//
//  Created by Lukáš Spurný on 03/07/2020.
//  Copyright © 2020 cz.sikisoft. All rights reserved.
//

import SwiftUI

struct ProductListView: View {
    
    @ObservedObject var viewModel: ProductListVM
    @State private var rect: CGRect = CGRect()
    
    var body: some View {
        NavigationView {
            list(viewModel.getListProducts())
                .navigationBarTitle("Notino", displayMode: .inline)
                .background(Color.white)
        }.background(Color.white)
    }
    
    private func list(_ products: [[ProductListModel]]) -> some View {
        return List {
            ForEach(0..<products.count, id: \.self) { array in
                HStack {
                    ForEach(products[array], id: \.self) { product in
                        ProductListCollectionCell(viewModel: ProductListCollectionVM(product: product))
                    }
                }
            }
        }.onAppear(perform: {
            UITableView.appearance().separatorStyle = .none
        }).background(Color.white)
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(viewModel: .init())
    }
}
