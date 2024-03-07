import 'dart:io';

/*
Flutter'da asenkron programlama, birden fazla işlemi aynı anda yürütmenize ve uygulamanızın daha duyarlı ve
 akıcı hale gelmesine olanak tanır. Bunu başarmak için async, await ve Future gibi anahtar kelimeler kullanılır.

Async:

async anahtar kelimesi, bir fonksiyonun asenkron olduğunu belirtir.
Bu, fonksiyonun geri dönmeden önce bir Future nesnesi döndüreceği anlamına gelir.

Await:

await anahtar kelimesi, bir Future nesnesinin tamamlanmasını beklemek için kullanılır.
 await bir Future nesnesinin önüne yerleştirilir ve Future nesnesi tamamlanana kadar kodun yürütülmesi durdurulur.

Future:

Future nesnesi, bir asenkron işlemin sonucunu temsil eder.
Bir Future nesnesi tamamlanana kadar success veya error gibi farklı durumlar alabilir.

Future<String> getData() async {
  // Asenkron işlem
  await Future.delayed(Duration(seconds: 2));
  return "Veri alındı!";
}

void main() async {
  // Asenkron fonksiyon çağrısı
  String data = await getData();

  // Veri alındıktan sonra kod çalışmaya devam eder
  print(data);
}

 */

void main() {
  //performTasks();
  double a = 10.6543;
  print(a.round());
}

void performTasks() async{
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async{
  Duration duration = Duration(seconds: 3);
  String result = '';
  await Future.delayed(duration, (){
    result = 'task 2 data';
    print('Task 2 complete');

  });
  return result;
}

void task3(String task2Result) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Result');
}