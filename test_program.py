import subprocess
import os


def run_asm(file_path, input_data, test_data_interface):
    space = 66
    for i in range(input_data.__len__()):
        result = subprocess.run(["java", "-jar", "rars.jar", file_path], input=input_data[i], text=True,
                                capture_output=True)
        print("input:\n" + test_data_interface[i])
        print("output:")
        print(result.stdout[space:])
        print("\n" + "------------------------------------------------" + "\n")


def main():
    file_path = "IWH1.asm"

    test_data = [
        "-5\n",
        "0\n",
        "11\n",
        "1124\n",
        "3\n1\n2\n3\n",
        "4\n0\n1\n0\n1\n",
        "5\n7\n-5\n125\n0\n0\n",
        "6\n20\n-8\n1\n2\n2\n-7\n",
        "7\n4\n1\n3\n4\n-9\n9\n6\n",
        "9\n0\n1\n26\n78\n-100\n4\n7\n7\n25\n",
        "10\n69\n31\n-67\n-80\n55\n78\n-2\n23\n-74\n0\n",

    ]

    input_data = [
        "-5\n",
        "0\n",
        "11\n",
        "1124\n",
        "3\n1 2 3\n",
        "4\n0 1 0 1\n",
        "5\n7 -5 125 0 0\n",
        "6\n20 -8 1 2 2 -7\n",
        "7\n4 1 3 4 -9 9 6\n",
        "9\n0 1 26 78 -100 4 7 7 25\n",
        "10\n69 31 -67 -80 55 78 -2 23 -74 0\n",

    ]

    if not os.path.exists("rars.jar"):
        print("Error! The rars.jar file does not exist in the current directory.")
        return

    run_asm(file_path, test_data, input_data)


if __name__ == "__main__":
    main()
