#include <iostream>
#include <stdlib.h>

typedef int Event;
enum States {OFF, ON, ACTIVE};
#define Ignite 1
#define Engage_G 2
#define Engage_HB 3
#define Disengage_G 4
#define Disengage_HB 5
#define Failure 6

class CarMotor {
public:
  CarMotor(){};
};

class MotorControl {
public:
  MotorControl(CarMotor* M)
  {
    std::cout << "Control object created and initialized to state OFF"<< '\n';
    MyMotor = M;
    currentState = OFF;
    gear=0;
    hBrake=1;
  };
  void error_msg()
  {
    std::cout << "Event unknown or not supported at current state!"<< '\n'; 
  }
  void handleEvent(Event event)
  {
    std::cout << "Handler triggered"<< '\n';
    key = rand() % 2;
    switch (currentState) {
      case OFF: 
        if(event==Ignite && key==1) { ignition(); }
        else if(event==Ignite && key==0) { std::cout << "Wrong key! Ignition not triggered" << '\n'; }
        else { error_msg(); }
        break;
      case ON: 
        if(event==Engage_G && gear==0) { engaging_G(); }
        else if(event==Disengage_HB && hBrake==1) { disengaging_HB(); }
        else if(event==Failure) {failure();}
        else { error_msg(); }
        break; 
      case ACTIVE: 
        if(event==Disengage_G && gear==1) { disengaging_G(); }
        else if(event==Engage_HB && hBrake==0) { engaging_HB(); }
        else if(event==Failure) {failure();}
        else { error_msg(); }
        break;
      default:
        error_msg();
        break;
    }
  };

private:
  States currentState;
  CarMotor* MyMotor;
  int gear;
  int hBrake;
  int key;
  void ignition(){ currentState=ON;   std::cout << "Ignition triggered"<< '\n'; };
  void engaging_HB(){currentState=ON; hBrake=1;   std::cout << " HBrake engaged"<< '\n';};
  void engaging_G(){currentState=ACTIVE; gear=1;  std::cout << "Gear engaged"<< '\n';};
  void disengaging_HB(){currentState=ACTIVE; hBrake=0;   std::cout << "HBrake released"<< '\n';};
  void disengaging_G(){currentState=ON; gear=0;  std::cout << "Gear disengaged"<< '\n';};
  void failure(){currentState=OFF;   std::cout << "engine failure!!"<< '\n';}; 

};

int readEvent()
{
  int e;
  std::cout << "Choose an event!"<< '\n';
  std::cout << "1 for Ignite, 2 for Engage_Gear, 3 for Engage_HandBrake, 4 for Disengage_Gear; 5 for Disengage_Handbrake, 6 for engine failure "<< '\n';
  std::cin >> e;
  return e;
}

int main() {
  std::cout << "System starting"<< '\n';
  CarMotor motor;
  MotorControl mControl(&motor);
  Event event;

  while (true) { 
    event = readEvent();
    mControl.handleEvent(event);
  }    
  return 0;
}
// online compiler https://www.programiz.com/cpp-programming/online-compiler/