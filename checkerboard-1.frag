#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

void main()
{

	float aux =   mod(vtexCoord.s*8.0,8); aux =  mod(aux,2.0);
    float aux2 =  mod(vtexCoord.t*8.0,8); aux2 = mod(aux2,2.0);
     if ((aux > 1. && aux2 > 1.) || aux < 1 && aux2 < 1) fragColor =vec4(0.5,0.5,0.5,1.0);
    else fragColor = 	vec4(0.0,0.0,0.0,0.0);
}
/*
 * No prou precís:
	int s = mod(gl_TexCoord[0].s*N,N);
	int t = mod(gl_TexCoord[0].t*N,N);
	int oddevens = mod(s,2.0);
	int oddevent = mod(t,2.0);
	if ((oddevens == 0 && oddevent == 0) || (oddevens == 1 && oddevent == 1)) gl_FragColor = vec4(0.0,0.0,0.0,1.0);
	else gl_FragColor = vec4(0.5,0.5,0.5,1.0);

*/


