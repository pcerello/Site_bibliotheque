import React from "react";
import { useEffect, useState } from "react";
import defaultImage from "./livre.png";

function MyFriends({ readerId }) {

const [follower, setFollower] = useState(null);
  console.log("readerId", readerId);
  useEffect(() => {
    fetch(`http://localhost:8000/api/readers/${readerId}/follow`, {
      mode: "cors",
    })
      .then((response) => response.json())
      .then((data) => setFollower(data));

  }, [readerId]);


  if (!follower) {
    return <div>tu n'as pas d'amis...désolé</div>;
  }
  
  
  return (
    <div className="bg-white py-16">

        <h1 className="text-2xl">Mes amis</h1>

        <li key={follower[0].id} className=" flex flex-col md:flex-row text-left ">
        {follower[0].picture ? (
          <img src={`${follower[0].picture}`} alt={follower[0].firstName} className="object-cover h-[24vh] w-[100%] md:object-contain drop-shadow-md"/>
        ) : (
          <img src={defaultImage} alt="default" style={{ width: "128px" }} />
        )}
        <div className="ml-4 flex flex-col justify-between">
          <h3 className="font-medium">
            <p>{follower[0].firstName} {follower[0].lastName}</p>
          </h3>
        </div>
      </li>

    </div>
  )
}
export default MyFriends;