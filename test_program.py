import subprocess
import os


def run_asm(file_path, input_data, test_data_interface):
    space = 66
    try:
        for i in range(input_data.__len__()):
            result = subprocess.run(["java", "-jar", "rars.jar", file_path], input=input_data[i], text=True,
                                    capture_output=True)
            print("input:\n" + test_data_interface[i])
            print("output:")
            print(result.stdout[space:])
            print("\n" + "------------------------------------------------" + "\n")
    except subprocess.CalledProcessError as e:
        print("Произошла ошибка:", e)


def main():
    file_path = "IWH1.asm"

    test_data = [
        "-21\n",
        "0\n",
        "65\n",
        "11\n",
        "3\n0\n-1\n0\n",
        "4\n1\n0\n-1\n0\n",
        "5\n0\n14\n0\n-6\n0\n",
        "6\n3\n0\n0\n-4\n0\n-1\n",
        "7\n0\n3\n1\n0\n-9\n0\n0\n",
        "9\n4\n0\n5\n0\n0\n2\n-3\n3\n0\n",
        "10\n0\n2\n7\n0\n3\n0\n-4\n0\n-1\n0\n",

    ]

    input_data = [
        "-21\n",
        "0\n",
        "65\n",
        "11\n",
        "3 0 -1 0\n",
        "4 1 0 -1 0\n",
        "5 0 14 0 -6\n",
        "6 3 0 0 -4 0 -1\n",
        "70 3 1 0 -9 0 0\n",
        "9 4 0 5 0 0 2 -3 3 0\n",
        "10 0 2 7 0 3 0 -4 0 -1 0\n",

    ]

    if not os.path.exists("rars.jar"):
        print("Ошибка! Файла rars.jar не сущетвует в текущем каталоге.")
        return

    run_asm(file_path, test_data, input_data)


if __name__ == "__main__":
    main()
