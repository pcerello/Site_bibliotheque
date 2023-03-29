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
    <div>
      {book.book.picture ? (
        <img src={`${book.book.picture}`} alt={book.book.title} />
      ) : (
        <img src={defaultImage} alt="default" style={{ width: "128px" }} />
      )}
      <h2>{book.book.title}</h2>
      <p>Auteur(s):</p>
      <ul>
        {book.authors.map((author) => (
          <li>{author.name}</li>
        ))}
      </ul>
      <p>Year: {book.book.year}</p>
      <p>Description: {book.book.resume}</p>
    </div>
  );
}
export default BookInfo;
