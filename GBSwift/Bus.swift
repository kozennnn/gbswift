//
//  Bus.swift
//  GBSwift
//
//  Created by Mathis HOUIS on 12/12/2022.
//

import Foundation

struct Bus {
    
    /*
    0x0000 - 0x3FFF : ROM Bank 0
    0x4000 - 0x7FFF : ROM Bank 1 - Switchable
    0x8000 - 0x97FF : CHR RAM
    0x9800 - 0x9BFF : BG Map 1
    0x9C00 - 0x9FFF : BG Map 2
    0xA000 - 0xBFFF : Cartridge RAM
    0xC000 - 0xCFFF : RAM Bank 0
    0xD000 - 0xDFFF : RAM Bank 1-7 - switchable - Color only
    0xE000 - 0xFDFF : Reserved - Echo RAM
    0xFE00 - 0xFE9F : Object Attribute Memory
    0xFEA0 - 0xFEFF : Reserved - Unusable
    0xFF00 - 0xFF7F : I/O Registers
    0xFF80 - 0xFFFE : Zero Page
    */
    
    func read(address: UInt16) -> UInt8 {
        
        if address < 0x8000 {
            // ROM Data
            return UInt8(0xFF)
        } else if address < 0xA000 {
            // Char/Map Data
            return UInt8(0xFF)
        } else if address < 0xC000 {
            // Cartridge RAM
            return UInt8(0xFF)
        } else if address < 0xE000 {
            // WRAM (Working RAM)
            return UInt8(0xFF)
        } else if address < 0xFE00 {
            // Reserved echo ram...
            return UInt8(0xFF)
        } else if address < 0xFEA0 {
            // OAM
            return UInt8(0xFF)
        } else if address < 0xFF00 {
            // Reserved unusable...
            return UInt8(0xFF)
        } else if address < 0xFF80 {
            // IO Registers...
            return UInt8(0xFF)
        } else if address == 0xFFFF {
            // CPU ENABLE REGISTER...
            return UInt8(0xFF)
        }

        //NO_IMPL
        return UInt8(0xFF)
    }
    
    func write(address: UInt16, value: UInt8) -> Void {
        
        if address < 0x8000 {
            // ROM Data
        } else if address < 0xA000 {
            // Char/Map Data
        } else if address < 0xC000 {
            // Cartridge RAM
        } else if address < 0xE000 {
            // WRAM (Working RAM)
        } else if address < 0xFE00 {
            // Reserved echo ram...
        } else if address < 0xFEA0 {
            // OAM
        } else if address < 0xFF00 {
            // Reserved unusable...
        } else if address < 0xFF80 {
            // IO Registers...
        } else if address == 0xFFFF {
            // CPU ENABLE REGISTER...
        }

        //NO_IMPL
    }
    
    func read_16(address: UInt16) -> UInt16 {
        
        var lo: UInt16 = UInt16(self.read(address: address)) // Write the lower byte
        var hi: UInt16 = lo + UInt16(self.read(address: address + 1)) << 8 // Write the higher byte

        return hi
        
    }
    
    func write_16(address: UInt16, value: UInt16) -> Void {
        
        self.write(address: address, value: UInt8(value & 0xFF)) // Write the lower byte
        self.write(address: address + 1, value: UInt8((value >> 8) & 0xFF)) // Write the higher byte
        
    }
    
    
}
