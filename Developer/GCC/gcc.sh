GCC-> 
    GNU Compiler Collection                  GNU GPL---> 
============================================================
		
1.预处理-Pre-Processing
		gcc  -E  test.c  -o  test.i	# .i文件
2.编译-Compiling
		gcc  -S  test.i  -o   test.s	# .s文件
3.汇编-Assembling
		gcc  -c  test.s  -o  test.o	# .o文件
4.链接-Linking
		gcc  test.o  -o  test		# .bin文件
	
============================================================


-E		# 选项指示编译器仅对输入文件进行预处理
-S		# 编译选项告诉 GCC 在为 C 代码产生了汇编语言文件后停止编译


-c		#编译，不链接。.c--->.o
-o		#指定输出文件名。default: a.out

________________________________________________________
-O		# 对程序进行优化编译、链接，采用这个选项，
		# 整个源代码会在编译、链接过程中进行优化处理
		# -O 主要进行跳转和延迟退栈两种优化；
		# -O0表示不做优化
		# -O1为默认优化
		# -O2除了完成-O1的优化之外，还进行一些额外的调整工作，如指令调整等
		# -O3则包括循环展开和其他一些与处理特性相关的优化工作
---------------------------------------------------------------------
-g		#选项告诉 GCC 产生能被 GNU 调试器使用的调试信息以便调试你的程序。
		#GCC 提供了一个很多其他 C 编译器里没有的特性, 在 GCC 里你能使-g 和 -O(产生优化代码)联用
-pg		#选项告诉 GCC 在编译好的程序里加入额外的代码。
		#运行程序时, 产生 gprof 用的剖析信息以显示你的程序的耗时情况。
# Libraies
-l参数和-L参数
-l参数就是用来指定程序要链接的库，-l参数紧接着就是库名
就拿数学库来说，他的库名是m，他的库文件名是libm.so，很容易看出，把库文件名的头lib和尾.so去掉就是库名 了
gcc  xxx.c  -lm( 动态数学库)
	
好了现在我们知道怎么得到库名了，比如我们自已要用到一个第三方提供的库名字叫libtest.so，
那么我们只要把 libtest.so拷贝到 /usr/lib里，编译时加上-ltest参数，我们就能用上libtest.so库了
dd
（当然要用libtest.so库里的函数，我们还 需要与 libtest.so配套的头文件）。

#Libraries 库文件路经参数设定
放在/lib和/usr/lib和/usr/local/lib里的库直接用-l参数就能链接了，
但如果库文件没放在这三个目录里，而是放在其他目录里， 这时我们只用-l参数的话，链接还是会出错，
出错信息大概是：“/usr/bin/ld: cannot find-lxxx”，也就是链接 程序ld在那3个目录里找不到libxxx.so，
这时另外一个参数-L就派上用场了，比如常用的X11的库 ，它放在/usr/X11R6/lib目录 下，
我们编译时就要用-L/usr/X11R6/lib -lX11参数，-L参数跟着的是库文件所在的目录名。
再比如我们把libtest.so放在/aaa/bbb/ccc目录下，那链接参数就是-L/aaa/bbb/ccc -ltest

# libraries links
另外，大部分libxxxx.so只是一个链接，以RH9为例，
比如libm.so它链接到/lib/libm.so.x，/lib/libm.so.6 又链接到/lib/libm-2.3.2.so，
如果没有这样的链接，还是会出错，因为ld只会找libxxxx.so，所以如果你要用到xxxx库，
而只有libxxxx.so.x或者libxxxx-x.x.x.so，做一个链接就可以了ln -s libxxxx-x.x.x.so libxxxx.so

手工来写链接参数总是很麻烦的，
还好很多库开发包提供了生成链接参数的程序，
名字一般叫xxxx-config，一般放在/usr/bin目录下，
比如 gtk1.2的链接参数生成程序是gtk-config，
执行gtk-config –libs就能得到以下输出
”-L/usr/lib -L/usr/X11R6/lib -lgtk -lgdk -rdynamic -lgmodule -lglib -ldl -lXi -lXext -lX11 -lm”，
这就是编译一个gtk1.2程序所需的gtk链接参数，
xxx-config除了–libs参数外还有一个参数是–cflags用来生成头文件包含目录的，
也就是-I参数，在下面我们将会讲到。你可以试试执行gtk-config –libs –cflags，看看输出结果。

现在的问题就是怎样用这些输出结果了，最笨的方法就是复制粘贴或者照抄，
聪明的办法是在编译命令行里加入这个xxxx-config --libs --cflags，
比如编译一个gtk程序：
	gcc gtktest.c `gtk-config --libs --cflags`
	这样就差不多了。注意`不是单引号，而是1键左边那个键。

除了xxx-config以外，现在新的开发包一般都用pkg-config来生成链接参数，使用方法跟xxx-config类似，
但xxx-config是针对特定的开发包，但pkg-config包含很多开发包的链接参数的生成，
用pkg-config –list-all命令可以列出所支持的所有开发包，
pkg-config的用法就是pkg-config pagName –libs –cflags，
其中pagName是包名，是pkg-config–list-all里列出名单中的一个，
比如gtk1.2的名字就是gtk+， pkg-config gtk+ –libs –cflags的作用跟gtk-config –libs –cflags是一样的。
比如：
	gcc gtktest.c `pkg-config gtk+ --libs --cflags`


# -include和-I参数
-include用来包含头文件，但一般情况下包含头文件都在源码里用＃i nclude xxxxxx实现，-include参数很少用。
-I参数是用来指定头文件目录，/usr/include目录一般是不用指定的，gcc知道去那里找，
但 是如果头文件不在/usr/icnclude里我们就要用-I参数指定了，比如头文件放在/myinclude目录里，
那编译命令行就要加上-I/myinclude 参数了，如果不加你会得到一个”xxxx.h: No such file or directory”的错误。
-I参数可以用相对路径，比如头文件在当前 目录，可以用-I.来指定。
上面我们提到的–cflags参数就是用来生成-I参数的

# -Wall、-w 和 -v参数

 -Wall 打印出gcc提供的警告信息

 -w     关闭所有警告信息

 -v      列出所有编译步骤
============================================================
关于交叉编译

交叉编译通俗地讲就是在一种平台上编译出能运行在体系结构不同的另一种平台上，
比如在我们地PC平台(X86 CPU)上编译出能运行在arm CPU平台上的程序，
编译得到的程序在X86 CPU平台上是不能运行的，必须放到arm CPU 平台上才能运行。
当然两个平台用的都是linux。这种方法在异平台移植和嵌入式开发时用得非常普遍。
相对与交叉编译，我们平常做的编译就叫本地编译，也 就是在当前平台编译，编译得到的程序也是在本地执行。
用来编译这种程序的编译器就叫交叉编译器，相对来说，用来做本地编译的就叫本地编译器，一般用的都是gcc，
但这种gcc跟本地的gcc编译器是不一样的，需要在编译gcc时用特定的configure参数才能得到支持交叉编译的gcc。
为了不 跟本地编译器混淆，交叉编译器的名字一般都有前缀，
比如armc-xxxx-linux-gnu-gcc，arm-xxxx-linux-gnu- g++ 等等 交叉编译器的使用方法

使用方法跟本地的gcc差不多，但有一点特殊的是：
必须用-L和-I参数指定编译器用arm系统的库和头文件，不能用本地(X86)的库（头文件有时可以用本地的）
gcc [-c | -S | -E] [-std=standard]

       [-g] [-pg] [-Olevel]

       [-Wwarn...] [-pedantic]

       [-Idir...] [-Ldir...]

       [-Dmacro[=defn]...] [-Umacro]

       [-foption...] [-mmachine-option...]

       [-o outfile] infile...



GDB_Debug
===========================================================
GDB程序调试：
list			#查看程序
break 函数名		#在某函数的入口设定断点
break 行号		#在指定行添加断点

# libraries linksbreak 文件名： 行号	#在指定文件的指定行添加断点
break 行号 if 条件 	#当条件为真时，指定行号处断点生效

info break		#查看断点
delete			#删除断点
run			#开始运行程序
next			#单步运行程序，不进入子函数
step			#单步运行程序，进入子函数
continue		#继续运行程序
print 变量名		#查看指定变量的值
finish			#运行程序，直到当前函数结束
quit			#推出GDB

ulimit -c 1024		#文件转存

whereis gdb




ubuntu开机打印信息： dmesg
========================================================================
sudo vi /etc/default/grub

注释掉下面一行
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
sudo update-grub
然后重启系统即可。




---------------------------------------------------------flash_player--->
解压下载的压缩文件 flash_player_npapi_linux.x86_64.tar.gz
$ mkdir FirefoxFlashPlayer
$ tar zxvf flash_player_npapi_linux.x86_64.tar.gz -C FirefoxFlashPlayer
安装或更新 Firefox Flash Player
$ sudo cp FirefoxFlashPlayer/libflashplayer.so /usr/lib/mozilla/plugins/
$ mkdir ~/.mozilla/plugins
$ sudo cp FirefoxFlashPlayer/libflashplayer.so ~/.mozilla/plugins/
如果网络播放器黑屏，无法播放视频，则需要放宽 SELinux 对网页外挂程序的限制，
需要执行如下命令，以关闭SELinux对Firefox插件的控制。
$ sudo setsebool -P unconfined_mozilla_plugin_transition 0
------------------------------------------------------------------------------





