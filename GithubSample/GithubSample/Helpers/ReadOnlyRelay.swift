import RxCocoa
import RxSwift

final class ReadOnlyRelay<Element> {

    private let _relay: BehaviorRelay<Element>

    var value: Element {
        return _relay.value
    }

    init(_ relay: BehaviorRelay<Element>) {
        self._relay = relay
    }

    func asObservable() -> Observable<Element> {
        return _relay.asObservable()
    }
}
