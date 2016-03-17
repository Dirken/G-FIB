#version 330 core

in vec4 frontColor;
in vec4 posC;
in vec4 normalC;
in vec4 posW;
in vec4 normalW;
out vec4 fragColor;
uniform sampler2D sampler;

uniform bool worldSpace;


vec4 sampleSphereMap(sampler2D sampler, vec3 R)
{
float z = sqrt((R.z+1.0)/2.0);
vec2 st = vec2((R.x/(2.0*z)+1.0)/2.0, (R.y/(2.0*z)+1.0)/2.0);
st.y = -st.y;
return texture(sampler, st);
}

void main()
{
    if (worldSpace) fragColor = sampleSphereMap(sampler, posW.xyz)*normalW;
    else         	fragColor = sampleSphereMap(sampler, posC.xyz)*normalC;
    	
}
