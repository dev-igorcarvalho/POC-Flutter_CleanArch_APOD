///Interface for synchronous usecases that have an input and an output
abstract class Interactor<Input, Output> {
  Output execute(Input input);
}
