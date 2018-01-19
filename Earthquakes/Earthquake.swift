//
//  Earthquake.swift
//  Earthquakes
//
//  Created by Koulutus on 08/11/2017.
//  Copyright © 2017 Koulutus. All rights reserved.
//

import UIKit
import MapKit

enum BackendError: Error {
    case urlError(reason: String)
    case objectSerialization(reason: String)
}

// http://benscheirman.com/2017/06/ultimate-guide-to-json-parsing-with-swift-4/
// https://tools.ietf.org/html/rfc7946
// https://earthquake.usgs.gov/earthquakes/feed/v1.0/geojson.php
// http://geojson.org/geojson-spec.html



//structs


struct Metadata : Codable {
    var generated: Int = 0
    var url: String = ""
    var title: String = ""
    var api: String = ""
    var count: Int = 0
    var status: Int = 0
    enum CodingKeys: String, CodingKey {
        case generated
        case url
        case title
        case api
        case count
        case status
    }
    
    init() {}
    
    init(generated: Int, url: String, title: String, api: String, count: Int, status: Int) {
        self.generated = generated
        self.url = url
        self.title = title
        self.api = api
        self.count = count
        self.status = status
    }
    
    init(dictionary: [String: Any] ) {
        self.generated = dictionary["generated"] as? Int ?? 0
        self.url = dictionary["url"] as? String ?? ""
        self.title = dictionary["title"] as? String ?? ""
        self.api = dictionary["api"] as? String ?? ""
        self.count = dictionary["count"] as? Int ?? 0
        self.status = dictionary["status"] as? Int ?? 0
    }
}

/*
 struct Bboxes: Codable {
 let minimum_longitude: Decimal
 let minimum_latitude: Decimal
 let minimum_depth: Decimal
 let maximum_longitude: Decimal
 let maximum_latitude: Decimal
 let maximum_depth: Decimal
 }
 
 struct Bbox : Codable {
 let bboxes: [Bboxes]
 }
 */

struct Properties : Codable {
    var mag: Decimal = 0.0
    var place: String = ""
    var time: Int = 0
    var updated: Int = 0
    var tz: Int = 0
    var url: String = ""
    var detail: String = ""
    var felt:Int?
    var cdi: Decimal?
    var mmi: Decimal?
    var alert: String?
    var status: String?
    var tsunami: Int?
    var sig: Int = 0
    var net: String = ""
    var code: String = ""
    var ids: String = ""
    var sources: String = ""
    var types: String = ""
    var nst: Int?
    var dmin: Decimal = 0.0
    var rms: Decimal = 0.0
    var gap: Decimal = 0.0
    var magType: String = ""
    var type: String = ""
    enum CodingKeys: String, CodingKey {
        case mag
        case place
        case time
        case updated
        case tz
        case url
        case detail
        case felt
        case cdi
        case mmi
        case alert
        case status
        case tsunami
        case sig
        case net
        case code
        case ids
        case sources
        case types
        case nst
        case dmin
        case rms
        case gap
        case magType
        case type
    }
    
    //var intValue: Int? { return nil }
    
    //init?(intValue: Int) { return nil }
    
    init() {}
    
    init(mag: Decimal, place: String, time: Int, updated: Int, tz: Int, url: String, detail: String, felt: Int, cdi: Decimal, mmi: Decimal, alert: String, status: String, tsunami: Int, sig: Int, net: String, code: String, ids: String, sources: String, types: String, nst: Int, dmin: Decimal, rms: Decimal, gap: Decimal, magType: String, type: String) {
        
        self.mag = mag
        self.place = place
        self.time = time
        self.updated = updated
        self.tz = tz
        self.url = url
        self.detail = detail
        self.felt = felt
        self.cdi = cdi
        self.mmi = mmi
        self.alert = alert
        self.status = status
        self.tsunami = tsunami
        self.sig = sig
        self.net = net
        self.code = code
        self.ids = ids
        self.sources = sources
        self.types = types
        self.nst = nst
        self.dmin = dmin
        self.rms = rms
        self.gap = gap
        self.magType = magType
        self.type = type
    }
    
    init(dictionary: [String: Any] ) {
        self.mag = dictionary["mag"] as? Decimal ?? 0.0
        self.place = dictionary["place"] as? String ?? ""
        self.time = dictionary["time"] as? Int ?? 0
        self.updated = dictionary["updated"] as? Int ?? 0
        self.tz = dictionary["tz"] as? Int ?? 0
        self.url = dictionary["url"] as? String ?? ""
        self.detail = dictionary["detail"] as? String ?? ""
        self.felt = dictionary["felt"] as? Int ?? 0
        self.cdi = dictionary["cdi"] as? Decimal ?? 0.0
        self.mmi = dictionary["mmi"] as? Decimal ?? 0.0
        self.alert = dictionary["alert"] as? String ?? ""
        self.status = dictionary["status"] as? String ?? ""
        self.tsunami = dictionary["tsunami"] as? Int ?? 0
        self.sig = dictionary["sig"] as? Int ?? 0
        self.net = dictionary["net"] as? String ?? ""
        self.code = dictionary["code"] as? String ?? ""
        self.ids = dictionary["ids"] as? String ?? ""
        self.sources = dictionary["sources"] as? String ?? ""
        self.types = dictionary["types"] as? String ?? ""
        self.nst = dictionary["nst"] as? Int ?? 0
        self.dmin = dictionary["dmin"] as? Decimal ?? 0.0
        self.rms = dictionary["rms"] as? Decimal ?? 0.0
        self.gap = dictionary["gap"] as? Decimal ?? 0.0
        self.magType = dictionary["magType"] as? String ?? ""
        self.type = dictionary["type"] as? String ?? ""
    }
}

/*
 struct Coordinate : Codable {
 var longitude: Decimal = 0.0
 var latitude: Decimal = 0.0
 var depth: Decimal = 0.0
 enum CodingKeys: String, CodingKey {
 case longitude
 case latitude
 case depth
 }
 
 init() {}
 
 init(longitude: Decimal, latitude: Decimal, depth: Decimal) {
 self.longitude = longitude
 self.latitude = latitude
 self.depth = depth
 }
 
 init(dictionary: [String: [Decimal]] ) {
 self.longitude = dictionary["longitude"]![0]
 self.latitude = dictionary["latitude"]![1]
 self.depth = dictionary["depth"]![2]
 }
 }
 */

struct Geometry : Codable {
    var type: String = ""  //"Point"
    var coordinates: [Decimal]? // = [Coordinate]()
    
    enum CodingKeys: String, CodingKey {
        case type
        case coordinates
    }
    
    init() {}
    
    init(type: String, coordinates: [Decimal]) {
        self.type = type
        self.coordinates = coordinates
    }
    
    init(dictionary: [String: Any] ) {
        self.type = dictionary["type"] as? String ?? ""
        self.coordinates = dictionary["coordinates"] as? [Decimal] ?? []
    }
}

struct Feature : Codable {
    var type: String = "" // "Feature"
    var properties: Properties = Properties()
    var geometry: Geometry = Geometry()
    var id: String = ""
    enum CodingKeys: String, CodingKey {
        case type
        case properties
        case geometry
        case id
    }
    
    init() {}
    
    init(type: String, properties: Properties, geometry: Geometry, id: String) {
        self.type = type
        self.properties = properties
        self.geometry = geometry
        self.id = id
    }
    
    init(dictionary: [String: Any] ) {
        self.type = dictionary["type"] as? String ?? ""
        self.properties = Properties(dictionary: dictionary["properties"] as? [String: Any] ?? [:])
        self.geometry = Geometry(dictionary: dictionary["geometry"] as? [String: Any] ?? [:])
        self.id = dictionary["id"] as? String ?? ""
    }
}

/*
 struct Feature : Codable {
 var featureItem : [FeatureItem]
 
 init(dictionary: [String: Any] ) {
 self.featureItem = [FeatureItem(dictionary: dictionary["featureItem"] as? [String: Any] ?? [:])]
 }
 }
 */


struct Earthquake : Codable {
    
    //static var endPoint: String?
    
    var type: String = "" // "FeatureCollection"
    var metadata: Metadata!// = Metadata()
    var bbox: [Decimal]? // = [Decimal]()
    var features: [Feature] = [Feature]()
    
    private enum CodingKeys : String, CodingKey {
        case type
        case metadata
        case bbox
        case features
    }
    
    init() {}
    
    init(type: String, metadata: Metadata, bbox: [Decimal], features: [Feature]/* = []*/) {
        self.type = type
        self.metadata = metadata
        //self.bbox = bbox
        self.features = features
    }
    
    init(dictionary: [String: Any]) {
        self.type = dictionary["type"] as? String ?? ""
        self.metadata = Metadata(dictionary: dictionary["metadata"] as? [String: Any] ?? [:])
        //self.bbox = dictionary["bbox"] as? [Decimal] ?? []
        self.features = [Feature(dictionary: dictionary["features"] as? [String: Any] ?? [:])]
    }
 
    
    // Properties
    //var date : Date?
    //var locationName: String?
    //var location = CLLocation(latitude: 21.282778, longitude: -157.829444)
    //var magnitude : Double? = 0.0
    
    //var number: String?

    
    static func endpointForEarthQuakes(starttime: String, endtime: String) -> String {
        
        return "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=" + starttime + "&endtime=" + endtime
    }
    
    /*init(type: String, metadata: Metadata, /*bbox: Bbox,*/ feature: Feature) {
        
    }*/
    
    //init(from service: Earthquage) {}
    
    init(from decoder: Decoder) throws {
        //var features = [Feature]()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(String.self, forKey: .type)
        
        metadata = try container.decode(Metadata.self, forKey: .metadata)
        
        //bbox = try container.decode([Decimal].self, forKey: .bbox)
        
        features = try container.decode([Feature].self, forKey: .features)
        //let feature1 = try container.decode(Feature.self, forKey: .features)
        
        for feature in features {
            print("\t\(feature.type) (\(feature.id) ids)")
        }
        
        var featureArray = try container.nestedUnkeyedContainer(forKey: .features)
        var f_Sizes: [Feature] = []
        while (!featureArray.isAtEnd) {
            let size = try featureArray.decode(Feature.self)
            f_Sizes.append(size)
        }
        
        //var propertiesArray: [Property] = []
        //for feature in features {
            
            //let size = try featureArray.decode(Float.self)
            //propertiesArray.append(size.rounded())
        //}
        
        //let propertiesArray = featureArray(properties: properties)
        
        //let brewery = Brewery(name: breweryName)
    }
    
    func encode(to encoder: Encoder) throws {
        //var container = encoder.container(keyedBy: CodingKeys.self)
        
        //try container.encode(type, forKey: .brewery)
        
    }
  
    static func allEarthQuakes(StartTime: String, EndTime : String, completionHandler: @escaping (Earthquage?, Error?) -> Void) {
        
        let endpoint = Earthquage.endpointForEarthQuakes(starttime: StartTime, endtime: EndTime)
        guard let url = URL(string: endpoint) else {
            print("Error: cannot create URL")
            let error = BackendError.urlError(reason: "Could not construct URL")
            completionHandler(nil, error)
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) /*, completionHandler:*/ {
            (data, response, error) in
            
            guard let responseData = data else {
                print("Error: did not receive data")
                completionHandler(nil, error)
                return
            }
            guard error == nil else {
                completionHandler(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let earthquage = try decoder.decode(Earthquage.self, from: responseData)
                completionHandler(earthquage, nil)
                
            } catch {
                print("error trying to convert data to JSON")
                print(error)
                completionHandler(nil, error)
            }
            
        } //)
        task.resume()
    }

    /*
    func getFeatures(StartTime: String, EndTime : String /*_ idNumber: Int*/) {
        Earthquage.features(StartTime: StartTime, EndTime: EndTime, completionHandler: { ([Earthquage.Feature], error) in
            if let error = error {
                // got an error in getting the data, need to handle it
                print("error calling POST on /todos")
                print(error)
                return
            }
            guard let user = user else {
                print("error getting user: result is nil")
                return
            }
            // success :)
            debugPrint(user)
            print(user.name)
            print(user.address.city)
            }
    }
 */
    /*
    static func features(StartTime: String, EndTime : String, completionHandler: @escaping ([Feature]?, Error?) -> Void) {
        //let endpoint = User.endpointForID(id)
        let endpoint = Earthquage.endpointForEarthQuakes(starttime: StartTime, endtime: EndTime)
        guard let url = URL(string: endpoint) else {
            print("Error: cannot create URL")
            let error = BackendError.urlError(reason: "Could not create URL")
            completionHandler(nil, error)
            return
        }
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest, completionHandler: {
            (data, response, error) in
            guard let responseData = data else {
                print("Error: did not receive data")
                completionHandler(nil, error)
                return
            }
            guard error == nil else {
                completionHandler(nil, error!)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let Features = try decoder.decode([Feature].self, from: responseData)
                completionHandler(Features, nil)
            } catch {
                print("error trying to convert data to JSON")
                print(error)
                completionHandler(nil, error)
            }
        })
        task.resume()
    }
 */
}
