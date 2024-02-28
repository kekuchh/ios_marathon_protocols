import Foundation


func address(off value: AnyObject) -> String {
    return "\(Unmanaged.passUnretained(value).toOpaque())"
}


class CollectionStorage<T> {
    var items: [T]

    init(items: [T]) {
        self.items = items
    }
    
    func append(_ item: T) {
        items.append(item)
    }
    
    func get(at index: Int) -> T {
        return items[index]
    }
    
    func set(at index: Int, to item: T) {
        items[index] = item
    }
    
    func count() -> Int {
        return items.count
    }
    
    func copy() -> CollectionStorage<T> {
        return CollectionStorage<T>(items: self.items)
    }
}

struct Collection<T> {
    var storage: CollectionStorage<T>
    
    init(storage: CollectionStorage<T>) {
        self.storage = storage
    }
    
    mutating func append(_ item: T) {
        if !isKnownUniquelyReferenced(&storage) {
            storage = storage.copy()
        }
        storage.append(item)
    }

    func get(at index: Int) -> T {
        return storage.get(at: index)
    }
    
    mutating func set(at index: Int, to item: T) {
        if !isKnownUniquelyReferenced(&storage) {
            storage = storage.copy()
        }
        storage.set(at: index, to: item)
    }
    
    func count() -> Int {
        return storage.count()
    }
}

var arr: [Int] = [1,2,3,4,5]

var storage = CollectionStorage(items: [13, 32, 9, 34])

var collection1 = Collection(storage: storage) 
var collection2 = collection1

print(address(off: collection1.storage))
print(address(off: collection2.storage))

collection2.append(3)
print("------------------------------------")

print(address(off: collection1.storage))
print(address(off: collection2.storage))
