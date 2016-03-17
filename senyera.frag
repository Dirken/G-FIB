#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

void main()
{
	float aux =  mod(vtexCoord.s,5.0); //fract
	aux = fract(aux);
    if (0.0 <= aux && aux < 1.0/9.0 	||
        2.0/9.0 <= aux && aux < 3.0/9.0 ||
		4.0/9.0 <= aux && aux < 5.0/9.0	||
		6.0/9.0 <= aux && aux < 7.0/9.0	||
		8.0/9.0 <= aux && aux < 1.0) fragColor =vec4(1.0,1.0,0.0,1.0);
    else fragColor = vec4(1.0,0.0,0.0,0.0);
}
