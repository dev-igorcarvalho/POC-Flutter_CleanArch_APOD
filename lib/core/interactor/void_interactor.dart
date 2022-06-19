///Interface for synchronous usecases that have an input and a void output
abstract class VoidInteractor<Input> {
  execute(Input input);
}
