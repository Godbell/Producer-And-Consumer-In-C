# MyShell Project by. 12191579 김종하

# 개발 환경

## cat /proc/cpuinfo

```bash
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 158
model name      : Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz
stepping        : 10
microcode       : 0xffffffff
cpu MHz         : 3192.000
cache size      : 256 KB
physical id     : 0
siblings        : 12
core id         : 0
cpu cores       : 6
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 6
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 
clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm pni pclmulqdq 
dtes64 est tm2 ssse3 fma cx16 xtpr pdcm pcid sse4_1 sse4_2 movbe popcnt aes xsave osxsave 
avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch fsgsbase tsc_adjust bmi1 hle avx2 smep 
bmi2 erms invpcid rtm mpx rdseed adx smap clflushopt ibrs ibpb stibp ssbd
bogomips        : 6384.00
clflush size    : 64
cache_alignment : 64
address sizes   : 36 bits physical, 48 bits virtual
power management:
...
```

## cat /proc/

```bash
godbell@DESKTOP-FF5KMP4:/mnt/e/Programming/4_C/MyShell$ cat /proc/meminfo
MemTotal:       16714084 kB
MemFree:         8845844 kB
Buffers:           34032 kB
Cached:           188576 kB
SwapCached:            0 kB
Active:           167556 kB
Inactive:         157876 kB
Active(anon):     103104 kB
Inactive(anon):    17440 kB
Active(file):      64452 kB
Inactive(file):   140436 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:      50331648 kB
SwapFree:       49148596 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:        102824 kB
Mapped:            71404 kB
Shmem:             17720 kB
Slab:              13868 kB
SReclaimable:       6744 kB
SUnreclaim:         7124 kB
KernelStack:        2848 kB
PageTables:         2524 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:      515524 kB
Committed_AS:    3450064 kB
VmallocTotal:     122880 kB
VmallocUsed:       21296 kB
VmallocChunk:      66044 kB
HardwareCorrupted:     0 kB
AnonHugePages:      2048 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
DirectMap4k:       12280 kB
DirectMap4M:      897024 kB
```

## cat /proc/version

```bash
godbell@DESKTOP-FF5KMP4:/mnt/e/Programming/4_C/MyShell$ cat /proc/version
Linux version 4.4.0-19041-Microsoft (Microsoft@Microsoft.com) (gcc version 5.4.0 (GCC) 
) #488-Microsoft Mon Sep 01 13:43:00 PST 2020
```

## gdb 설치

![MyShell%20Project%20by%2012191579%20%E1%84%80%E1%85%B5%E1%86%B7%E1%84%8C%E1%85%A9%E1%86%BC%E1%84%92%E1%85%A1%203d46cdffd0044d8593c01b161b4007d3/gdb_install.png](MyShell%20Project%20by%2012191579%20%E1%84%80%E1%85%B5%E1%86%B7%E1%84%8C%E1%85%A9%E1%86%BC%E1%84%92%E1%85%A1%203d46cdffd0044d8593c01b161b4007d3/gdb_install.png)

# 쉘 프로그램 설계

```c
#define COMMAND_MEM 10               // 명령어 history 저장 수
#define COMMAND_MAX 1024             // 명령어 최대 입력 길이
#define TOKEN_MAX 512                // 명령어 토큰의 최대 개수

typedef struct comrec_t comrec_t;    // 명령어를 표현하는 자료형 선언
struct comrec_t                      // 해당 자료형은 본 구조체를 사용
{
    char input_command[COMMAND_MAX]; // 입력한 명령어 string
    char* tokenized[TOKEN_MAX];      // tokenize() 함수로 토큰화된 명령어 배열
    bool is_background;              // 백그라운드 실행(&) 여부
};
void tokenize(comrec_t* self);       // 명령어를 토큰화하는 함수
void execute(comrec_t* self);        // UNIX 명령어를 실행하는 함수
```

## Main (Command input & Built-In Commands Execution)

파란색 폰트는 요약 혹은 설명을 표기한 부분을 의미합니다.

```c
int main()
{
		크기가 10인 배열을 생성, 해당 배열은 입력한 Command의 기록을 10개까지 저장
		배열의 왼쪽 끝과 오른쪽 끝을 표시하는 cursor를 두어 1차원 배열로 circular queue
		를 구현

    while (true)
    {
				12191579_shell$ 출력 후 명령어 입력 대기
 
        if (Built-In 명령어1)
				{
						실행 내용
        }
				else if (Built-In 명령어2)
				{
						실행 내용
        }
				...
        else { 
						UNIX 명령어
						Tokenize한 후 실행
        }

        cursor 값 변경
    }
}
```

## Tokenizer

```c
void tokenize(comrec_t* self)
{
    for (int i = COMMAND_MAX - 1 ; i >= 0 ; i--)
    {
        명령어 string을 검사
				
				1. 명령어 끝에 &가 존재하면 공백으로 바꾼 뒤 background 실행 여부를 참으로 변경
				2. fgets로 포함된 개행 문자 제거
    }

    strtok 함수를 사용해 명령어 string 토큰화, 구조체 self의 tokenized 배열에 저장
}
```

## UNIX Command Execution

```c
void execute(comrec_t* self)
{
    if ((pid = fork()) < 0)
    {
        fork 실패 시 오류 메시지 출력
    }
    else if (pid == 0)
    {
        자식 process
				execvp 함수를 통해 토큰화된 명령 실행
    }
    else
    {
        부모 process
				background 
				wait system call을 사용해 자식 process 종료 대기 
    }
}
```

# 동작 과정

![MyShell%20Project%20by%2012191579%20%E1%84%80%E1%85%B5%E1%86%B7%E1%84%8C%E1%85%A9%E1%86%BC%E1%84%92%E1%85%A1%203d46cdffd0044d8593c01b161b4007d3/make.png](MyShell%20Project%20by%2012191579%20%E1%84%80%E1%85%B5%E1%86%B7%E1%84%8C%E1%85%A9%E1%86%BC%E1%84%92%E1%85%A1%203d46cdffd0044d8593c01b161b4007d3/make.png)

make 과정

![MyShell%20Project%20by%2012191579%20%E1%84%80%E1%85%B5%E1%86%B7%E1%84%8C%E1%85%A9%E1%86%BC%E1%84%92%E1%85%A1%203d46cdffd0044d8593c01b161b4007d3.png](MyShell%20Project%20by%2012191579%20%E1%84%80%E1%85%B5%E1%86%B7%E1%84%8C%E1%85%A9%E1%86%BC%E1%84%92%E1%85%A1%203d46cdffd0044d8593c01b161b4007d3.png)

ls, ls &, help, history, quit을 실행한 모습

```diff
gdb shell 실행

godbell@DESKTOP-FF5KMP4:/mnt/e/Programming/4_C/MyShell$ gdb shell.exe
GNU gdb (Ubuntu 8.1-0ubuntu3) 8.1.0.20180409-git
Copyright (C) 2018 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from shell.exe...done.

b 명령어를 통해 tokenize 함수와 execute에 breakpoint 추가

(gdb) b tokenize
Breakpoint 1 at 0xe40: file main.c, line 128.
(gdb) b execute
Breakpoint 2 at 0xf79: file main.c, line 158.

다음 breakpoint(tokenize 함수)까지 실행

(gdb) c
The program is not being run.
(gdb) r
ls -l 명령어 입력, 이후 tokenize 함수 호출까지 실행됨
Starting program: /mnt/e/Programming/4_C/MyShell/shell.exe
12191579_shell$ ls -l
Breakpoint 1, tokenize (self=0x7ffffffe1190) at main.c:128
128     {

info b 명령어를 통해 breakpoint 정보 조회

(gdb) info b
Num     Type           Disp Enb Address            What
1       breakpoint     keep y   0x0000000008000e40 in tokenize at main.c:128
        breakpoint already hit 1 time
2       breakpoint     keep y   0x0000000008000f79 in execute at main.c:158
(gdb) n
130         strncpy(org_str, self->input_command, COMMAND_MAX);
(gdb) p org_str
$1 = '\000' <repeats 409 times>...
(gdb) p self->input_command
$2 = "ls -l\n", '\000' <repeats 1017 times>
(gdb) n
132         for (int i = COMMAND_MAX - 2 ; i >= 0 ; i--)
(gdb) p org_str
$3 = "ls -l\n", '\000' <repeats 1017 times>
(gdb) n
134             if (org_str[i] == '&')
(gdb) n
141             if (org_str[i] == '\n')
(gdb) n
132         for (int i = COMMAND_MAX - 2 ; i >= 0 ; i--)
(gdb) n
134             if (org_str[i] == '&')

main에서 호출된 tokenize 함수 실행 중이므로 stack trace는 다음과 같음

(gdb) bt
#0  tokenize (self=0x7ffffffe1190) at main.c:134
#1  0x0000000008000d83 in main () at main.c:94

c 명령어를 통해 다음 breakpoint까지 실행

(gdb) c
Continuing.

토큰화된 ls -l 명령어를 실행하기 위해 execute 함수 호출

Breakpoint 2, execute (self=0x7ffffffe1190) at main.c:158
158     {
(gdb) info b
Num     Type           Disp Enb Address            What
1       breakpoint     keep y   0x0000000008000e40 in tokenize at main.c:128
        breakpoint already hit 1 time
2       breakpoint     keep y   0x0000000008000f79 in execute at main.c:158
        breakpoint already hit 1 time
(gdb) n
fork 후 pid 검사
162         if ((pid = fork()) < 0)
(gdb) n
pid == 0임을 확인
166         else if (pid == 0)
execvp로 ls -l이 실행된 모습
(gdb) total 69
-rwxrwxrwx 1 godbell godbell   113 May  7 11:18  CMakeLists.txt
-rwxrwxrwx 1 godbell godbell   323 May  5 14:41  Makefile
-rwxrwxrwx 1 godbell godbell 16800 May  7 12:58  a.out
drwxrwxrwx 1 godbell godbell   512 May  7 20:08  cmake-build-debug
drwxrwxrwx 1 godbell godbell   512 May  3 07:30  env_root
-rwxrwxrwx 1 godbell godbell   620 May  7 18:12  help
-rwxrwxrwx 1 godbell godbell  4515 May  7 20:10  main.c
-rwxrwxrwx 1 godbell godbell 11256 May  7 20:10  main.o
-rwxrwxrwx 1 godbell godbell  6832 May  3 07:20 'man csh.md'
-rwxrwxrwx 1 godbell godbell 16912 May  7 20:10  shell.exe
n
background 호출인지 검사
173             if (self->is_background == false)
(gdb) n
background 호출이 아니므로 자식 process가 종료하길 기다림
175                 pid = wait(&cur_state);
(gdb) n

line 73(built-in 명렁어 help 실행 부분)에 breakpoint 추가

179     }(gdb) b 73
Breakpoint 3 at 0x8000cd2: file main.c, line 73.
(gdb) c
Continuing.
12191579_shell$ help

Breakpoint 3, main () at main.c:73
매뉴얼 내용을 담은 help 파일을 읽기 모드로 불러옴
73                  FILE* helpFile = fopen("./help", "r");
(gdb) p helpFile
$4 = (FILE *) 0x0
(gdb) n
75                  if (helpFile != NULL)
(gdb) p helpFile
$5 = (FILE *) 0x8403680
(gdb) p *helpFile
$6 = {_flags = -72539000, _IO_read_ptr = 0x0, _IO_read_end = 0x0, _IO_read_base = 0x0, _IO_write_base = 0x0, _IO_write_ptr = 0x0,
  _IO_write_end = 0x0, _IO_buf_base = 0x0, _IO_buf_end = 0x0, _IO_save_base = 0x0, _IO_backup_base = 0x0, _IO_save_end = 0x0,
  _markers = 0x0, _chain = 0x7fffff3ec680 <_IO_2_1_stderr_>, _fileno = 3, _flags2 = 0, _old_offset = 0, _cur_column = 0,
  _vtable_offset = 0 '\000', _shortbuf = "", _lock = 0x8403760, _offset = -1, __pad1 = 0x0, __pad2 = 0x8403770, __pad3 = 0x0,
  __pad4 = 0x0, __pad5 = 0, _mode = 0, _unused2 = '\000' <repeats 19 times>}
(gdb) n
fgetc로 EOF가 불러와지기 전까지 문자를 받은 후 출력
77                      char ch = fgetc(helpFile);
(gdb) n
78                      while (ch != EOF)
(gdb) p ch
$7 = 49 '1'
(gdb) n
80                          printf("%c", ch);
(gdb) n
81                          ch = fgetc(helpFile);
(gdb) n
78                      while (ch != EOF)
(gdb) n
80                          printf("%c", ch);
(gdb) n
81                          ch = fgetc(helpFile);
(gdb) c
Continuing.
12191579SHELL(1)                          Inha Univ.                        12191579SHELL(1)

AUTHOR
     Inha Univ.
     Comp. Sci. Dept.
     12191579 Kim Jongha

DESCRIPTION
     This is a shell made by Kim Jongha, a Comp. Sci. soph. of Inha Univ., for the assignment
     of Operating System Course(004).

COMMANDS
     * UNIX Commands: ls, pwd, ...
        - & end of the UNIX commands will run it in background.
     * Built-In Commands
        - quit: terminate the shell and print the brief information.
        - history: prints recent 10 input commands
        - help: shows manual (this file)
quit 명령어 입력
12191579_shell$ quit
myshell developed by 김종하(12191579)
정상 종료
[Inferior 1 (process 23622) exited normally]
```

![MyShell%20Project%20by%2012191579%20%E1%84%80%E1%85%B5%E1%86%B7%E1%84%8C%E1%85%A9%E1%86%BC%E1%84%92%E1%85%A1%203d46cdffd0044d8593c01b161b4007d3/Untitled.png](MyShell%20Project%20by%2012191579%20%E1%84%80%E1%85%B5%E1%86%B7%E1%84%8C%E1%85%A9%E1%86%BC%E1%84%92%E1%85%A1%203d46cdffd0044d8593c01b161b4007d3/Untitled.png)

위 명령어의 스크린샷