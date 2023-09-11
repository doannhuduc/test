void main(List<String> args) {
  int number = 123321;
  print(isPalindrome(number));
}

bool isPalindrome(int x) {
  String numStr = x.toString();
  int left = 0;
  int right = numStr.length - 1;

  while (left < right) {
    if (numStr[left] != numStr[right]) {
      return false;
    }
    left++;
    right--;
  }
  return true;
}
