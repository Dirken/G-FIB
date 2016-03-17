#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;;
in vec3 posicio;
uniform float time;

void main()
{
	if (time == 0.0) discard;
	else if (posicio.x < time - 1) fragColor = vec4(0,0,1,1);
	else discard;
    
}

/*
onat que no podeu accedir a la mida del viewport, us recomanem que la decisió de descartar o no un
fragment es basi en la coordenada x del fragment en NDC.

Aquí teniu els resultats esperats amb el cub i time variant entre 0 i 2.


*/ 
