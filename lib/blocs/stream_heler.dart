import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:sample/repository/remote/error/app_exception.dart';

void main(List<String> args) async {
  fakeChangeText()
      .where((event) => event.isNotEmpty)
      .throttleTime(const Duration(milliseconds: 500))
      .flatMap((value) => RetryStream(() => fakeApi(), 3))
      .doOnError((p0, _) => print(p0))
      .listen(print);
}

Stream<String> fakeApi() async* {
  yield 'Success';
}

Stream<String> fakeChangeText() async* {
  yield '';
  yield '1';
  yield '12';
  yield '123';
  yield '1234';
  yield '12345';
  await Future.delayed(const Duration(milliseconds: 500));
  yield '123456';
  yield '1234567';
  yield '12345678';
  yield '12345689';
}



// input:
//  1 text rỗng
//  2 thay đổi text

// output : 
//  1 nếu rỗng thì không tìm kiếm
//  2 05s thì gọi api một lần lấy lần nhập cuối cùng || nhập bao nhiêu chữ thì dừng nhập 1s mới gọi api
//  3 retry


// Read/Write file
// sqlite
// SharedPreference