import Foundation

protocol Store: AnyObject {
  associatedtype State
  associatedtype Action
  associatedtype Effector
  
  var state: State { get set}
  var effector: Effector { get }
  
  var reduce: (State, Action, Effector) async -> State { get }
}

extension Store {
  @MainActor
  func send(_ action: Action) {
    Task {
      state = await reduce(state, action, effector)
    }
  }

  @MainActor
  func send(_ actions: [Action]) {
    Task {
      for action in actions {
        state = await reduce(state, action, effector)
      }
    }
  }
}
