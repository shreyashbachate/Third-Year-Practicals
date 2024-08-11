using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

class ChangeColor:MonoBehaviour
{
    [SerializeField]
    GameObject cube,sphere,cylinder;
    Renderer cr,sr,cyr;
    float r1,r2,r3;
    Color newColor;

    void Start()
    {
        cr = cube.GetComponent<Renderer>();
        sr = sphere.GetComponent<Renderer>();
        cyr = cylinder.GetComponent<Renderer>();

        GetComponent<Button>().onClick.AddListener(Change);
    }

    void Change()
    {
        r1 = Random.Range(0f,1f);
        r2 = Random.Range(0f,1f);
        r3 = Random.Range(0f,1f);

        newColor = new Color(r1,r2,r3,1f);

        cr.material.SetColor("_Color",newColor);
        sr.material.SetColor("_Color",newColor);
        cyr.material.SetColor("_Color",newColor);
    }
}