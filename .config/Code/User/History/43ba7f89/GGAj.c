#define  cdecl __attribute__((cdecl))
int cdecl sum(int a, int b)
{
    return a + b;
}