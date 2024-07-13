# Graphene_Nonlinearity
Set of MATLAB formulas for computing the nonlinearity of graphene, with emphasis on the optical band (e.g., NIR) and the self-acting (Kerr-like) effect.

This repository currently includes only a function for computing the perturbative optical nonlinearity of graphene, in terms of its third-order surface conductivity sigma(3), using the quantum-derived formulas in [1]. The core-fuction is ```sigma3_Graphene_2015JLC.m``` and I've also included a test-script (```script_Repro_2015JLC_Fig4.m```) to showcase the execution and validate its outputs. Executing the core-function (with no arguments) should produce the following figure in several seconds, which reproduces the blue curves in Fig. 3(b) of [1], concerning third-harmonic generation (THG).

![THG](https://github.com/user-attachments/assets/427d4e89-3c08-4d95-95dc-35ab8d46a046)

Fig.1 : Complex spectra of THG sigma3 (xxxx-component) of graphene, at 300 K (room temperature) and at 33 meV relaxation rates.

Executing the test-script should produce the following repro of all four panels of Fig. 4 in [1], conerning the Kerr effect. This should take somewhat longer, e.g., 1-2 minutes.

![Kerr](https://github.com/user-attachments/assets/87017dc3-bf42-4161-abea-a0e3ce17eafb)

Fig.2 : Complex spectra of Kerr sigma3 (xxxx-component) of graphene, for various combinations of temperature (zero and room temperature) and inter/intraband momentum relaxation rates.

# References

[1] JinLuo Cheng (JLC), N. Vermeulen, J. E. Sipe, "Third-order nonlinearity of graphene: Effects of phenomenological relaxation and finite temperature", PRB, 2015. [URL/DOI](https://doi.org/10.1103/PhysRevB.91.235320)
