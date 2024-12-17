"use client";

import * as THREE from "three";
import { GLTFLoader } from "three/addons/loaders/GLTFLoader.js";
import { useEffect } from "react";

export default function Computer() {
  useEffect(() => {
    const scene = new THREE.Scene();
    scene.background = new THREE.Color(0x000000);

    const camera = new THREE.PerspectiveCamera(
      75,
      window.innerWidth / window.innerHeight,
      0.1,
      1000
    );
    const renderer = new THREE.WebGLRenderer({ antialias: true });

    renderer.setSize(window.innerWidth, window.innerHeight);
    document
      .getElementById("scene-container")
      ?.appendChild(renderer.domElement);

    // Illuminazione
    const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);
    scene.add(ambientLight);

    const pointLight = new THREE.PointLight(0xffffff, 1);
    pointLight.position.set(5, 5, 5);
    scene.add(pointLight);

    // Pavimento
    const floorGeometry = new THREE.PlaneGeometry(10, 10);
    const floorMaterial = new THREE.MeshStandardMaterial({
      color: 0x333333,
      roughness: 0.8,
    });
    const floor = new THREE.Mesh(floorGeometry, floorMaterial);
    floor.rotation.x = -Math.PI / 2;
    scene.add(floor);

    // Carica il modello del tavolo
    const tableLoader = new GLTFLoader();
    tableLoader.load("/models/victorian_style_tabledesk.glb", function (gltf) {
      const table = gltf.scene;
      table.scale.set(0.003, 0.003, 0.003);
      table.position.set(0, 0.85, 0);
      table.rotation.y = -Math.PI / 2;
      scene.add(table);

      const box = new THREE.Box3().setFromObject(table);
      const size = box.getSize(new THREE.Vector3());
      console.log("Dimensioni tavolo:", size);
    });

    // Carica il modello del computer
    const computerLoader = new GLTFLoader();
    computerLoader.load("/models/old-pc/source/PSX_PC.glb", function (gltf) {
      const computer = gltf.scene;
      computer.scale.set(0.5, 0.5, 0.5);
      computer.position.set(0, 0.9, 0);
      
      // Crea un materiale emissivo per lo schermo
      const screenMaterial = new THREE.MeshStandardMaterial({
        color: 0x000000,
        emissive: 0x00ff00,
        emissiveIntensity: 0
      });

      // Trova e applica il materiale allo schermo
      computer.traverse((child) => {
        if (child instanceof THREE.Mesh && child.name.toLowerCase().includes('screen')) {
          child.material = screenMaterial;
        }
      });

      scene.add(computer);
    });

    const handleResize = () => {
      camera.aspect = window.innerWidth / window.innerHeight;
      camera.updateProjectionMatrix();
      renderer.setSize(window.innerWidth, window.innerHeight);
    };
    window.addEventListener("resize", handleResize);

    camera.position.set(0, 1.1, 6);
    camera.lookAt(0, 0, 0);

    const startPosition = new THREE.Vector3(0, 1.05, 6);
    const targetPosition = new THREE.Vector3(0, 1.05, 0.3);
    const animationDuration = 3000; // 3 secondi
    let animationStartTime: number | null = null;
    let isAnimating = true;

    function animate(timestamp: number) {
      requestAnimationFrame(animate);

      if (isAnimating) {
        if (!animationStartTime) animationStartTime = timestamp;
        const progress = Math.min(
          (timestamp - animationStartTime!) / animationDuration,
          1
        );

        // Interpolazione lineare tra posizione iniziale e finale
        camera.position.lerpVectors(startPosition, targetPosition, progress);
        camera.lookAt(0, 1.05, 0);

        if (progress === 1) {
          isAnimating = false;
          const screenOverlay = document.getElementById('screen-overlay');
          if (screenOverlay) {
            screenOverlay.style.opacity = '1';
            screenOverlay.style.backgroundColor = '#062997';
          }
        }
      }

      renderer.render(scene, camera);
    }

    animate(performance.now());

    return () => {
      window.removeEventListener("resize", handleResize);
      document
        .getElementById("scene-container")
        ?.removeChild(renderer.domElement);
    };
  }, []);

  return (
    <>
      <div id="scene-container" className="w-full h-screen"></div>
      <div 
        id="screen-overlay"
        className="fixed top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-[52.4%] max-w-[972px] max-h-[790px] w-full h-full transition-colors duration-1000 mix-blend-difference"
        style={{ opacity: 0 }}
      >
        <div className="w-full h-full flex bg-[url('/img/loginXP.jpg')] bg-center bg-contain bg-no-repeat">
          
        </div>
      </div>
    </>
  );
}
