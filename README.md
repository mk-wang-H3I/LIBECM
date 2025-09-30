# LIBECM
Equivalent-circuit model (ECM) of lithium-ion batteries (LIBs) at cell and pack level based on a nonlinear open-circuit voltage (OCV) model. 
## Motivation and background
LIBs are extensively used on electric vehicles. One well-known feature of LIBs is the voltage drop, i.e., a monotonically decreasing terminal voltage with accumulated capacity consumption, given constant load current and ambient temperature, in part owing to the polarization phenomenon. This is one of the works to reflect this feature with acceptable comlexity.
## Features
 - Reflect the voltage drop mainly using an algebraic equation
 - Reflect the cell unevenness without high-dimension states
## How to use
 - The core functions are placed inside +LIBECM
 - There are three subfolders under +LIBECM
  * +cell: functions for cell model
  * +pack: functions for pack model
  * +sim: functions for simulation based on the models above
 - Two examples are provided
  * exampleCell.m  Simulate the terminal voltage of a single LIB cell using 1. algebraic model; 2. dynamic model with additional state of polarization voltage
  * examplePack.m  Simulate the terminal voltage and cell current of 1S4P pack

## Literature
The shared programs are based on the following publications. Please cite them - thanks!
@article{WangTTE2022,
	title		= {Desensitized Optimal Control of Electric Aircraft Subject to Electrical-Thermal Constraints},
	author		= {Mingkai Wang and Saulo O. D. Luiz and Antonio M. N. Lima and Shuguang Zhang},
	journal		= {IEEE Transactions on Transportationa Electrification},
	volume		= {8},
	number		= {4},
	pages		= {4190--4204},
	year		= {2022},
	doi 		= {10.1109/TTE.2022.3159172},
}
@article{WangTTE2024,
	title		= {A Range Prediction Method for All-Electric Aircraft by Capacity Discretization-Based Iterative Convex Programming},
	author		= {Mingkai Wang and Saulo O. D. Luiz and Antonio M. N. Lima and Shuguang Zhang},
	journal		= {IEEE Transactions on Transportation Electrification},
	volume		= {10},
	number		= {2},
	pages		= {3455--3467},
	year		= {2024},
	doi 		= {10.1109/TTE.2023.3298642},
}