#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
uniform sampler2D colorMap;
out vec4 fragColor;
mat2 MatrixRotation;
uniform float time; 
uniform float a = 0.5;

void main()
{


	
	vec4 color = frontColor* texture2D(colorMap, vtexCoord);
    float m = max(color.r,max(color.g,color.b));
    vec2 u = vec2(m,m);
    float PI = 3.141596;
    float angle = 2*PI*time;
    MatrixRotation[0][0] = cos(angle);
	MatrixRotation[0][1] = -sin(angle);
	MatrixRotation[1][0] = sin(angle);
	MatrixRotation[1][1] = cos(angle);
    u = MatrixRotation*u;
    fragColor = texture2D(colorMap, vtexCoord+(a/100.0)*u);
}

