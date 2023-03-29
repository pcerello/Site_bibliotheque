import React from "react";
import { useEffect, useState } from "react";
import Book from "./Book";

function PersonalInfos({ readerId }) {
  const [reader, setReader] = useState(null);
  const [books, setBooks] = useState(null);

  useEffect(() => {
    fetch(`http://localhost:8000/api/readers/${readerId}`, {
      mode: "cors",
    })
      .then((response) => response.json())
      .then((data) => setReader(data));

  }, [readerId]);

  useEffect(() => {
    fetch(`http://localhost:8000/api/readers/${readerId}/books`, {
      mode: "cors",
    })
      .then((response) => {
      if(!response.ok){
        throw Error("404 Not Found");
      }
      return response.json();

  })
      .then((data) => {
      
        setBooks(data);
        console.log("data", books);
      })
      .catch((error) => {
        console.error("Erreur fetching book:", error);
        setBooks(null);
      })
      ;

  }, [readerId]);


  if (!reader) {
    return <div>Loading...</div>;
  }
  return (
    <div className="mt-40 bg-white pt-8 flex flex-col items-center text-left "> 
      <div className="md:w-[80%] py-16">
        <h1 className="pb-4 text-2xl">Mes informations personnelles</h1>
        <div className=" bg-white drop-shadow-md  w-fit">
          <div className="p-8 flex flex-row">
            <div>
              <p>Prénom :</p>
              <p>Nom :</p>
              <p>Adresse mail :</p>
              <p>Ma photo :</p>
            </div>
            <div className="ml-8">
              <p>{reader.firstName}</p>
              <p>{reader.lastName}</p>
              <p>{reader.email}</p>
              <p>{reader.picture}</p>
            </div>
          </div>
        </div>
        <h1 className="pb-4 text-2xl mt-8">Mes emprunts</h1>
        <ul className="flex flex-col md:flex-row flex-wrap ">
          {books ? (books.map((book) => (
            <Book book={book} />
          ))) : (<div>Vous n'avez pas encore emprunté de livre</div>)}
        </ul>
      </div>
    </div>
  );
}
export default PersonalInfos;
