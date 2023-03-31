import React, { useEffect, useState } from "react";
import defaultImage from "./livre.png";
import { Link } from "react-router-dom";

/**
 *  This function represents the component that displays the recommended friends of the reader.
 * @param {*} props  the follower id
 * @returns JS Element
 */
function MyFriendsRecom(props) {
  const follower = props.follow; // follower id
  const [books, setBook] = useState(null); // books of the follower

  useEffect(() => {
    fetch(`http://localhost:8000/api/readers/${follower.id}/books?max=3`, {
      mode: "cors",
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error("404 Not Found");
        }
        return response.json(); // Transform the data into json
      })
      .then((data) => setBook(data)) // Set the books to the data returned by the API
      .catch((error) => {
        console.error("Error fetching follower:", error); // Set the books to null if there is an error
        setBook(null); // Set the books to null if there is an error
      });
  }, [follower.id]);

  return (
    <li key={follower.id} className=" flex flex-col text-left mb-12 ml-12">
      <button className="bg-color ease-in-out duration-200 text-white p-1">
        S'abonner
      </button>
      {follower.picture ? ( // if the follower has a picture
        <img
          src={`${follower.picture}`}
          alt={follower.firstName}
          className="object-cover h-[24vh] w-[100%] md:object-contain drop-shadow-md"
        />
      ) : (
        // if the follower has no picture
        <img src={defaultImage} alt="default" style={{ width: "10vw" }} />
      )}
      <div className="">
        <h3 className="font-medium">
          <p>
            {follower.firstName} {follower.lastName}
          </p>
        </h3>
      </div>

      <ul className="flex flex-row w-full justify-between">
        {books ? ( // if the follower has books
          books.map((book) =>
            book[0].picture ? ( // if the book has a picture
              <Link to={`/books/${book[0].id}`}>
                <img
                  className="w-[15vw] md:w-[3vw]"
                  src={`${book[0].picture}`}
                  alt={book[0].title}
                  title={book[0].title}
                />
              </Link>
            ) : (
              // if the book has no picture
              <Link to={`/books/${book[0].id}`}>
                <img
                  className="w-[15vw] md:w-[3vw]"
                  src={defaultImage}
                  alt="default"
                  title={book[0].title}
                />
              </Link>
            )
          )
        ) : (
          // if the follower has no books
          <div className="text-red-500">Pas de dernière lecture</div>
        )}
      </ul>
    </li>
  );
}
export default MyFriendsRecom;
