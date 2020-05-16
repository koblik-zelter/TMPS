//
//  Adapter.swift
//  PatternLab2
//
//  Created by Alex Koblik-Zelter on 2/16/20.
//  Copyright © 2020 Alex Koblik-Zelter. All rights reserved.
//

import Foundation

protocol Reader {
    func readData()
}

class JsonReader: Reader {
    func readData() {
        print("read data from JSON file")
    }
}

class XMLReader {
    func readXML() {
        print("read data from XML")
    }
}


class Adapter: Reader {
    var reader: XMLReader
   
    init(reader: XMLReader) {
        self.reader = reader
    }
    
    func readData() {
        reader.readXML()
    }
}
