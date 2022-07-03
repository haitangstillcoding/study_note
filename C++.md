# C++



## 一、初识



### 1.1 注释

1. 单行注释：`//描述信息`

   - 通常放在代码的上方，或者一条语句的末尾，<font color='orange'>对改行代码说明</font>

2. 多行注释：`/*描述信息*/`

   - 通常放在一段代码的上方，<font color='orange'>对该段代码做整体说明</font>

   > 提示：编译器在编译代码的时候，会忽略注释的内容

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



## 二、数据类型

C++规定在创建一个变量或者常量是，必须要指定出相应的数据类型，否则无法给变量分配内存空间

### 2.1 整型

**作用**：整型变量表示的是<font color='orange'>整数类型</font>的数据

C++中能够表示整型的类型有以下几种方式，区别在于所占内存空间不同：

| 数据类型              | 占用空间                                        | 取值范围       |
| --------------------- | ----------------------------------------------- | -------------- |
| short（短整型）       | 2字节                                           | [-2^15,2^15-1] |
| int（整型）           | 4字节                                           | [-2^31,2^31-1] |
| long（长整型）        | windows为4字节、Linux为4字节(32位)、8字节(64位) | [-2^31,2^31-1] |
| long long（长长整型） | 8字节                                           | [-2^63,2^63-1] |



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

