#version 330 core

in vec3 fL;
in vec3 fN;
in vec3 fV;
out vec4 fragColor;
uniform sampler2D strokes;
in vec2 vtexCoord;

uniform vec4 matAmbient, matDiffuse, matSpecular;
uniform float matShininess;

vec4 light(vec3 N, vec3 V, vec3 L)
{
        V = normalize(V); //vector unitari del vertex cap a la camera
        L = normalize(L);
        vec3 H = normalize(V+L);
        float NdotL = max(0.0, dot(N,L));
        float HdotV = max(0.0, dot(N,H));
        float Idiff = NdotL;
        float Ispec = 0;
        if (NdotL > 0) Ispec = pow(HdotV, matShininess);
        float f = Idiff + Ispec; 
        vec2 res;
        res = vec2((1.0/512.0)*gl_FragCoord.xy);
        if (f < 0.4) return vec4(0,0,0,1);
        else { 
        	float exponent = pow(f,16.0);
        	vec4 color1 = texture2D(strokes, res.xy);
        	return mix(color1, vec4(1,1,1,1), exponent);
         }
}
 
void main()
{
    fragColor = light(fN,fV,fL);
}
