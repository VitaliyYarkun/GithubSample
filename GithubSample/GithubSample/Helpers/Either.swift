enum Either<L, R> {
    case left(L)
    case right(R)
}

extension Either {
    var left: L? {
        if case let .left(value) = self {
            return value
        }
        return nil
    }

    var right: R? {
        if case let .right(value) = self {
            return value
        }
        return nil
    }
}
