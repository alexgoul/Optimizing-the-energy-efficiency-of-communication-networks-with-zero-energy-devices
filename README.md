# Optimizing-the-energy-efficiency-of-communication-networks-with-zero-energy-devices
The system model consists of the base station for power generation and the ZED users who receive power only from the power beacon.
Thus, in WPCN we will need the TDMA (time division multiple access scheme) where both upper and lower link signals are divided into time slots for each user.
Each device will first receive the downlink signal to collect power and then use this power to transfer information.The only power supply to the ZEDs comes from the WPT,
which generally provides an arguably limited amount. Therefore, we realize that our studies should focus on developing efficient power systems to cope with this weakness.
In this direction, this thesis intends to improve the system resource management to minimize the energy consumed by each user.
The ZEDs consumes a fraction of the total power in its various operating components and the rest in data transfer, known as circuit power consumption.
We formulate a problem of minimizing the average energy collected from the ZEDs. Without affecting generality, we will study the problem only for one device and the results obtained will apply to the others.
The derived optimization problem is non-convex, so with the help of the Hessian table and theory we convert it to convex in order to solve it in polynomial time.

Convex Optimization problem

![image](https://user-images.githubusercontent.com/128620549/230226041-75e37f36-123d-4958-8c93-f7f689433780.png)

Then, with the help of matlab, we run simulations of energy optimization problem

for two users: [MinimizeN2](https://github.com/alexgoul/Optimizing-the-energy-efficiency-of-communication-networks-with-zero-energy-devices/blob/main/MinimizeN2.m)

for three users: [MinimizeN3](https://github.com/alexgoul/Optimizing-the-energy-efficiency-of-communication-networks-with-zero-energy-devices/blob/main/MinimizeN3.m)

In the first simulation we study the total transmission power as a quality of communication:

![Fig_N2_1](https://user-images.githubusercontent.com/128620549/230226456-31782020-f330-414a-8a81-fcd99dae7d43.jpg)
![FigN3_1](https://user-images.githubusercontent.com/128620549/230228679-fceae7c4-4099-45cc-99e6-249ebdadaf02.jpg)


In the second we study the total transmission power as a ratio of the circuit power consumption:
![Fig_N2_2](https://user-images.githubusercontent.com/128620549/230227320-21d83a98-cad1-459b-949a-1169f4556bbc.jpg)
![FigN3_2](https://user-images.githubusercontent.com/128620549/230228746-6ce7b49c-2b4a-4366-9226-521cf2dac095.jpg)

Finally, our simulation results demonstrate the strategy for resource management in zero-energy device networks.
We studied the simulations for networks with two and three users. The difference we identified in the two networks is the tenfold higher transmission power consumed in the three users compared to the two users.
In both cases, the quality of the communication channel plays an important role in reducing the energy needed by the system.
Finally, if we consider the circuit power consumption, the energy efficiency of the system is improved through its reduction. Therefore, in order to develop more efficient communication systems,
technology should focus on reducing the power consumption of devices and improving the quality of the communication channel.
