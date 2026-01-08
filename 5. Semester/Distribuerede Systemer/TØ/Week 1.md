## 1 Exercise: Characterization of distributed systems
### Discuss the pros and cons of distributed versus centralized systems.
Note: 
vertical scaling = more performance for machine doing a task
horizontal scaling = more machines to perform tasks

Pros of distributed systems:
* Horizontally scalable since methods can be divided into different nodes. 
* Has fault tolerance (the system can still work even with node failure)
* Works well with concurrency since different nodes run different methods

Cons of distributed systems:
* A lot more complex than centralized to implement
* There is higher latency since there is latency in communication between nodes

### Discuss the relationship between distributed systems, parallel systems, cluster computing systems, grid computing systems, and cloud computing systems.
They are all types of distributed systems.

Cluster computing systems (tight coupling) are comprised of multiple homogeneous computers or nodes that are able to run the same tasks as a single unit. A network of manager nodes schedule which nodes should run which tasks.

Grid computing systems (loose coupling) are comprised of multiple homogeneous or heterogeneous computer or nodes . Grids can therefore also span multiple organizations running multiple models and architectures as long as the necessary layers are implemented correctly (page 36 figure 1.10).

Parallel systems are systems of multiple processors or computers that can execute at the same time. Parallel systems can either follow a shared-memory model or distributed-memory model. Sharing memory makes it easier to develop since data control here is well-understood, but it is not easily scalable. The distributed-memory model is infinitely scalable but more complex and typically goes for message-passing models instead of mimicking shared memory. Typically cluster computing is used for parallel systems.

Cloud computing systems are systems which you can access through the internet to perform any task on demand. They are typically implemented using grid computing systems since servers aren't 

### Discuss the relationship between distributed, pervasive, and ubiquitous systems.


### Discuss the relationship between parallel and concurrent systems


### Discuss pros and cons of different forms of transparency in distributed systems.


### Discuss the fallacies of distributed systems.


### Discuss current examples of noteworthy distributed systems.


### Discuss current examples of noteworthy pervasive systems.


### Discuss Flynn’s taxonomy in general and specifically in relation to distributed systems.


### Make a small processing-step example for each of Flynn’s four computer architectural classes SISD, SIMD, MISD and MIMD by taking the concepts “instruction stream”, “datastream” and “processing unit” into account.


### Discuss the consequences of Amdahl’s law for distributed systems.
### Discuss the relationship between Amdahl’s and Gustafson’s laws and the consequences of Gustafson’s law for distributed systems.
### Discuss three types of hardware resources, three types of data resources, and three types of software resources that can usefully be shared. Give examples of their sharing as it occurs in practice in distributed systems.
### Consider the WWW as an example to illustrate the concepts of clients, servers, and resource sharing. Discuss the pros and cons of the technologies HTML, URL and HTTP for information browsing? Are any of these technologies suitable as a basis for client-server computing in general
