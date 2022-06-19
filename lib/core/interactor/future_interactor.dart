///Interface for asynchronous usecases that have an input and an output
abstract class FutureInteractor<Input, Output> {
  Future<Output> execute(Input input);
}
