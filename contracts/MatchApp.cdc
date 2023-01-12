

access(all) contract MatchApp {

    // Declare a public field of type String.
    //
    // All fields must be initialized in the init() function.
    access(all) var num: UInt64
    access(all) var values: {Address: UInt64}
    // The init() function is required if the contract contains any fields.
    init() {
        self.num = 0
        self.values = {}
    }

    // Public function to get the last generated number, and the number of users
    access(all) fun status(): [AnyStruct] {
        return [self.num, self.values.length]
    }

    // Public function to generate a new random id for oneself
    access(all) fun generate(acc: Address): AnyStruct {
        self.num = unsafeRandom()
        
        self.values.insert(key: acc, self.num) 
        return self.values[acc]
    }

    // Public function that returns if another user has the same random id as the user
    access(all) fun match(acc: Address): Address? {
        self.num = unsafeRandom()
        let val = self.values[acc]
        let keys = self.values.keys
        var i = 0
        while (i < keys.length){
            var other_val = self.values[keys[i]]
            if (keys[i] != acc && other_val == val){
                return keys[i]
            }
            i = i + 1
        }
         
        return nil
    }
}
 