//
//  Case1ViewModel.swift
//  Week3
//
//  Created by 서동운 on 9/17/23.
//

import Foundation

class Case1ViewModel {
    
    var modeSetting: [Case1]
    var shareSetting: [Case1]
    
    init() {
        modeSetting = [Case1(ModeSetting.doNotDisturb),
                       Case1(ModeSetting.sleep),
                       Case1(ModeSetting.work),
                       Case1(ModeSetting.personal)
                      ]
        shareSetting = [Case1(ShareSetting.share(true))]
    }
}
