import React, { useEffect, useState } from "react";
import Book from "./Book";
import defaultImage from "./livre.png";
import { Link } from "react-router-dom";
import userImage from "./userImage.png";

function MyFriends(props) {
    const follower = props.follow;
    const [books, setBook] = useState(null);
    useEffect(() => {
        fetch(`http://185.212.225.127:8000/api/readers/${follower.id}/books?max=3`, {
          mode: "cors",
        })
          .then((response) => {
            if (!response.ok) {
              throw new Error("404 Not Found");
            }
            return response.json();
          })
          .then((data) => setBook(data))
          .catch((error) => {
            console.error("Error fetching follower:", error);
            setBook(null);
          });
      }, [follower.id]);
  
  return (
    <li key={follower.id} className=" flex flex-col text-left mb-12 ml-12">
        {follower.picture ? (
          <img src={`${follower.picture}`} alt={follower.firstName} className="object-cover h-[24vh] w-[100%] md:object-contain drop-shadow-md"/>
        ) : (
          <img src={userImage} alt="default" style={{ width: "10vw" }} />
        )}
        <div className="">
          <h3 className="font-medium">
            <p>{follower.firstName} {follower.lastName}</p>
          </h3>
        </div>
        
        <ul className="flex flex-row w-full justify-between">
        {books ? (books.map((book) => (
            book[0].picture ?(
                <Link to={`/books/${book[0].id}`}>
            <img className="w-[3vw]" src={`${book[0].picture}`} alt={book[0].title} />
            </Link>
            ) : (
                <Link to={`/books/${book[0].id}`}>
            <img className="w-[3vw]" src={defaultImage} alt="default" />
            </Link>
            )
        ))) : (<div className="text-red-500">Pas de dernière lecture</div>
            )}
        </ul>
        
    </li>

    
  )
}
export default MyFriends;