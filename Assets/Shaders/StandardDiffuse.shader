﻿Shader "Custom/StandardDissuse"
{
    Properties
    {
        _EmissiveColor("EmmisiveColor",Color)=(1,1,1,1)
        _AmbientColor("AmbientColor",Color)=(1,1,1,1)
        _MySliderValue("MySliderValue",Range(0,1))=1
    }
    SubShader
    {
        Tags
        {
            "RenderType"="Opaque"
        }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf SimpleLambert 

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        float4 _EmissiveColor;
        float4 _AmbientColor;
        float _MySliderValue;

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
        // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        
        half4 LightingSimpleLambert(SurfaceOutput s, half3 lightDir, half atten)
        {
            half NdotL = dot(s.Normal, lightDir);
            half4 c;
            c.rgb = s.Albedo * _LightColor0.rgb * (NdotL * atten);
            c.a = s.Alpha;
            return c;
        } 
        
        void surf(Input IN, inout SurfaceOutput o)
        {
            float4 c;
            c = pow((_EmissiveColor + _AmbientColor), _MySliderValue);
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }

        
        ENDCG
    }
    FallBack "Diffuse"
}