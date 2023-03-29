import React from "react";
import defaultImage from "./livre.png";
import { useParams } from "react-router-dom";
import { useState, useEffect } from "react";

function BookInfo() {
  const { id } = useParams();
  const [book, setBook] = useState(null);
  console.log("id", id);

  useEffect(() => {
    fetch(`http://localhost:8000/api/books/${id}`, {
      mode: "cors",
    })
      .then((response) => {
        if (response.status === 200) {
          return response.json();
        } else {
          throw new Error("Something went wrong on api server!");
        }
      })
      .then((data) => {
        setBook(data);
      })
      .catch((error) => {
        console.log(error);
      });
  }, [id]);

  if (!book) {
    return <div>Loading...</div>;
  }

  return (
    <div className="bg-white mt-40 flex flex-col items-center text-left">
      <div className="w-[90%] md:w-[80%] py-16 flex flex-col">
        <h2 className="text-2xl">{book.book.title}</h2>
        <div className="flex flex-row items-center">
          {book.book.picture ? (
            <img src={`${book.book.picture}`} alt={book.book.title} />
          ) : (
            <img src={defaultImage} alt="default" style={{ width: "128px" }} />
          )}
          <div className="ml-4 flex flex-col">
            <p className="text-gray-400">Auteur(s):</p>
            <ul>
              {book.authors.map((author) => (
                <li>{author.name}</li>
              ))}
            </ul>
            <p className="text-gray-400">Year:<p className="text-color">{book.book.year}</p></p>
          </div>
        </div>
        <h2 className="mt-4 text-xl ">Description:</h2>
        <p className="text-gray-400">{book.book.resume}</p>
      </div>
    </div>
  );
}
export default BookInfo;
