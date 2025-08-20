

sealed class AccountState{}

class Empty implements AccountState{}
class IsLoading implements AccountState{}
class IsError implements AccountState{
  IsError({required this.message});
  final String message;
}
class Completed<T> implements AccountState{
  Completed(this.data);
  final T data;
}
