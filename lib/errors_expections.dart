class UpdateTodoError extends Error {
  String message = "Update Todo Error";
  late String detail;
  withDetail(String detailMessage) {
    detail = detailMessage;
    return this;
  }
}

class RemoveTodoError extends Error {
  String message = "Remove Todo Error";
  late String detail;
  withDetail(String detailMessage) {
    detail = detailMessage;
    return this;
  }
}

class GetTodoError extends Error {
  String message = "Get Todo Error";
  late String detail;
  withDetail(String detailMessage) {
    detail = detailMessage;
    return this;
  }
}

class AddTodoError extends Error {
  String message = "Add Todo Error";
  late String detail;
  withDetail(String detailMessage) {
    detail = detailMessage;
    return this;
  }
}

class ClearAllTodoError extends Error {
  String message = "Clear All Todo Error";
  late String detail;
  withDetail(String detailMessage) {
    detail = detailMessage;
    return this;
  }
}
