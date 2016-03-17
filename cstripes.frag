#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;
uniform int nstripes = 16;
uniform vec2 origin = vec2(0,0);

void main()
{
	float d = distance(vtexCoord.st, origin);
        if (mod(floor(d*float(nstripes)),2)==0.0) fragColor = vec4(1.0,0.0,0.0,0.0);
        else fragColor =vec4(1.0,1.0,0.0,1.0);
}

