//
//  ProductDetailView.swift
//  notinoTest
//
//  Created by Lukáš Spurný on 03/07/2020.
//  Copyright © 2020 cz.sikisoft. All rights reserved.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var viewModel: ProductDetailVM
    
    var body: some View {
        Text(viewModel.getDetailProduct().name ?? "")
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //tudu: next version -> dynamic mock
        ProductDetailView(viewModel: ProductDetailVM(product: ProductListModel(id: "1",
                                                                               productId: 1,
                                                                               masterId: 1,
                                                                               price: nil,
                                                                               name: nil,
                                                                               brand: nil,
                                                                               annotation: nil,
                                                                               orderUnit: nil,
                                                                               attributes: nil,
                                                                               imageUrl: nil,
                                                                               stockAvailability: nil,
                                                                               reviewSummary: nil)))
    }
}
