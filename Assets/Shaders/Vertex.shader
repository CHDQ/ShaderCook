// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/Vertex"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
    }

    SubShader
    {

        Pass
        {
            CGPROGRAM
            #pragma vertex my_vert
            struct MyStruct
            {
                float4 pos:POSITION;
            };

            float4 my_vert(MyStruct ms):POSITION
            {
                return UnityObjectToClipPos(ms.pos);
            }

            fixed4 _Color;
            sampler2D _MainTex;

            #pragma fragment my_frag
            fixed4 my_frag(float2 uv:TEXCOORDO):COLOR
            {
                return tex2D(_MainTex, uv);
            }
            ENDCG
        }
    }

    FallBack "Diffuse"
}