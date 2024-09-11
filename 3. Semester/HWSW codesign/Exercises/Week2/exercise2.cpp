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

enum Active_States {IDLE, ACCELERATING, DECCELERATING};
#define Engage_Throttle 1
#define Disengage_Throttle 2
#define Engage_Brake 3
#define Disengage_Brake 4


int readEvent()
{
  int e;
  std::cout << "Choose a motor event!"<< '\n';
  std::cout << "1 for Ignite, 2 for Engage_Gear, 3 for Engage_HandBrake, 4 for Disengage_Gear; 5 for Disengage_Handbrake, 6 for engine failure "<< '\n';
  std::cin >> e;
  return e;
}

int readActiveEvent()
{
  int e;
  std::cout << "Choose an active event!"<< '\n';
  std::cout << "1 for Engage_Throttle, 2 for Engage_Brake, 3 for Disengage_Throttle; 4 for Disengage_Brake "<< '\n';
  std::cin >> e;
  return e;
}

class CarMotor {
public:
  CarMotor(){};
};

class Active {
public:
  Active(){
    std::cout << "Active control object created and initialized to state IDLE"<< '\n';
    currentState = IDLE;
  };

  ~Active(){
    std::cout << "Active control object destroyed"<< '\n';
  };

  void error_msg()
  {
    std::cout << "Event unknown or not supported at current active state!"<< '\n'; 
  }

  void handleEvent(Event event){
    std::cout << "active handler triggered"<< '\n';
    switch (currentState) {
      case IDLE:
        if(event==Engage_Throttle) { accelerate(); }
        else if(event==Engage_Brake) { decelerate(); }
        else { error_msg(); }
        break;
      case ACCELERATING: 
        if(event==Engage_Brake) { decelerate(); }
        else if(event==Disengage_Throttle) { to_idle(); }
        else { error_msg(); }
        break; 
      case DECCELERATING: 
        if(event==Engage_Throttle) { accelerate(); }
        else if(event==Disengage_Brake) { to_idle(); }
        else { error_msg(); }
        break;
      default:
        error_msg();
        break;
    }
  }
private:
  int currentState;
  void accelerate(){currentState=ACCELERATING;   std::cout << "accelerating"<< '\n'; };
  void decelerate(){currentState=DECCELERATING;   std::cout << "decelerating"<< '\n'; };
  void to_idle(){currentState=IDLE;   std::cout << "idling"<< '\n'; };
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
    std::cout << "Event unknown or not supported at current motor state!"<< '\n'; 
  }

  void handleEvent(Event event)
  {
    std::cout << "Motor handler triggered"<< '\n';
    key = rand() % 2;
    switch (currentState) {
      case OFF: 
        if(event==Ignite && key==1) { ignition(); }
        else if(event==Ignite && key==0) { std::cout << "Wrong key! Ignition not triggered" << '\n'; }
        else { error_msg(); }
        break;
      case ON: 
        if(event==Engage_G && gear==0) { engaging_G(); activate(); }
        else if(event==Disengage_HB && hBrake==1) { disengaging_HB(); activate(); }
        else if(event==Failure) {failure();}
        else { error_msg(); }
        break; 
      case ACTIVE:
        if(event==Disengage_G && gear==1) { disengaging_G(); deactivate(); }
        else if(event==Engage_HB && hBrake==0) { engaging_HB(); deactivate(); }
        else if(event==Failure) { failure(); deactivate(); }
        else { aEvent = readActiveEvent(); aControl->handleEvent(aEvent); }
        break;
      default:
        error_msg();
        break;
    }
  };

private:
  States currentState;
  CarMotor* MyMotor;
  Active* aControl;
  Event aEvent;
  int gear;
  int hBrake;
  int key;
  void activate() { this->aControl = new Active(); };
  void deactivate() { delete aControl; };
  void ignition(){ currentState=ON;   std::cout << "Ignition triggered"<< '\n'; };
  void engaging_HB(){currentState=ON; hBrake=1;   std::cout << " HBrake engaged"<< '\n';};
  void engaging_G(){currentState=ACTIVE; gear=1;  std::cout << "Gear engaged"<< '\n';};
  void disengaging_HB(){currentState=ACTIVE; hBrake=0;   std::cout << "HBrake released"<< '\n';};
  void disengaging_G(){currentState=ON; gear=0;  std::cout << "Gear disengaged"<< '\n';};
  void failure(){currentState=OFF;   std::cout << "engine failure!!"<< '\n';}; 

};

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