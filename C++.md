# C++教程

教程整合顺序：

- [C++ 教程 | 菜鸟教程 (runoob.com)](https://www.runoob.com/cplusplus/cpp-tutorial.html)

<hr>

### 简介

C++ 是一种静态类型的、编译式的、通用的、大小写敏感的、不规则的编程语言。

C++ 是一种中级语言，支持过程化编程、面向对象编程和泛型编程。它综合了高级语言和低级语言的特点。

C++ 是由 **Bjarne Stroustrup** 于 1979 年在新泽西州美利山贝尔实验室开始设计开发的。

C++ 进一步扩充和完善了 C 语言，最初命名为带类的C，后来在 1983 年更名为 C++。

C++ 是 C 的一个超集，事实上，任何合法的 C 程序都是合法的 C++ 程序。

C++ 可运行于多种平台上，如 Windows、MAC 操作系统以及 UNIX 的各种版本。

### 面向对象程序设计

C++ 完全支持面向对象的程序设计，包括面向对象开发的四大特性：封装、抽象、继承、多态

### 标准库

标准的 C++ 由三个重要部分组成：

- 核心语言：提供了所有构件块，包括变量、数据类型和常量等。
- C++ 标准库：提供了大量的函数，用于操作文件、字符串等。
- 标准模板库（STL）：提供了大量的方法，用于操作数据结构

### 注释

程序的注释是解释性语句，您可以在 C++ 代码中添加注释，这将提高源代码的可读性。

> 提示：编译器在编译代码的时候，会忽略注释的内容

1. 单行注释：`//描述信息`

   - 通常放在代码的上方，或者一条语句的末尾，对改行代码说明
2. 多行注释：`/*描述信息*/`

   - 通常放在一段代码的上方，对该段代码做整体说明

### 数据类型

- 整型：整型变量表示的是整数类型的数据。

  C++中能够表示整型的类型有以下几种方式，区别在于所占内存空间不同：

  | 数据类型              | 占用空间 | 取值范围       |
  | --------------------- | -------- | -------------- |
  | short（短整型）       | 2字节    | [-2^15,2^15-1] |
  | int（整型）           | 4字节    | [-2^31,2^31-1] |
  | long（长整型）        | 8字节    | [-2^63,2^63-1] |
  | long long（长长整型） | 8字节    | [-2^63,2^63-1] |



### 1.2 变量

**作用**：给一段指定的内容内存空间起名，方便操作这段内存

**语法**：`数据类型 变量名 = 初始值;`

**示例**：

```c++
#include<iostream>
using namespace std;

int main(){
    //变量的定义
    //语法：数据类型 变量名 = 初始值;
    int a = 10;
    cout << "a = " << a << endl;
    system("pause");
    
    return 0;
}
```

### 1.3 常量

**作用**：用于记录程序中不可更改的数据

C++定义常量两种方式

1. **#define** 宏常量：`#define 常量名 常量值`
   - <font color='orange'>通常在文件上方定义</font>，表示一个常量
2. **const **修饰的变量 `const 数据类型 常量名 = 常量值`
   - <font color='orange'>通常在变量定义前加关键词const</font>，修饰该变量为常量，不可修改

**示例**：

```c++
//1、宏常量
#define day 7

int main(){
    
    cout << "一周里总共有 " << day << "天" << endl;
    //day = 8; //报错，宏常量不可以修改
    
    //2、const修饰变量
    const int month = 12;
    cout << "一年里总共有" << month << "个月份" << endl;
    //month = 24;  //报错，常量是不可以修改的
    
    system("pause");
    return 0;
}
```



### 1.3 关键字

**作用**：关键字是C++中预先保留的单词（标识符）

> 在定义变量或常量的时候，不要使用关键字



| asm        | do           | if               | return      | typedef  |
| ---------- | ------------ | ---------------- | ----------- | -------- |
| auto       | double       | inline           | short       | typeid   |
| bool       | dynamic_cast | int              | signed      | typename |
| break      | else         | long             | sizeof      | union    |
| case       | enum         | mutable          | static      | unsigned |
| catch      | explicit     | namespace        | static_cast | using    |
| char       | export       | new              | struct      | virtual  |
| class      | extern       | operator         | switch      | void     |
| const      | false        | private          | template    | volatile |
| const_cast | float        | protected        | this        | wchar_t  |
| continue   | for          | public           | throw       | while    |
| default    | friend       | register         | true        |          |
| delete     | goto         | reinterpret_cast | try         |          |

`提示：在给变量或者常量起名称，不要使用C++关键字，否则会产生歧义`



### 1.5 标识符命名规则

**作用**：C++规定给标识符（常量、变量）命名时，有一套自己的规则

- 标识符不能是关键字

- 标识符只能由字母、数字、下划线、组成

- 第一个字符必须为字母或下划线

- 标识符中字母区分大小写

  > 建议：给标识符命名时，尽量见名知意，方便阅读





### 2.2 sizeof关键字

**作用**：利用sizeof关键字可以<font color='orange'>统计数据类型所占内存大小</font>

**语法**：`sizeof（数据类型/变量）`

**示例**：

```c++
int main(){
    cout << "short 类型所占内存空间为 " << sizeof(short) << endl;
    
    cout << "int 类型所占空间为 " << sizeof(int) << endl;
    
    ...
    
    return 0;
}
```

### 2.3 实型（浮点型）

作用：用于表示小数

| 数据类型 | 占用空间 |  有效数字范围   |
| :------: | :------: | :-------------: |
|  float   |  4字节   |   7位有效数字   |
|  double  |  8字节   | 15~16位有效数字 |



### 2.4 字符型

**作用**：字符型变量用于显示单个字符

**语法**：`char ch = 'a';`

- C和C++中字符型变量只占用<font color='red'>1个字节</font>
- 字符型变量是将对应的ASCII编码放入到存储单元中



### 2.5 转义字符

作用： 用于表示一些不能显示出来的ASCII字符

