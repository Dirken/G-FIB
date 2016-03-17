#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float minY, maxY;
vec4 red = vec4(1,0,0,1);
vec4 yellow = vec4(1,1,0,1);
vec4 green = vec4(0,1,0,1);
vec4 cyan = vec4(0,1,1,1);
vec4 blue = vec4(0,0,1,1);
void main()
{
	vec3 N = normalize(normalMatrix * normal);
	float div = (vertex.y-minY)/(maxY-minY);
	div = div*4.0;
	if (div == 4.0 && div > 3.0) frontColor = mix(cyan,blue, fract(div));
  	else if (div <= 1.0 && div > 0.0) frontColor = mix(red,yellow,fract(div));
	else if (div <= 2.0 && div > 1.0) frontColor = mix(yellow,green,fract(div));
	else if(div <= 3.0 && div > 2.0) frontColor = mix(green,cyan,fract(div));
	else frontColor = mix(cyan,blue,fract(div));
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz, 1.0);
}

