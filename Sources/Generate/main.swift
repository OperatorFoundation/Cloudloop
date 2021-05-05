//
//  Generate - main.swift
//  
//
//  Created by Dr. Brandon Wiley on 5/3/21.
//

import Foundation
import CloudloopTemplate
import Gardener

let cloudloop = CloudloopAPI()

let success = generate(cloudloop.api, target: "Cloudloop", resourcePath: "Sources/CloudloopTemplate/Resources")
if !success
{
    print("Failure.")
}
