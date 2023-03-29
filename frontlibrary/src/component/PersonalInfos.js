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
    <div className="mt-40 bg-white pt-8 flex flex-col items-center "> 
      <div className="md:w-[80%]">
        <h1 className="pb-4 text-2xl">Mes informations personnelles</h1>
        <div className=" bg-white drop-shadow-md text-left ">
          <div className="p-8">
            <p>Prénom : {reader.firstName}</p>
            <p>Nom : {reader.lastName}</p>
            <p>Adresse mail : {reader.email}</p>
            <p>Ma photo : {reader.picture}</p>
          </div>
        </div>
      </div>
    </div>
  );
}
export default PersonalInfos;
