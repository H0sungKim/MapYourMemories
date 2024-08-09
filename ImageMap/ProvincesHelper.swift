//
//  ProvincesHelper.swift
//  GMapsTest
//
//  Created by Federico Nieto on 1/22/18.
//  Copyright © 2018 fede. All rights reserved.
//

import UIKit

class ProvincesHelper: NSObject {
    
    static func provinces() -> [Province] {
        let santaFe = Province(name: "Santa Fe",
                               id: "AR-S",
                               cities: ["Venado Tuerto", "Rosario"])
        let buenosAires = Province(name: "Buenos Aires",
                                   id: "AR-B",
                                   cities: ["Buenos Aires", "Mar del Plata"])
        let cordoba = Province(name: "Córdoba",
                               id: "AR-X",
                               cities: ["Río Cuarto", "Rio Tercero"])
        let catamarca = Province(name: "Catamarca",
                                 id: "AR-K",
                                 cities: [String]())
        let chaco = Province(name: "Chaco",
                             id: "AR-H",
                             cities: ["Chaco"])
        let chubut = Province(name: "Chubut",
                              id: "AR-U",
                              cities: ["Chubut"])
        let corrientes = Province(name: "Corrientes",
                                  id: "AR-W",
                                  cities: ["Corrientes"])
        let entreRios = Province(name: "Entre Ríos",
                                 id: "AR-E",
                                 cities: [String]())
        let formosa = Province(name: "Formosa",
                               id: "AR-P",
                               cities: [String]())
        let jujuy = Province(name: "Jujuy",
                             id: "AR-Y",
                             cities: [String]())
        let laPampa = Province(name: "La Pampa",
                               id: "AR-L",
                               cities: [String]())
        let laRioja = Province(name: "La Rioja",
                               id: "AR-F",
                               cities: [String]())
        let mendoza = Province(name: "Mendoza",
                               id: "AR-M",
                               cities: [String]())
        let misiones = Province(name: "Misiones",
                                id: "AR-N",
                                cities: [String]())
        let neuquen = Province(name: "Neuquén",
                               id: "AR-Q",
                               cities: [String]())
        let rioNegro = Province(name: "Rio Negro",
                                id: "AR-R",
                                cities: [String]())
        let salta = Province(name: "Salta",
                             id: "AR-A",
                             cities: [String]())
        let santaCruz = Province(name: "Santa Cruz",
                                 id: "AR-Z",
                                 cities: [String]())
        let santiagoDelEstero = Province(name: "Santiago Del Estero",
                                         id: "AR-G",
                                         cities: [String]())
        let sanJuan = Province(name: "San Juan",
                               id: "AR-J",
                               cities: [String]())
        let sanLuis = Province(name: "San Luis",
                               id: "AR-D",
                               cities: [String]())
        let tierraDelFuego = Province(name: "Tierra del Fuego",
                                      id: "AR-V",
                                      cities: [String]())
        let tucuman = Province(name: "Tucumán",
                               id: "AR-T",
                               cities: [String]())
        
        return [buenosAires,cordoba,catamarca,chaco,chubut,corrientes,entreRios,formosa,jujuy, laPampa,laRioja,mendoza,misiones,neuquen,rioNegro,salta,santaCruz, santiagoDelEstero,sanJuan,sanLuis,tierraDelFuego,tucuman,santaFe]
    }
    
    

}
