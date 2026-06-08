const linearSearchPython = '''
def linear_search(arr, target):
    for i in range(len(arr)):
        if arr[i] == target:
            return i

    return -1
''';

const linearSearchC = '''
int linearSearch(int arr[], int n, int target)
{
    for(int i = 0; i < n; i++)
    {
        if(arr[i] == target)
        {
            return i;
        }
    }

    return -1;
}
''';

const binarySearchPython = '''
def binary_search(arr, target):
    low = 0
    high = len(arr) - 1

    while low <= high:
        mid = (low + high) // 2

        if arr[mid] == target:
            return mid

        elif arr[mid] < target:
            low = mid + 1

        else:
            high = mid - 1

    return -1
''';

const binarySearchC = '''
int binarySearch(int arr[], int n, int target)
{
    int low = 0;
    int high = n - 1;

    while(low <= high)
    {
        int mid = (low + high) / 2;

        if(arr[mid] == target)
        {
            return mid;
        }

        if(arr[mid] < target)
        {
            low = mid + 1;
        }
        else
        {
            high = mid - 1;
        }
    }

    return -1;
}
''';

const bubbleSortPython = '''
def bubble_sort(arr):
    n = len(arr)

    for i in range(n - 1):
        for j in range(n - i - 1):

            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = \
                    arr[j + 1], arr[j]

    return arr
''';

const bubbleSortC = '''
void bubbleSort(int arr[], int n)
{
    for(int i = 0; i < n - 1; i++)
    {
        for(int j = 0;
            j < n - i - 1;
            j++)
        {
            if(arr[j] > arr[j + 1])
            {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}
''';

const selectionSortPython = '''
def selection_sort(arr):
    n = len(arr)

    for i in range(n - 1):
        min_index = i

        for j in range(i + 1, n):
            if arr[j] < arr[min_index]:
                min_index = j

        arr[i], arr[min_index] = \
            arr[min_index], arr[i]

    return arr
''';

const selectionSortC = '''
void selectionSort(int arr[], int n)
{
    for(int i = 0; i < n - 1; i++)
    {
        int minIndex = i;

        for(int j = i + 1; j < n; j++)
        {
            if(arr[j] < arr[minIndex])
            {
                minIndex = j;
            }
        }

        int temp = arr[i];
        arr[i] = arr[minIndex];
        arr[minIndex] = temp;
    }
}
''';