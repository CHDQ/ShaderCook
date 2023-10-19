// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/SinShader"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags
        {
            "RenderType"="Opaque"
        }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            v2f vert(appdata v)
            {
                //定点着色器动画
                v2f o;
                float dist = distance(v.vertex.xyz, float3(0, 0, 0));
                float s = sin(dist * 6 + _Time.z) / 5;
                o.vertex = mul(unity_ObjectToWorld, v.vertex);
                o.vertex.z = s;
                o.vertex = mul(unity_WorldToObject, o.vertex);
                o.vertex = UnityObjectToClipPos(o.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                // o.vertex = UnityObjectToClipPos(v.vertex);
                // o.uv = v.uv;
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                //片段着色器  uv动画
                // sample the texture
                // float2 offset = float2(0, 0);
                // offset.x = _Time.y;
                // offset.y = _Time.y;
                // fixed4 col = tex2D(_MainTex, i.uv + offset);
                fixed4 col = tex2D(_MainTex, i.uv);
                return col;
            }
            ENDCG
        }
    }
}