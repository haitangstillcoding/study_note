# C语言教程



## C语言类型



### 1.整数类型

- 在内存中，char与unsigned char没有什么不同，都是一个字节，唯一的区别是，char的最高位为符号位，因此char能表示-128~127,unsigned char没有符号位，因此能表示0~255。

| 类型           | 存储大小   | 值范围                               |
| -------------- | ---------- | ------------------------------------ |
| char           | 1 byte     | -128~127 或0~255                     |
| unsigned char  | 1 byte     | 0~255                                |
| signed char    | 1 byte     | -128~127                             |
| int            | 2或4 bytes | -32768~32767或-2147483648~2147483647 |
| unsigned int   | 2或4 bytes | 0~65535或0~4294967295                |
| short          | 2 bytes    | -32768到32767                        |
| unsigned short | 2 bytes    | 0~65535                              |
| long           | 4 bytes    | -2147483648~2147483647               |
| unsigned long  | 4 bytes    | 0~4294967295                         |



### 2.浮点类型

| 类型        | 存储大小 | 精度     |
| ----------- | -------- | -------- |
| float       | 4 bytes  | 6位小数  |
| double      | 8 bytes  | 15位小数 |
| long double | 10 bytes | 19位小数 |



### 3. void类型

1. 函数返回为空：例如 **void exit(int status);**

2. 函数参数为空：C中有各种函数不接受参数，例如 **int rand(void);**

3. 指针指向 void ：void* 的指针代表对象的地址，而不是类型。例如 **void *malloc(size_t size);** 返回指向void的指针，可以转换为任何数据类型

   

## 变量与常量



### 1.变量的声明与定义

```c
#include <stdio.h>

// 变量声明
extern int a, b, c;

int main ()
{
  /* 变量定义 */
  int a, b, c;
 
  /* 实际初始化 */
  a = 10;
  b = 20;
  c = 0;
  
  c = a + b;
  printf("value of c : %d \n", c);
 
  return 0;
}
```



同理，函数声明时。

```c
//函数声明
int function();

int main(){
    //函数调用
    int i = function();
}

//函数定义
int function(){
    return 0;
}
```



### 2.定义常量

- #define 预处理器

  ```c
  #define LENGTH 10   
  #define WIDTH  5
  #define NEWLINE '\n'
  ```

  

- const  关键字

  ```c
  const int  LENGTH = 10;
  const int  WIDTH  = 5;
  const char NEWLINE = '\n';
  ```



## 储存类



### 1. auto 存储类

- 所有局部变量的默认值，auto只能用在函数内，即只能修饰局部变量

```c
{
    int mouth;
    auto int month;
}
```



### 2. register 存储类

- 定义在CPU旁边的寄存器，而不是RAM中局部变量，变量大小等于寄存器大小，且不能对它用'&'运算符，因为没有内存地址，没在内存中。

  ```c
  {
      register int miles;
  }
  ```

  

### 3. static 存储类

- 程序生命周期内保持局部变量的存在，使用static修饰局部变量可以在函数调用之间保持局部变量的值。
- static也可以修饰全局变量，作用域为声明它的文件中。

```c
#include <stdio.h>
 
/* 函数声明 */
void func(void);
 
static int count = 5; /* 全局变量 */
 
main()
{
   while(count--)
   {
      func();
   }
   return 0;
}
/* 函数定义 */
void func( void )
{
   static int i = 5; /* 局部静态变量 */
   i++;

   printf("i is %d and count is %d\n", i, count);
}
```



### 4. extern 存储类

- extern 存储类用于提供全局变量的引用，修饰下的变量对所有的应用程序都是可见的。当您使用 'extern' 时，对于无法初始化的变量，会把变量名指向一个之前定义过的存储位置。
- 当有多个文件且定义了一个可以在其他文件中使用的全局变量或函数时，可以在其他文件中使用 *extern* 来得到已定义的变量或函数的引用。可以这么理解，*extern* 是用来在另一个文件中声明一个全局变量或函数。

main.c

```c
#include<stdio.h>

//声明变量count,变量定义在support.c
int count;
//在main.c声明，函数定义在support.c
extern void write_extern();

main(){
    count = 5;
    //函数调用
    write_extern();
}
```

support.c

```c
#include<stdio.h>

//extern修饰符修饰count,此全局变量可以在多个文件中被共享
extern int count;

//函数定义
void write_extern(void){
    printf("count is %d\n",count);
}
```

终端编译两个文件

```
gcc main.c support.c
```

执行exe程序得到结果

```
count is 5
```



## C运算符



### 1. 位运算

- 位运算作用于位，并逐位执行操作。&、|、^的真值表如图所示：

|  p   |  q   | p&q  | p\|q | p^q  |
| :--: | :--: | :--: | :--: | :--: |
|  0   |  0   |  0   |  0   |  0   |
|  0   |  1   |  0   |  1   |  1   |
|  1   |  1   |  1   |  1   |  0   |
|  1   |  0   |  0   |  1   |  1   |

假设如果A = 60，且 B = 13，现在以二进制格式表示，他们如下所示：

A = 0011 1100

B = 0000 1101

———————

A&B = 0000 1100

A|B = 0011 1101

A^B = 0011 0001

~为取反运算符

~A = 1100 0011

| <<   | 二进制左移运算符。左操作数的值向左移动右操作数指定的位数（左边的二进制位丢弃，右边补0）。 | A << 2 将得到 240，即为 1111 0000 |
| ---- | ------------------------------------------------------------ | --------------------------------- |
| >>   | 二进制右移运算符。左操作数的值向右移动右操作数指定的位数（正数左补0，负数左补1，右边丢弃）。 | A >> 2 将得到 15，即为 0000 1111  |



## 循环



### 1. while

- 在这里，**statement(s)** 可以是一个单独的语句，也可以是几个语句组成的代码块。**condition** 可以是任意的表达式，当为任意非零值时都为 true。当条件为 true 时执行循环。

  当条件为 false 时，程序流将继续执行紧接着循环的下一条语句。

```c
while(condition){
    statement(s);
}
```



### 2. for

```c
for(init;condition;increment){
    statement(s);
}
```

- **init** 会首先被执行，且只会执行一次。这一步允许您声明并初始化任何循环控制变量。您也可以不在这里写任何语句，只要有一个分号出现即可。
- 接下来，会判断 **condition**。如果为真，则执行循环主体。如果为假，则不执行循环主体，且控制流会跳转到紧接着 for 循环的下一条语句。
- 在执行完 for 循环主体后，控制流会跳回上面的 **increment** 语句。该语句允许您更新循环控制变量。该语句可以留空，只要在条件后有一个分号出现即可。
- 条件再次被判断。如果为真，则执行循环，这个过程会不断重复（循环主体，然后增加步值，再然后重新判断条件）。在条件变为假时，for 循环终止。

 

### 3. continue 语句

- 对于 **for** 循环，**continue** 语句执行后自增语句仍然会执行。对于 **while** 和 **do...while** 循环，**continue** 语句重新执行条件判断语句。



## 函数



### 1. 函数参数

|                           调用类型                           |                             描述                             |
| :----------------------------------------------------------: | :----------------------------------------------------------: |
| [传值调用](http://www.codebaoku.com/c/c-function-call-by-value.html) | 该方法把参数的**实际值**复制给函数的形式参数。在这种情况下，修改函数内的形式参数不会影响实际参数。 |
| [引用调用](http://www.codebaoku.com/c/c-function-call-by-reference.html) | 该方法把参数的**地址**复制给形式参数。在函数内，该地址用于访问调用中要用到的实际参数。这意味着，修改形式参数会影响实际参数。 |



### 2. 传值调用

- 向函数传递参数的**传值调用**方法，把参数的实际值复制给函数的形式参数。在这种情况下，修改函数内的形式参数不会影响实际参数。

  ```c
  /* 函数定义 */
  void swap(int x, int y)
  {
     int temp;
  
     temp = x; /* 保存 x 的值 */
     x = y;    /* 把 y 赋值给 x */
     y = temp; /* 把 temp 赋值给 y */
    
     return;
  }
  ```

  ```c
  #include <stdio.h>
   
  /* 函数声明 */
  void swap(int x, int y);
   
  int main ()
  {
     /* 局部变量定义 */
     int a = 100;
     int b = 200;
   
     printf("交换前，a 的值： %d\n", a );
     printf("交换前，b 的值： %d\n", b );
   
     /* 调用函数来交换值 */
     swap(a, b);
   
     printf("交换后，a 的值： %d\n", a );
     printf("交换后，b 的值： %d\n", b );
   
     return 0;
  }
  ```

  ```
  交换前，a 的值： 100
  交换前，b 的值： 200
  交换后，a 的值： 100
  交换后，b 的值： 200
  ```

  上面的实例表明了，虽然在函数内改变了 a 和 b 的值，但是实际上 a 和 b 的值没有发生变化。



### 3. 引用调用

- 按引用传递值，参数指针被传递给函数，就像传递其他值给函数一样。需要声明函数参数为指针类型，该函数用于交换参数所指向的两个整数变量的值。

  ```c
  /* 函数定义 */
  void swap(int *x, int *y)
  {
     int temp;
     temp = *x;    /* 保存地址 x 的值 */
     *x = *y;      /* 把 y 赋值给 x */
     *y = temp;    /* 把 temp 赋值给 y */
    
     return;
  }
  ```

  现在，让我们通过引用传值来调用函数 **swap()**，它会产生下列结果

  ```
  交换前，a 的值： 100
  交换前，b 的值： 200
  交换后，a 的值： 200
  交换后，b 的值： 100
  ```



## 作用域

C 语言中有三个地方可以声明变量：

- 在函数或块内部的**局部**变量
- 在所有函数外部的**全局**变量
- 在**形式**参数的函数参数定义中



### 1.局部变量

某个函数或块的内部声明的变量称为局部变量。



### 2.全局变量

全局变量定义在函数外部，通常在程序的顶部，任意函数内部都能访问全局变量。



### 3.初始化局部变量和全局变量

当局部变量被定义时，系统不会对其初始化。定义全局变量时，系统会自动对其初始化。

| 数据类型 | 初始默认值 |
| :------: | :--------: |
|   int    |     0      |
|   char   |     ''     |
|  float   |     0      |
|  double  |     0      |
| pointer  |    NULL    |



## 数组



### 1.传递数组给函数

- 形式参数是一个指针void fun(int *param) 
- 形式参数是一个数组void fun(int param[])



### 2.从函数返回数组

- C 不支持在函数外返回局部变量的地址，除非定义局部变量为 **static** 变量。

  ```c
  int *fun();
  ```

  

### 3.指向数组的指针

- ```c
  double balance[50];
  ```

  **balance** 是一个指向 &balance[0] 的指针，即数组 balance 的第一个元素的地址。

  ```c
  double *p;
  double balance[10];
  
  p = balance;
  ```

  使用数组名作为常量指针是合法的，反之亦然。因此，*(balance + 4) 是一种访问 balance[4] 数据的合法方式。



## 指针



### 1.什么是指针

指针是一个变量，值为另一个变量的地址。

和其他变量一样，在使用指针变量之前，需要对指针变量进行声明，才能存储其他变量地址。

### 2.如何使用指针

- 指针的定义

  ```c
  int    *ip;    /* 一个整型的指针 */
  double *dp;    /* 一个 double 型的指针 */
  float  *fp;    /* 一个浮点型的指针 */
  char   *ch     /* 一个字符型的指针 */
  ```

- 变量地址赋值给指针

  ```c
  int *ip;       /*指针变量的声明*/
  ip = &var      /*在指针变量中存储var的地址*/
  ```

- 访问指针变量中可用地址的值

  ```c
  /* 使用指针访问值 */
  printf("Value of *ip variable: %d\n", *ip );
  ```

  ```
  Value of *ip variable: 20
  ```

  

### 3.C中的NULL指针

- 在变量声明的时候，如果没有确切的地址可以赋值，为指针变量赋一个 NULL 值是一个良好的编程习惯。赋为 NULL 值的指针被称为**空**指针。

- NULL 指针是一个定义在标准库中的值为零的常量。



### 4.指针的算术运算

- 递增、递减一个指针

  我们喜欢在程序中使用指针代替数组，因为变量指针可以递增，而数组不能递增，数组可以看成一个指针常量。

  ```c
  #include <stdio.h>
  
  const int MAX = 3;
  
  int main ()
  {
     int  var[] = {10, 100, 200};
     int  i, *ptr;
  
     /* 指针中的数组地址 */
     ptr = var;
     for ( i = 0; i < MAX; i++)
     {
  
        printf("Address of var[%d] = %x\n", i, ptr );
        printf("Value of var[%d] = %d\n", i, *ptr );
  
        /* 移动到下一个位置 */
        ptr++;
     }
     return 0;
  }
  ```

递减一个指针同理



### 5.指针数组

- 让数组存储指针

  在这里，把 **ptr** 声明为一个数组，由 MAX 个整数指针组成。因此，ptr 中的每个元素，都是一个指向 int 值的指针。下面的实例用到了三个整数，它们将存储在一个指针数组中，如下所示：

  ```c
  #include <stdio.h>
   
  const int MAX = 3;
   
  int main ()
  {
     int  var[] = {10, 100, 200};
     int i, *ptr[MAX];
   
     for ( i = 0; i < MAX; i++)
     {
        ptr[i] = &var[i]; /* 赋值为整数的地址 */
     }
     for ( i = 0; i < MAX; i++)
     {
        printf("Value of var[%d] = %d\n", i, *ptr[i] );
     }
     return 0;
  }
  ```

  当上面的代码被编译和执行时，它会产生下列结果：

  ```
  Value of var[0] = 10
  Value of var[1] = 100
  Value of var[2] = 200
  ```



### 6.指向指针的指针

指向指针的指针是一种多级寻址的形式，或者说是一个指针链。

当我们定义一个指向指针的指针时，第一个指针包含了第二个指针的地址，第二个指针指向包含实际值的位置。



- 声明

  ```c
  int **var;
  ```

- 当一个目标值被一个指针间接指向到另一个指针时，访问这个值需要使用两个星号运算符，如下面实例所示：

  ```c
  #include <stdio.h>
   
  int main ()
  {
     int  var;
     int  *ptr;
     int  **pptr;
  
     var = 3000;
  
     /* 获取 var 的地址 */
     ptr = &var;
  
     /* 使用运算符 & 获取 ptr 的地址 */
     pptr = &ptr;
  
     /* 使用 pptr 获取值 */
     printf("Value of var = %d\n", var );
     printf("Value available at *ptr = %d\n", *ptr );
     printf("Value available at **pptr = %d\n", **pptr);
  
     return 0;
  }
  ```

  ```
  Value of var = 3000
  Value available at *ptr = 3000
  Value available at **pptr = 3000
  ```



### 7.传递指针给函数

C 语言允许您传递指针给函数，只需要简单地声明函数参数为指针类型即可。

```c
#include <stdio.h>
#include <time.h>
 
void getSeconds(unsigned long *par);

int main ()
{
   unsigned long sec;


   getSeconds( &sec );

   /* 输出实际值 */
   printf("Number of seconds: %ld\n", sec );

   return 0;
}

void getSeconds(unsigned long *par)
{
   /* 获取当前的秒数 */
   *par = time( NULL );
   return;
}
```

当上面的代码被编译和执行时，它会产生下列结果：

```
Number of seconds :1294450468
```



能接受指针作为参数的函数，也能接受数组作为参数，如下所示：

```c
#include <stdio.h>
 
/* 函数声明 */
double getAverage(int *arr, int size);
 
int main ()
{
   /* 带有 5 个元素的整型数组  */
   int balance[5] = {1000, 2, 3, 17, 50};
   double avg;
 
   /* 传递一个指向数组的指针作为参数 */
   avg = getAverage( balance, 5 ) ;
 
   /* 输出返回值  */
   printf("Average value is: %f\n", avg );
    
   return 0;
}

double getAverage(int *arr, int size)
{
  int    i, sum = 0;       
  double avg;          
 
  for (i = 0; i < size; ++i)
  {
    sum += arr[i];
  }
 
  avg = (double)sum / size;
 
  return avg;
}
```

当上面的代码被编译和执行时，它会产生下列结果：

```
Average value is: 214.40000
```



## 字符串

- 在 C 语言中，字符串实际上是使用 **null** 字符 '' 终止的一维字符数组。因此，一个以 null 结尾的字符串，包含了组成字符串的字符。

  c/c++中定义的字符串的内存表示：

  ![C/C++ 中的字符串表示](http://static.codebaoku.com/pics/5d/01/5d01d7ac6818a34938c1570ac64428fc.jpg)



| 序号 | 函数 & 目的                                                  |
| :--- | :----------------------------------------------------------- |
| 1    | **strcpy(s1, s2);** 复制字符串 s2 到字符串 s1。              |
| 2    | **strcat(s1, s2);** 连接字符串 s2 到字符串 s1 的末尾。       |
| 3    | **strlen(s1);** 返回字符串 s1 的长度。                       |
| 4    | **strcmp(s1, s2);** 如果 s1 和 s2 是相同的，则返回 0；如果 s1<s2 则返回小于 0；如果 s1>s2 则返回大于 0。 |
| 5    | **strchr(s1, ch);** 返回一个指针，指向字符串 s1 中字符 ch 的第一次出现的位置。 |
| 6    | **strstr(s1, s2);** 返回一个指针，指向字符串 s1 中字符串 s2 的第一次出现的位置。 |



### 结构体



### 1.访问结构成员

- 为了访问结构的成员，我们使用**成员访问运算符（.）**。成员访问运算符是结构变量名称和我们要访问的结构成员之间的一个 “.”。

```c
#include <stdio.h>
#include <string.h>
 
struct Books
{
   char  title[50];
   char  author[50];
   char  subject[100];
   int   book_id;
};
 
int main( )
{
   struct Books Book1;        /* 声明 Book1，类型为 Book */
   struct Books Book2;        /* 声明 Book2，类型为 Book */
 
   /* Book1 详述 */
   strcpy( Book1.title, "C Programming");
   strcpy( Book1.author, "Nuha Ali"); 
   strcpy( Book1.subject, "C Programming Tutorial");
   Book1.book_id = 6495407;

   /* Book2 详述 */
   strcpy( Book2.title, "Telecom Billing");
   strcpy( Book2.author, "Zara Ali");
   strcpy( Book2.subject, "Telecom Billing Tutorial");
   Book2.book_id = 6495700;

   return 0;
}
```



### 2.结构作为函数参数

您可以把结构作为函数参数，传参方式与其他类型的变量或指针类似。

```c
#include <stdio.h>
#include <string.h>
 
struct Books
{
   char  title[50];
   char  author[50];
   char  subject[100];
   int   book_id;
};

/* 函数声明 */
void printBook( struct Books book );
int main( )
{
   struct Books Book1;        /* 声明 Book1，类型为 Book */
   struct Books Book2;        /* 声明 Book2，类型为 Book */
 
   /* Book1 详述 */
   strcpy( Book1.title, "C Programming");
   strcpy( Book1.author, "Nuha Ali"); 
   strcpy( Book1.subject, "C Programming Tutorial");
   Book1.book_id = 6495407;

   /* Book2 详述 */
   strcpy( Book2.title, "Telecom Billing");
   strcpy( Book2.author, "Zara Ali");
   strcpy( Book2.subject, "Telecom Billing Tutorial");
   Book2.book_id = 6495700;
 
   /* 输出 Book1 信息 */
   printBook( Book1 );

   /* 输出 Book2 信息 */
   printBook( Book2 );

   return 0;
}
void printBook( struct Books book )
{
   printf( "Book title : %s\n", book.title);
   printf( "Book author : %s\n", book.author);
   printf( "Book subject : %s\n", book.subject);
   printf( "Book book_id : %d\n", book.book_id);
}
```



### 3.指向结构的指针

您可以定义指向结构的指针，方式与定义指向其他类型变量的指针相似

```c
struct Books *struct_pointer;
```

现在，您可以在上述定义的指针变量中存储结构变量的地址。为了查找结构变量的地址，请把 & 运算符放在结构名称的前面，如下所示：

```c
struct_pointer = &Book1;
```

为了使用指向该结构的指针访问结构的成员，您必须使用 -> 运算符，如下所示：

```c
struct_pointer->title;
```



让我们使用结构指针来重写上面的实例，这将有助于您理解结构指针的概念：

```c
#include<stdio.h>
#include<string.h>

struct Books{
    char title[50];
    char author[50];
    char subject[100];
    int book_id;
};

/*函数声明*/
void printBook(struct Books *book);

int main(){
    struct Books Book1; /*声明 Book1,类型为Books*/
    struct Books Book2; /*声明 Book2,类型为Books*/
    
    /*Book1 详述*/
    strcpy(Book1.title,"C Programming");
    strcpy( Book1.author, "Nuha Ali"); 
    strcpy( Book1.subject, "C Programming Tutorial");
    Book1.book_id = 6495407;

    /* Book2 详述 */
    strcpy( Book2.title, "Telecom Billing");
    strcpy( Book2.author, "Zara Ali");
    strcpy( Book2.subject, "Telecom Billing Tutorial");
    Book2.book_id = 6495700;
    
    /*通过传Book1的地址来输出Book1信息*/
    printBook(&Book1);
    /*通过传Book2的地址来输出Book2信息*/
    printBook(&Book2);
    
    return 0;
}

void printBook(struct Books *book){
    printf("Book title : %s\n",book->title);
    printf( "Book author : %s\n", book->author);
    printf( "Book subject : %s\n", book->subject);
    printf( "Book book_id : %d\n", book->book_id);
}
```



### 4.位域

有些信息在存储时，并不需要占用一个完整的字节，而只需占几个或一个二进制位。例如在存放一个开关量时，只有 0 和 1 两种状态，用 1 位二进位即可。为了节省存储空间，并使处理简便，C 语言又提供了一种数据结构，称为"位域"或"位段"。

所谓"位域"是把一个字节中的二进位划分为几个不同的区域，并说明每个区域的位数。每个域有一个域名，允许在程序中按域名进行操作。这样就可以把几个不同的对象用一个字节的二进制位域来表示。

典型的实例：

- 用 1 位二进位存放一个开关量时，只有 0 和 1 两种状态。
- 读取外部文件格式——可以读取非标准的文件格式。例如：9 位的整数。



#### **1.位域的定义和位域变量的说明**

位域定义与结构定义相仿，其形式为：

```c
struct 位域结构名{ 位域列表 };
```

其中位域列表的形式为：

```
类型说明符 位域名：位域长度
```

例如

```c
struct bs{
    int a:8;
    int b:2;
    int b:6;
}data;
```

说明data为bs变量，共占两个字节。其中位域a占8位，位域b占2位，位域c占6位



**对于位域的定义尚有以下几点说明：**

- 一个位域必须存储在同一个字节中，不能跨两个字节。如一个字节所剩空间不够存放另一位域时，应从下一单元起存放该位域。也可以有意使某位域从下一单元开始。例如：

- 位域可以是无名位域，这时它只用来作填充或调整位置。无名的位域是不能使用的。

  ```
  struct bs{
      unsigned a:4;
      unsigned  :4;    /* 空域 */
      unsigned b:4;    /* 从下一单元开始存放 */
      unsigned c:4
  }
  ```



#### 2.位域的使用

位域的使用和结构成员的使用相同，其一般形式为：

```
位域变量名·位域名
```

位域允许用各种格式输出。

请看下面的实例：

```c
main(){
    struct bs{
        unsigned a:1;
        unsigned b:3;
        unsigned c:4;
    } bit,*pbit;
    bit.a=1; /* 给位域赋值（应注意赋值不能超过该位域的允许范围） */
    bit.b=7;    /* 给位域赋值（应注意赋值不能超过该位域的允许范围） */
    bit.c=15;   /* 给位域赋值（应注意赋值不能超过该位域的允许范围） */
    printf("%d,%d,%d\n",bit.a,bit.b,bit.c);  /* 以整型量格式输出三个域的内容 */
    pbit=&bit;    /* 把位域变量 bit 的地址送给指针变量 pbit */
    pbit->a=0;   /* 用指针方式给位域 a 重新赋值，赋为 0 */
    pbit->b&=3;  /* 使用了复合的位运算符 "&="，相当于：pbit->b=pbit->b&3，位域 b 中原有值为 7，与 3 作按位与运算的结果为 3（111&011=011，十进制值为 3） */
    pbit->c|=1;  /* 使用了复合位运算符"|="，相当于：pbit->c=pbit->c|1，其结果为 15 */
    printf("%d,%d,%d\n",pbit->a,pbit->b,pbit->c);    /* 用指针方式输出了这三个域的值 */
}
```



## 共用体



### 1.定义共用体

为了定义共用体，您必须使用 **union** 语句，方式与定义结构类似。

```c
union Data{
    int i;
    float f;
    char str[20];
}data;
```

现在，**Data** 类型的变量可以存储一个整数、一个浮点数，或者一个字符串。这意味着一个变量（相同的内存位置）可以存储多个多种类型的数据。您可以根据需要在一个共用体内使用任何内置的或者用户自定义的数据类型。

共用体占用的内存应足够存储共用体中最大的成员。例如，在上面的实例中，Data 将占用 20 个字节的内存空间，因为在各个成员中，字符串所占用的空间是最大的。下面的实例将显示上面的共用体占用的总内存大小：

```c
#include <stdio.h>
#include <string.h>
 
union Data
{
   int i;
   float f;
   char  str[20];
};
 
int main( )
{
   union Data data;        

   printf( "Memory size occupied by data : %d\n", sizeof(data));

   return 0;
}
```



### 2. 访问共用体成员

共用体成员访问方法同结构体一样，使用成员访问符"."。

```c
#include <stdio.h>
#include <string.h>
 
union Data
{
   int i;
   float f;
   char  str[20];
};
 
int main( )
{
   union Data data;        

   data.i = 10;
   data.f = 220.5;
   strcpy( data.str, "C Programming");

   printf( "data.i : %d\n", data.i);
   printf( "data.f : %f\n", data.f);
   printf( "data.str : %s\n", data.str);

   return 0;
}
```

当上面的代码被编译和执行时，它会产生下列结果：

```
data.i : 1917853763
data.f : 4122360580327794860452759994368.000000
data.str : C Programming
```

在这里，我们可以看到共用体的 **i** 和 **f** 成员的值有损坏，因为最后赋给变量的值占用了内存位置，这也是 **str** 成员能够完好输出的原因。现在让我们再来看一个相同的实例，这次我们在同一时间只使用一个变量，这也演示了使用共用体的主要目的：

```
#include <stdio.h>
#include <string.h>
 
union Data
{
   int i;
   float f;
   char  str[20];
};
 
int main( )
{
   union Data data;        

   data.i = 10;
   printf( "data.i : %d\n", data.i);
   
   data.f = 220.5;
   printf( "data.f : %f\n", data.f);
   
   strcpy( data.str, "C Programming");
   printf( "data.str : %s\n", data.str);

   return 0;
}
```

当上面的代码被编译和执行时，它会产生下列结果：

```
data.i : 10
data.f : 220.500000
data.str : C Programming
```

在这里，所有的成员都能完好输出，因为同一时间只用到一个成员。



## 位域

### 1. 位域声明

在结构内声明位域的形式如下：

```
struct
{
  type [member_name] : width ;
};
```

下面是有关位域中变量元素的描述：

| 元素        | 描述                                                         |
| :---------- | :----------------------------------------------------------- |
| type        | 整数类型，决定了如何解释位域的值。类型可以是整型、有符号整型、无符号整型。 |
| member_name | 位域的名称。                                                 |
| width       | 位域中位的数量。宽度必须小于或等于指定类型的位宽度。         |

带有预定义宽度的变量被称为**位域**。位域可以存储多于 1 位的数，例如，需要一个变量来存储从 0 到 7 的值，您可以定义一个宽度为 3 位的位域，如下：

```
struct
{
  unsigned int age : 3;
} Age;
```

上面的结构定义指示 C 编译器，age 变量将只使用 3 位来存储这个值，如果您试图使用超过 3 位，则无法完成。让我们来看下面的实例：

```
#include <stdio.h>
#include <string.h>

struct
{
  unsigned int age : 3;
} Age;

int main( )
{
   Age.age = 4;
   printf( "Sizeof( Age ) : %d\n", sizeof(Age) );
   printf( "Age.age : %d\n", Age.age );

   Age.age = 7;
   printf( "Age.age : %d\n", Age.age );

   Age.age = 8;
   printf( "Age.age : %d\n", Age.age );

   return 0;
}
```

当上面的代码被编译时，它会带有警告，当上面的代码被执行时，它会产生下列结果：

```
Sizeof( Age ) : 4
Age.age : 4
Age.age : 7
Age.age : 0
```



## typedef

C 语言提供了 **typedef** 关键字，您可以使用它来为类型取一个新的名字。

例如，您可以对结构体使用 typedef 来定义一个新的数据类型，然后使用这个新的数据类型来直接定义结构变量，如下：

```c
#include <stdio.h>
#include <string.h>
 
typedef struct Books
{
   char  title[50];
   char  author[50];
   char  subject[100];
   int   book_id;
} Book;
 
int main( )
{
   Book book;
 
   strcpy( book.title, "C Programming");
   strcpy( book.author, "Nuha Ali"); 
   strcpy( book.subject, "C Programming Tutorial");
   book.book_id = 6495407;
 
   printf( "Book title : %s\n", book.title);
   printf( "Book author : %s\n", book.author);
   printf( "Book subject : %s\n", book.subject);
   printf( "Book book_id : %d\n", book.book_id);

   return 0;
}
```

**#define** 是 C 指令，用于为各种数据类型定义别名，与 **typedef** 类似，但是它们有以下几点不同：

- **typedef** 仅限于为类型定义符号名称，**#define** 不仅可以为类型定义别名，也能为数值定义别名，比如您可以定义 1 为 ONE。
- **typedef** 是由编译器执行解释的，**#define** 语句是由预编译器进行处理的。



## 文件读写



### 1.打开文件

您可以使用 **fopen( )** 函数来创建一个新的文件或者打开一个已有的文件，这个调用会初始化类型 **FILE** 的一个对象，类型 **FILE** 包含了所有用来控制流的必要的信息。下面是这个函数调用的原型：

```
FILE *fopen( const char * filename, const char * mode );
```

在这里，**filename** 是字符串，用来命名文件，访问模式 **mode** 的值可以是下列值中的一个：

| 模式 | 描述                                                         |
| :--- | :----------------------------------------------------------- |
| r    | 打开一个已有的文本文件，允许读取文件。                       |
| w    | 打开一个文本文件，允许写入文件。如果文件不存在，则会创建一个新文件。在这里，您的程序会从文件的开头写入内容。 |
| a    | 打开一个文本文件，以追加模式写入文件。如果文件不存在，则会创建一个新文件。在这里，您的程序会在已有的文件内容中追加内容。 |
| r+   | 打开一个文本文件，允许读写文件。                             |
| w+   | 打开一个文本文件，允许读写文件。如果文件已存在，则文件会被截断为零长度，如果文件不存在，则会创建一个新文件。 |
| a+   | 打开一个文本文件，允许读写文件。如果文件不存在，则会创建一个新文件。读取会从文件的开头开始，写入则只能是追加模式。 |

如果处理的是二进制文件，则需使用下面的访问模式来取代上面的访问模式：

```
"rb", "wb", "ab", "rb+", "r+b", "wb+", "w+b", "ab+", "a+b"
```



### 2.关闭文件

为了关闭文件，请使用fclose()函数。函数原形如下：

```c
int fclose(FILE *fp);
```

如果成功关闭文件，**fclose( )** 函数返回零，如果关闭文件时发生错误，函数返回 **EOF**。这个函数实际上，会清空缓冲区中的数据，关闭文件，并释放用于该文件的所有内存。EOF 是一个定义在头文件 **stdio.h** 中的常量。

C 标准库提供了各种函数来按字符或者以固定长度字符串的形式读写文件。



### 3.写入文件

下面是把字符写入到流中最简单的函数：

```c
int fputc(int c, FILE *fp);
```

函数 **fputc()** 把参数 c 的字符值写入到 fp 所指向的输出流中。如果写入成功，它会返回写入的字符，如果发生错误，则会返回 **EOF**。您可以使用下面的函数来把一个以 null 结尾的字符串写入到流中：

```c
int fputs( const char *s, FILE *fp );
```

