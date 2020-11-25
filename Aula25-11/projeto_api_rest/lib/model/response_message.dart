class ResponseMessage <T>{

  bool ok;
  String msg;
  T result;

  ResponseMessage.ok({this.result}){
    this.ok = true;
  }

  ResponseMessage.error({this.msg}){
    this.ok = false;
  }

}