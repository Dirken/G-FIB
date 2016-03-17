#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;
uniform float n = 8;

void main()
{
	float aux3 = n; //si fem n*2 == fract
 	float aux =   mod(vtexCoord.s*aux3,aux3); aux =  mod(aux,2.0);
    float aux2 =  mod(vtexCoord.t*aux3,aux3); aux2 = mod(aux2,2.0);
    if (fract(aux) > 0.1 && fract(aux2) > 0.1) fragColor =vec4(0.35,0.35,0.35,1.0);
    else fragColor = vec4(0.0,0.0,0.0,0.0);
}



