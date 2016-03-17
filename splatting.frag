#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;
uniform sampler2D noise0;
uniform sampler2D rock1;
uniform sampler2D grass2;

/*
Observeu que als fragments on el soroll és proper a 0 es mostra el color de la roca, mentre que quan el
soroll és proper a 1 es mostra el color de la vegetació.
Escriu un fragment shader que, donades tres textures com les anteriors, calculi el color del fragment com
a interpolació lineal entre el color de la textura de roca i el color de la textura de vegetació, on el pes de la
interpolació lineal depèn del valor de funció de soroll (agafeu la component r de la textura noise.png com
a valor del soroll).
Totes tres textures s’accedeixen amb les coordenades de textura que envia el viewer. No feu servir cap
tipus d'il·luminació.


*/

void main()
{
	vec4 color1 = texture2D(rock1, vtexCoord.st);
	vec4 color0 = texture2D(grass2, vtexCoord.st);
	float noise = (texture2D(noise0, vtexCoord.st)).r;
	fragColor = mix(color1,color0,noise);
}
