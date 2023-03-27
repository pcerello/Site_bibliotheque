import React from "react";
import { useEffect, useState } from "react";

function PersonalInfos({ readerId }) {
  const [reader, setReader] = useState(null);
  console.log("readerId", readerId);
  useEffect(() => {
    fetch(`http://localhost:8000/api/readers/${readerId}`, {
      mode: "cors",
    })
      .then((response) => response.json())
      .then((data) => setReader(data));

  }, [readerId]);

  if (!reader) {
    return <div>Loading...</div>;
  }
  return (
    <div>
      <h1>Mes informations personnelles</h1>
      <p>Prénom : {reader.firstName}</p>
      <p>Nom : {reader.lastName}</p>
      <p>Adresse mail : {reader.email}</p>
      <p>Ma photo : {reader.picture}</p>
    </div>
  );
}
export default PersonalInfos;
