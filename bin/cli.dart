import 'dart:io';

void main(List<String> arguments) {
  printIntro();

  final int operationChoice = takeInputNum(prompt: "Input pilihan operasi: ");
  final int num1 = takeInputNum(prompt: "Angka pertama: ");
  final int num2 = takeInputNum(prompt: "Angka kedua: ");

  try {
    final double result = calculate(operationChoice: operationChoice, num1: num1, num2: num2);
    printResult(operationChoice, num1, num2, result);
  } catch (e) {
    print("Terjadi masalah: $e");
  }

}

void printIntro() {
  final String intro = """
  ## === Calculator CLI === ##
  1. Penjumlahan
  2. Pengurangan
  3. Perkalian
  4. Pembagian
  5. Modulus
  """;

  stdout.writeln(intro);
}

int takeInputNum({required String prompt}) {
  stdout.write(prompt);
  final String? inputStr = stdin.readLineSync();
  final int inputNum = int.tryParse(inputStr ?? "") ?? 0;
  return inputNum;
}

double calculate({required int operationChoice, required int num1, required int num2}) {
  switch (operationChoice) {
    case 1:
      return (num1 + num2).toDouble();
    case 2:
      return (num1 - num2).toDouble();
    case 3:
      return (num1 * num2).toDouble();
    case 4:
      if (num2 == 0) throw "Angka tidak bisa dibagi nol";
      return num1 / num2;
    case 5:
      return (num1 % num2).toDouble();
    default:
      throw "Operasi tidak tersedia.";
  }
}

void printResult(int operationChoice, int num1, int num2, double? result) {
  final String resultString = result?.toStringAsPrecision(3) ?? "null";
  final String op = operatorString(operationChoice);
  print("Hasil dari $num1 $op $num2 = $resultString");
}

String operatorString(int operationChoice) {
    Map<int, String> operators = {
      1: "+",
      2: "-",
      3: "*",
      4: "/",
      5: "%"
    };
    return operators[operationChoice] ?? "";
}