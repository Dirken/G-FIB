#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

void main()
{	
	float radi = 0.2;
	vec2 centre; centre.t = 0.5; centre.s = 0.5;
	if (distance(vtexCoord, centre) <= radi) fragColor = vec4(1.0,0.0,0.0,1.0);
    else fragColor = vec4(1.0,1.0,1.0,1.0);
}

