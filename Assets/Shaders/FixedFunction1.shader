Shader "Custom/FixedFunction1"
{
    Properties
    {
        _Color("Main Color",color)=(1,1,1,1)
        _Ambient("Ambient",color)=(0.3,0.3,0.3,0.3)
        _Specular("Specular",color)=(1,1,1,1)
        _Shininess("Shininess",range(0,8))=4
        _Emission("Emission",color)=(1,1,1,1)
    }
    SubShader
    {
        Pass
        {
            //固定值用()  变量值用[]
            //            color[_Color]
            material
            {
                diffuse[_Color]//漫反射颜色
                ambient[_Ambient]//环境光
                specular[_Specular]//镜面反射
                shininess[_Shininess]//光泽度  越大越光泽，镜面反射点越小
                emission[_Emission]//自发光
            }
            lighting on//控制环境光  不设置on ambient没有效果
            separatespecular on // 控制 specular 不设置 on specular 没有效果
        }
    }
    FallBack "Diffuse"
}