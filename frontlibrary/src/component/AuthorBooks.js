import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

function AuthorBooks() {
  const { authorId } = useParams();
  const [books, setBooks] = useState([]);

  useEffect(() => {
    fetch(`http://localhost:8000/api/books?date=DESC&idAuthor=${authorId}`, {
      mode: "cors",
    })
      .then((response) => response.json())
      .then((data) => {
        setBooks(data);
        console.log("data", data);
      });
  }, [authorId]);

  return (
    <div>
      <h1>Livres de l'auteur</h1>
      <ul>
        {books.map((book) => (
          <li key={book.id}>{book.title}</li>
        ))}
      </ul>
    </div>
  );
}

export default AuthorBooks;
