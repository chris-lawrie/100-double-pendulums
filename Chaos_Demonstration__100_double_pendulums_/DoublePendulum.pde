class DoublePendulum{
  float r1 = 200;   // length of first pendulum
  float r2 = 200;   // length of second pendulum
  float m1 = 40;    // mass of first pendulum excluding weight of string
  float m2 = 40;    // mass of second pendulum excluding weight of string
  float a1 = PI/2;  // angle formed by first pendulum and normal - angle1
  float a2;  //angle formed by second pendulum and normal - angle2
  float a1_v = 0;   //angular velocity of pendulum1
  float a2_v = 0;   //angular velocity of pendulum2
  float g = 0.5;    //gravitational constant (realistic value not considered for simplicity )
  float cx, cy;     //centre of x and y for background
  float R,G,B;      //colours

  float angle = 0; 
  
  
  DoublePendulum(int _a, int _num, float diff, int _cx, int _cy){
    cx = _cx;
    cy = _cy; 
    stroke(255); 
    a2 = map(_a, 1, _num, 3*PI/4, 3*PI/4 + diff);
    
    R = map(_a, 1, _num, 255, 0);
    G = map(_a, 1, _num, 0, 255);
    B = map(_a, 1, _num, 150, 255);
  }
 

  void display() {  
  // numerators are moduled 
  float num1 = -g * (2 * m1 + m2) * sin(a1);
  float num2 = -m2 * g * sin(a1-2*a2);
  float num3 = -2*sin(a1-a2)*m2;
  float num4 = a2_v*a2_v*r2+a1_v*a1_v*r1*cos(a1-a2);
  float den = r1 * (2*m1+m2-m2*cos(2*a1-2*a2));
  float a1_a = (num1 + num2 + num3*num4) / den;

  num1 = 2 * sin(a1-a2);
  num2 = (a1_v*a1_v*r1*(m1+m2));
  num3 = g * (m1 + m2) * cos(a1);
  num4 = a2_v*a2_v*r2*m2*cos(a1-a2);
  den = r2 * (2*m1+m2-m2*cos(2*a1-2*a2));
  float a2_a = (num1*(num2+num3+num4)) / den;

  stroke(R, G, B);
  strokeWeight(2);

  float x1 = r1 * sin(a1);
  float y1 = r1 * cos(a1);

  float x2 = x1 + r2 * sin(a2);
  float y2 = y1 + r2 * cos(a2);
  
  //stroke(255);   
  translate(cx, cy); 
  line(0, 0, x1, y1);
  line(x1, y1, x2, y2);
  translate(-cx,-cy);
  
  a1_v += a1_a;
  a2_v += a2_a;
  a1 += a1_v;
  a2 += a2_v;
  }
}
