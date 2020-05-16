//
//  Facade.swift
//  PatternLab2
//
//  Created by Alex Koblik-Zelter on 2/20/20.
//  Copyright © 2020 Alex Koblik-Zelter. All rights reserved.
//

import Foundation


protocol AirQualityService {
    func getAQI() -> Int
}

class Nasa: AirQualityService {
    func getAQI() -> Int {
        let aqi = self.getRequest()
        print("some logic")
        return aqi
    }
    
    private func getRequest() -> Int {
        print("some http logic")
        return 80
    }
}

class ESA: AirQualityService {
    func getAQI() -> Int {
        let esaAqi = self.getRequest()
        print("some logic")
        return esaAqi
    }
    
    private func getRequest() -> Int {
        print("some http logic")
        return 81
    }
}

class AQIFacade {
    private let nasaService: Nasa
    private let esa: ESA
    
    init() {
        self.nasaService = Nasa()
        self.esa = ESA()
    }
    
    func getAqi() -> Float {
        let nasaAqi = self.nasaService.getAQI()
        let esaAqi = self.esa.getAQI()
        print("Some logic to find the most accurate value ")
        let result = Float((nasaAqi + esaAqi) / 2)
        return result
    }
}
