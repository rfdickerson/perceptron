import Foundation


let threshold: Float = 0.5
let learningRate: Float = 0.1



typealias TrainingSet = [([Float],Float)]

let trainingSet: [([Float],Float)] = [([1,0,0],1),([1,0,1],1),([1,1,0],1),([1,1,1],0)]
//let trainingSet: TrainingSet = [([1,1,1],1),([1,0,0],0),([1,1,1],1),([0,0,1],1)]

func dotProduct(values: [Float], _ weights: [Float]) -> Float {

    return  zip(values, weights).map() { a, b in a*b }.reduce(0, combine: +)

}

func train( trainingSet: TrainingSet, _ threshold: Float = 0.5, _ learningRate: Float) -> [Float] {

    var weights: [Float] = [0,0,0]
    
    while true {
        
        var errorCount: Int = 0
        for (inputVector, desiredOutput) in trainingSet {
            
            print(weights)
            
            let result = dotProduct(inputVector, weights) > threshold ? Float(1) : Float(0)
            let error = desiredOutput - result
            
            if error != 0 {
                errorCount += 1
                for (index, value) in inputVector.enumerate() {
                    weights[index] += learningRate * error * value
                }
            }
            
        }
        
        if errorCount == 0 {
            break
        }
    }

    return weights

}


train( trainingSet, threshold, learningRate )