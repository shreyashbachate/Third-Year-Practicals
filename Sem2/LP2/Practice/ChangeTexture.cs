using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

class ChangeTexture : MonoBehaviour
{
    [SerializeField]
    GameObject cube,sphere,cylinder;
    Renderer cubeRenderer,sphereRenderer,cylinderRenderer;
    Texture[] textures;
    int r1;
    

    void Start()
    {
        cubeRenderer = cube.GetComponent<Renderer>();
        sphereRenderer = sphere.GetComponent<Renderer>();
        cylinderRenderer = cylinder.GetComponent<Renderer>();
        gameObject.GetComponent<Button>().onClick.AddListener(ChangeToTexture);
    }

    void ChangeToTexture()
    {
        r1 = Random.Range(0,textures.Length);
        cubeRenderer.material.mainTexture = textures[r1];
        sphereRenderer.material.mainTexture = textures[r1];
        cylinderRenderer.material.mainTexture = textures[r1];
    }
}