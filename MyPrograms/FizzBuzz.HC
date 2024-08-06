U0 FizzBuzz(U64 n){
  if( ((n%3)==0) && ((n%5)==0)){
    "%d - FizzBuzz\n",n ;
  }else if( (n%3)==0 ){
    "%d - Fizz\n",n ;
  }else if( (n%5)==0 ){
    "%d - Buzz\n",n ;
  }else{
    "%d\n",n ;
  }
}


U0 FizzBuzzMain(){
  U32 i = 0;
  for(i=0;i<100;i++){
    FizzBuzz(i);
  }
}

FizzBuzzMain;