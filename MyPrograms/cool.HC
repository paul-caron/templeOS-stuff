I64 transform [4][4];
I64 w = 200;

U0 DrawIt(CTask *, CDC * dc){
  I64 * old_r = dc->r;

  dc->flags |= DCF_TRANSFORMATION;
  DCMat4x4Set(dc, transform);

  GrLine3(dc, 0, 0, 0, w, 0, 0);
  GrLine3(dc, 0, w, 0, w, w, 0);
  GrLine3(dc, 0, 0, 0, 0, w, 0);
  GrLine3(dc, w, 0, 0, w, w, 0);

  GrLine3(dc, 0, 0, -w, w, 0, -w);
  GrLine3(dc, 0, w, -w, w, w, -w);
  GrLine3(dc, 0, 0, -w, 0, w, -w);
  GrLine3(dc, w, 0, -w, w, w, -w);

  GrLine3(dc, 0, 0, 0, 0, 0, -w);
  GrLine3(dc, w, 0, 0, w, 0, -w);
  GrLine3(dc, 0, w, 0, 0, w, -w);
  GrLine3(dc, w, w, 0, w, w, -w);

  dc->r = old_r;
}

class Point{
  I64 x;
  I64 y;
  I64 z;
};

U0 SetRotationOrigin(Point * p){
  Mat4x4TranslationAdd(transform, -p->x, -p->y, -p->z);
}

U0 UnsetRotationOrigin(Point * p){
  Mat4x4TranslationAdd(transform, p->x, p->y, p->z);
}

U0 Main(){
  F64 theta=0;  
  Point * origin = MAlloc(sizeof(Point));
  origin->x = w/2;
  origin->y = w/2;
  origin->z = -w/2;
  SettingsPush;
  DocClear;
  Fs->draw_it=&DrawIt;
  while(!ScanChar){
    Mat4x4IdentEqu(transform);
    SetRotationOrigin(origin);
    Mat4x4RotZ(transform, theta);
    Mat4x4RotX(transform, theta/2);
    UnsetRotationOrigin(origin);
    Mat4x4TranslationAdd(transform, 200, 100, 0);    
    theta += 2*pi/180;
    Sleep(20);
  }
  DocClear;
  SettingsPop;
  Free(origin);
}

Main;





