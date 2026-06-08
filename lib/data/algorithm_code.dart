const linearSearchCode = [
  "",
  "for (int i = 0; i < arr.length; i++)",
  "if (arr[i] == target)",
  "return i",
];

const binarySearchCode = [
  "",
  "while (low <= high)",
  "if (arr[mid] == target)",
  "return mid",
  "low = mid + 1",
  "high = mid - 1",
];

const bubbleSortCode = [
  "",
  "for (int i = 0; i < n - 1; i++)",
  "for (int j = 0; j < n - i - 1; j++)",
  "if (arr[j] > arr[j + 1])",
  "swap(arr[j], arr[j + 1])",
];

const selectionSortCode = [
  "",
  "for (int i = 0; i < n - 1; i++)",
  "minIndex = i",
  "for (int j = i + 1; j < n; j++)",
  "if (arr[j] < arr[minIndex])",
  "minIndex = j",
  "swap(arr[i], arr[minIndex])",
];