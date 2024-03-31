// function createCounter(n: number): () => number {
    
//     return function() {
        
//     }
// }
let createCounter = (n)=>{
    return () => n++;
};

/** 
 * const counter = createCounter(10)
 * counter() // 10
 * counter() // 11
 * counter() // 12
 */