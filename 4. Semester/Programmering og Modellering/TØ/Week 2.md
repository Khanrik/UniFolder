## (1) In the lecture we discussed a four-stage method for incrementally developing formal models for cyber physical systems. What is the main focus of the System Boundary Definition stage? What other aspects of cyber physical systems are ignored at this stage?


## (2) In the lecture we developed two System Boundary Definition models of the Steam Boiler.
### (a) Create the first model where time is explicitly represented as sequences, as a project in Overture. Complete all three constants, four state variables, and five operations included in the UML class diagram in the lecture slides.


### (b) Create a simulation scenario Scenario3() in the World class where the water increases above N 2, and then decreases back to the safe range.


## (3) Create a new Overture project, and implement the VDM-RT classes of the second model of the steam boiler where only the current state is represented as numerical variables.
### (a) Complete all three constants, three state variables, and five operations included in the UML class diagram in the lecture slides.


### (b) Create a simulation scenario Scenario4() in the World class where the water quantity violates the post-condition of the Step(delta : real) operation only after a time of 500 seconds. That is, at 500 seconds the system should still not have violated the post-condition.
