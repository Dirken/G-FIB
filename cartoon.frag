#version 330 core

in vec3 fL;
in vec3 fN;
in vec3 fV;
out vec4 fragColor;

uniform vec4 matAmbient, matDiffuse, matSpecular;
uniform float matShininess;
uniform vec4 lightAmbient, lightDiffuse, lightSpecular;

vec4 light(vec3 N, vec3 V, vec3 L)
{
        N=normalize(N);
        V=normalize(V);
        L=normalize(L);
        vec3 R = normalize(2.0*dot(N,L)*N-L);
        float NdotL = max(0.0, dot(N,L));
        float RdotV = max(0.0, dot(R,V));
        float Idiff = NdotL;
        float Ispec = 0;
        if (NdotL >= 0) Ispec = pow(RdotV, matShininess);
        float f = Idiff + Ispec;
        if (f < 0.4) return vec4(0.,0.,0.,1);
        else if (f >= 0.4 && f < 0.98) return matDiffuse;
        else if (f > 0.98) return matSpecular;
        }
 
void main()
{
    fragColor = light(fN,fV,fL);
}

