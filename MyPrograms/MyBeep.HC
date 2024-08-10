U0 playBeep(U64 freq){
  U32 Div;
  U64 tmp;

  //set pit to desired freq
  Div = 1193180 / freq ;
  OutU8(0x43, 0xb6);
  OutU8(0x42, Div & 0xFF);
  OutU8(0x42, (Div&0xFF00)/256);

  //play
  tmp = InU8(0x61) & 0xFF;
  if(tmp != (tmp | 3)) {
    OutU8(0x61, (tmp | 3));
  }
}

U0 stopBeep(){
  U64 tmp = InU8(0x61) & 0xFC;
  OutU8(0x61, tmp);
}


//freq in Hz and duration in ms
public U0 MyBeep(U64 freq, U64 duration){
  playBeep(freq);
  Sleep(duration);
  stopBeep;
}

