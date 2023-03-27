import React from "react";
import defaultImage from "./livre.png";
import { useParams } from "react-router-dom";
import { useState, useEffect } from "react";

function BookInfo() {
  const { id } = useParams();
  const [book, setBook] = useState(null);

  useEffect(() => {
    fetch(`http://localhost:8000/api/books/${id}`, {
      mode: "cors",
    })
      .then((response) => response.json())
      .then((data) => setBook(data));
  }, [id]);

  if (!book) {
    return <div>Loading...</div>;
  }

  return (
    <div>
      {book[0].picture ? (
        <img src={`${book[0].picture}`} alt={book[0].title} />
      ) : (
        <img src={defaultImage} alt="default" style={{ width: "128px" }} />
      )}
      <h2>{book[0].title}</h2>
      <p>Author: {book.nameAuthor}</p>
      <p>Year: {book[0].year}</p>
      <p>Description: {book[0].resume}</p>
    </div>
  );
}
export default BookInfo;
