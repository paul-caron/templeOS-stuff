
U0 Fibonaci(U64 limit=1000000){
  U64 a=0;
  U64 b=1;
  U64 temp=0;
  while(a<limit){
    "%d\n",a ;
    temp = a + b;
    a = b;
    b = temp;
  }  
}

Fibonaci;
