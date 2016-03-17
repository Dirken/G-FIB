#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;
uniform bool classic;

void main()
{	
	float radi = 0.2;
	vec2 centre; centre.t = 0.5; centre.s = 0.5;
	if (classic) {
		if (distance(vtexCoord, centre) <= radi) fragColor = vec4(1.0,0.0,0.0,1.0);
    	else fragColor = vec4(1.0,1.0,1.0,1.0);
    }
    else{
    	float PI = 3.141596;
    	float fi = PI/16.0;
    	vec2 u =  vec2(abs(vtexCoord-centre));
    	float angle =atan(u.t,u.s);
    	if (mod((angle/fi) + 0.5,2.0) < 1 || (distance(vtexCoord, centre) <= radi)) fragColor = vec4(1.0,0.0,0.0,1.0);
    	else fragColor = vec4(1.0,1.0,1.0,1.0);
    }
    
}

