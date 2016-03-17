#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;
uniform float n = 8;

void main()
{
	
  	float aux =   mod(vtexCoord.s*n,n); aux =  mod(aux,2.0);
    float aux2 =  mod(vtexCoord.t*n,n); aux2 = mod(aux2,2.0);
    if ((aux > 1. && aux2 > 1.) || aux < 1 && aux2 < 1) fragColor =vec4(0.35,0.35,0.35,1.0);
    else fragColor = vec4(0.0,0.0,0.0,0.0);
}


