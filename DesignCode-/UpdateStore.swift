//
//  UpdateStore.swift
//  DesignCode-
//
//  Created by Samwel Charles on 06/04/2020.
//  Copyright © 2020 Samwel Charles. All rights reserved.
//

import SwiftUI
import Combine


final class UpdateStore : ObservableObject{
    @Published var updates : [Update] = updateData
}
