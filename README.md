# IHW_1
Череухо Дмитрий Антонович, БПИ228
Вариант 31. Условие задачи: Сформировать массив B из элементов массива A в следующем порядке: сначала заполняем массив числами, стоящими на нечетных местах, а затем — стоящими на четных местах в массиве.

Работа выполнена на оценку “10”.

IHW1.asm - код программы на ассемблере.

IHW1_lib.asm - библиотека макросов для работы программы.

test_program.py - код тестирующей программы на питоне.

test_screens.zip - скрины примеров работы программы в эмуляторе.

tests - папка с тестами дял программы.

Условие задачи понял так, что чётность места числа в массиве опеределяется чётностью индекса(нумерация с нуля).

В требованиях есть противоречия в выборе между использованием макросов и подпрограмм, поэтому в программе решил использовать макросы для лучшей читаемости кода и удобства.

Универсальные модули в программе выделил в макросы с параметрами. Все макросы собрал в отдельном файле-библиотеке и написал для них комментарии с пояснением сущности передаваемых параметров.

В макросах print_char, print_str, read_int, print_int сохранял значение регистра a0 на стеке, для большей их универсальности. В других случаях использование стека и создание локальных переменных не понадобилось из-за небольшого количества используемых регистров.

Написал тестирующую программу на питоне. Она запускает программу на ассемблере, прогоняет её на заготовленных тестах и выводит результат в консоль. Для её корректной работы файлы IHW1.asm, IHW1_lib.asm и эмулятор rars.jar должны находиться в одном каталоге с test_program.py.

Для того чтобы корректно работала тестирующая программа на питоне, в основной программе на ассемблере убрал весь интерефейс, выводимый в консоль.





