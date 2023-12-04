using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LoadUpdate : MonoBehaviour
{
    public Material myMaterial;

    public int load;

    // Start is called before the first frame update
    void Start()
    {
    }

    // Update is called once per frame
    void Update()
    {
        myMaterial.shader.maximumLOD = load;
    }
}