#include <reg51.h>
#define uint unsiged int
#define uchar unsiged char

uchar count, key_num;
uchar year=18, month=11, day=01, hour=20, minute=10, second=22, week=2;

void key_scan()
{
	if (key_func == 0)	//key_func为功能按键，如果等于 0，则表示此功能按键被按下，将会执行下面的操作
	{
		delay_ms(10);
		while (!Key_func);	//按键消抖
		TR0 = 0;		//关闭定时器
		key_num++;		//记录 key_func功能按键被按下的次数
		
		/* 选择光标要闪烁的地址 */
		switch (key_num)
		{
			case 1:
			write_com(0x0f);	//光标闪烁
			write_com(0x80+0x40+11);//给出光标闪烁地址
			break;
			
			case 2:
			write_com(0x80+0x40+8);
			break;
			
			case 3:
			write_com(0x80+0x40+5);
			break;
			
			case 4:
			write_com(0x80+13);
			break;
			
			case 5:
			write_com(0x80+11);
			break;
			
			case 6:
			write_com(0x80+8);
			break;
			
			case 7:
			write_com(0x80+5);
			break;
			
			case 8:
			key_num = 0;
			TR0 = 1;	//打开定时器
			write_com(0x0c);//关闭光标闪烁
			break;
			
		}
		
	}
	if (key_num != 0)
	{
		if (key_jia == 0)
		{
			delay_ms(10);
			while (!key_jia);
			switch (key_num)
			{
				case 1:
				second++;
				if (second == 60)
					second = 0;
				write_HMS(11, second);
				write_com(0x80+0x40+11); //把自动移动的光标自动拉回来
			}
		}
	}
}


void main(void)
{
	init_1602();
	TMOD = 0x01;	//设定定时器0工作在模式1
	TH0  = (65536-50000)/256;	//装入初值
	THL  = (65536-50000)%256;	//装入初值
	EA   = 1;	//打开总中断
	ET0  = 1;	//打开定时器0
	TR0  = 1;	//启动定时器
	
	while (1);
	{
	  key_scan();
	  if (key_num == 0)
	  {
		if (count == 20)
		{
			count = 0;
			second++;
			if (second == 60)
			{
				second = 0x00;
				minute++;
				if (minute == 60)
				{
					minute = 0x00;
					hour++;
					if (hour == 24)
					{
						hour = 0x00;
						day++;
						week++;
						if (week == 8)
							week = 1;
						if (day == 31)
						{
							day = 0x00;
							month++;
							if (month == 13)
							{
								month = 0x01;
								year++;
								if (year == 100)
								{
									year = 0x00;
								}
								write_YMD(4, year);
							}
							write_YMD(7, month);
						}
						write_YMD(week);
						write_YMD(10, day);
					}
					write_HMS(5, hour);
				}
				write_HMS(8, minute);
			}
			write_HMS(11, second);
		}
	  }
	}
	
}

/* 写星期函数 */
void write_week(uchar dat)
{
	write_com(0x80+13);
	if (dat == 1)
		write_zfc("Mon");
	if (dat == 2)
		write_zfc("Tue");
	if (dat == 3)
		write_zfc("Wen");
	if (dat == 4)
		write_zfc("Tth");
	if (dat == 5)
		write_zfc("Fri");
	if (dat == 6)
		write_zfc("Sat");
	if (dat == 7)
		write_zfc("Sun");
		
}



void timer0() interrupt 1
{
	TH0  = (65536-50000)/256;	//重新装入初值
	THL  = (65536-50000)%256;	//重新装入初值
	count++;
}

/* 写年月日函数 */
void write_YMD(uchar addr, uchar dat)	
{
	uchar shi, ge;
	shi = dat/10;
	ge  = dat%10;
	write_com(0x80+addr);
	write_dat(0x30+shi);
	write_dat(0x30+ge);
	
}


/* 写时分秒函数 */
void write_HMS(uchar addr, uchar dat)	
{
	uchar shi, ge;
	shi = dat/10;
	ge  = dat%10;
	write_com(0x80+0x40+addr);
	write_dat(0x30+shi);
	write_dat(0x30+ge);
	
}

/* 写字符串函数 */
void write_string(uchar *ch)	
{
	while (*ch != 0)
	write_dat(*ch++);
}

/* LCD1602 初始化函数 */
void init_1602(void)		
{
	write_com(0x38);
	delay_ms(1);
	write_com(0x0C);
	delay_ms(1);
	write_com(0x06);
	delay_ms(1);
	write_com(0x01);
	delay_ms(1);
	
	write_com(0x80);
	write_string("  20  -  -  ");
	
	write_com(0x80+0x40+5);
	write_string("  ：  ：  ");
	
	write_YMD(4, year);
	write_YMD(7, month);
	write_YMD(10, day);
	write_HMS(5, hour);
	write_HMS(8, minute);
	write_HMS(11, second);
	
	write_YMD(week);
}

/* LCD1602写命令函数 */
void write_com(uchar com)
{
	RS = 0;
	RW = 0;
	EN = 0;
	P0 = com;
	delay_ms(2);
	EN = 1;
	delay_ms(5);
	EN = 0;
	delay_ms(2);
}

/* LCD1602写数据函数 */
void write_dat(uchar dat)
{
	RS = 1;
	RW = 0;
	EN = 0;
	P0 = dat;
	delay_ms(2);
	EN = 1;
	delay_ms(5);
	EN = 0;
	delay_ms(2);
}

/* 毫秒级延时函数 */
void delay_ms(uint z)
{
	int x, y;
	for (x = z; x > 0; x--)
		for (y = 110; y > 0; y--);
}



