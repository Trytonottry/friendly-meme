for (i = 0, i2 = 0, i3 = 0, i4 = 0; i < faceCount; i++, i2 += 6, i3+= 9, i4 += 12) {
    var face = textGeometry.faces[i];
    var centroid = THREE.BAS.Utils.computeCentroid(textGeometry, face);
    var centroidN = new THREE.Vector3().copy(centroid).normalize();

    var delay = (maxLength - centroid.length()) * lengthFactor;
    var duration = THREE.Math.randFloat(minDuration, maxDuration);

    for (v=0; v<6; v+=2) {
        aAnimation.array[i2+v] = delay + stretch * Math.random();
        aAnimation.array[i2+v+1] = duration;
    }

    var point = utils.fibSpherePoint(i, faceCount, 200);

    for (v=0; v<9; v+=3) {
        aEndPosition.array[i3+v]=point.x;
        aEndPosition.array[i3+v+1]=point.y;
        aEndPosition.array[i3+v+2]=point.z;
    }
}