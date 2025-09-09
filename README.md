# Menarche-2025
Code and simulation data used in the manuscript entitled "Joint model shows association of Mapuche genetic ancestry and longitudinal BMI with early menarche"


MONOLIX/SAEM Execution Requirements
To run the MONOLIX/SAEM analysis, you need the following files:
Required Files

jointProject-simul.mlxtran: Main project file for Monolix that specifies:

Data source (jointProject-data.csv)
Model structure: individual model (random effects) + structural model (defined in model-simulation.txt)
SAEM parameters: initial values, iteration settings, task configurations, plotting options, etc.

jointProject-simul.mlxproperties: Project properties file (internal Monolix file)
model-simulation.txt: Structural model definition file containing the joint model specification
jointProject-data.csv: Dataset containing the simulated data for analysis

Usage

Load jointProject-simul.mlxtran in Monolix
Ensure all supporting files are in the same directory
Run the SAEM estimation

File Dependencies

jointProject-simul.mlxtran
├── jointProject-data.csv (data)
├── model-simulation.txt (model definition)
└── jointProject-simul.mlxproperties (properties)
