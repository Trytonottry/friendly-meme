import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader.js';

let robotModel, mixer;
const gltfLoader = new GLTFLoader();

gltfLoader.load(
  'https://play.rosebud.ai/assets/Animated Robot2.glb?XU65',
  function (gltf) {
    robotModel = gltf.scene;
    robotModel.scale.set(1.0, 1.0, 1.0);
    robotModel.position.set(0, -0.5, 0);        // ← fixed comma → dot
    robotModel.traverse(function (child) {
      if (child.isMesh) {                       // ← correct Three.js check
        child.castShadow = true;
        child.receiveShadow = true;
      }
    });

    // Optional: set up animation mixer if the model has animations
    mixer = new THREE.AnimationMixer(robotModel);
    gltf.animations.forEach(clip => mixer.clipAction(clip).play());
  },
  undefined,                                    // onProgress callback
  console.error                                 // onError callback
);