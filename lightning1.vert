#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

/*
ka reflectivitat ambient, kd reflect difosa, ks reflect especular
s  shininess
ia propietats llum ambient,id propietats difosa, is propietats especular
L  vector unitari cap a la font de llum
H  V+L (on V es vector unitari del vertex->camera, per defecte 0,0,1

Formula a seguir:
ka*Ia + Kd*Id(N*L) + ks*Is(N*H)^s  */

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;
uniform vec4 matAmbient, matDiffuse, matSpecular;
uniform float matShininess;
uniform vec4 lightAmbient, lightDiffuse, lightSpecular, lightPosition;


vec4 light(vec3 N, vec3 V, vec3 L)
{
		
        N = normalize(N);
        V = normalize(V); //vector unitari del vertex cap a la camera
        L = normalize(L);
        vec3 H = normalize(V+L);
        float NdotL = max(0.0, dot(N,L));
        float HdotV = max(0.0, dot(N,H));
        float Idiff = NdotL;
        float Ispec = 0;
        if (NdotL > 0) Ispec = pow(HdotV, matShininess);
        return
                matAmbient * lightAmbient +  //ka*Ia;
                matDiffuse * lightDiffuse * Idiff + //Kd*Id(N*L)
                matSpecular * lightSpecular * Ispec; //ks*Is(N*H)^s
}

void main()
{
	vec3 P = (modelViewMatrix * vec4(vertex.xyz, 1.0)).xyz; //punto vertice
    vec3 N = (normalMatrix * normal);
    vec3 V = -P; // OBS
    vec3 L = (lightPosition.xyz - P);
    frontColor = light(N, V, L);
    gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz, 1.0);
}
