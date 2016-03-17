#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec3 posicio;
in vec4 posicio2;
uniform sampler2D sampler;

vec4 sampleSphereMap(sampler2D sampler, vec3 V)
{

float z = sqrt((V.z+1.0)/2.0);
vec2 st = vec2((V.x/(2.0*z)+1.0)/2.0, (V.y/(2.0*z)+1.0)/2.0);
return texture(sampler, st);
}

void main()
{
	vec3 V =  (posicio2.xyz)-posicio;
    fragColor = sampleSphereMap(sampler, V);
}
/*
El FS haurà de calcular el vector unitari V en la direcció que va de la posició del fragment a la posició de
l’observador (tot en object space). El color final del fragment serà simplement el color del texel del sphere
map (uniform sampler2D spheremap) corresponent al vector V. Per aquest darrer pas podeu
utilitzar aquesta funció que, donat un spheremap i un vector unitari V, retorna el color en la direcció
donada per V:
*/
