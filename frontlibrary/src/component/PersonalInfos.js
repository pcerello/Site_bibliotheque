import React from "react";
import { useEffect, useState } from "react";
import Book from "./Book";
import userImage from "./userImage.png";

/**
 * This function represents the page that displays the personal information of the reader.
 * It displays the reader's information by calling the PersonalInfos component.
 * It displays the reader's books by calling the Book component.
 * @param {*} param0 the reader id
 * @returns JS Element
 */
function PersonalInfos({ readerId }) {
  const [reader, setReader] = useState(null); // reader's information
  const [books, setBooks] = useState(null); // reader's books

  useEffect(() => {
    fetch(`http://localhost:8000/api/readers/${readerId}`, {
      mode: "cors",
    })
      .then((response) => response.json()) // Transform the data into json
      .then((data) => setReader(data)); // Set the reader to the data returned by the API
  }, [readerId]);

  useEffect(() => {
    fetch(`http://localhost:8000/api/readers/${readerId}/books`, {
      mode: "cors",
    })
      .then((response) => {
        if (!response.ok) {
          throw Error("404 Not Found");
        }
        return response.json(); // Transform the data into json
      })
      .then((data) => {
        setBooks(data); // Set the books to the data returned by the API
      })
      .catch((error) => {
        console.error("Erreur fetching book:", error);
        setBooks(null); // Set the books to null if there is an error
      });
  }, [readerId]);

  // If the reader is not loaded yet, display a loading message
  if (!reader) {
    return <div>Loading...</div>;
  }
  return (
    <div className="mt-40 bg-white pt-8 flex flex-col items-center text-left ">
      <div className="md:w-[80%] py-16">
        <h1 className="pb-4 text-2xl">Mes informations personnelles</h1>
        <div className="m-8 bg-white drop-shadow-md  w-fit">
          <div className="p-4 flex flex-col md:flex-row">
            {reader.picture ? ( // If the reader has a picture, display it
              <img
                className=" w-full md:w-[10vw]"
                src={reader.picture}
                alt={reader.firstName}
              />
            ) : (
              // If the reader has no picture, display the default picture
              <img src={userImage} alt="default" style={{ width: "10vw" }} />
            )}
            <div className="flex mt-4 md:ml-4 flex-row">
              <div className="text-gray-500 ">
                <p>Prénom :</p>
                <p>Nom :</p>
                <p>Adresse mail :</p>
              </div>
              <div className="ml-8">
                <p>{reader.firstName}</p>
                <p>{reader.lastName}</p>
                <p>{reader.email}</p>
              </div>
            </div>
          </div>
        </div>
        <h1 className="pb-4 text-2xl mt-8">Mes emprunts</h1>
        <ul className="flex flex-col md:flex-row flex-wrap ">
          {books ? ( // If the reader has books, display them
            books.map((book) => <Book book={book} />)
          ) : (
            // If the reader has no books, display a message
            <div>Vous n'avez pas encore emprunté de livre</div>
          )}
        </ul>
      </div>
    </div>
  );
}
export default PersonalInfos;
