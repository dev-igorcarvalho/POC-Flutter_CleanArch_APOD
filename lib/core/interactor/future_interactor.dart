abstract class FutureInteractor<Input, Output> {
  Future<Output> execute(Input input);
}
