import React, { useEffect, useState } from "react";
import Book from "./Book";
import defaultImage from "./livre.png";

function MyHomePage({ readerId }) {
  const [books, setBooks] = useState([]);
  const [booksAll, setBooksAll] = useState([]);

  useEffect(() => {
    fetch(`http://localhost:8000/api/readers/${readerId}/books?max=4`, {
      mode: "cors",
    })
      .then((response) => response.json())
      .then((data) => {
        setBooks(data);
      });
  }, [readerId]);

  useEffect(() => {
    fetch(`http://localhost:8000/api/books`, {
      mode: "cors",
    })
      .then((response) => response.json())
      .then((data) => {
        setBooksAll(data);
      });
  }, []);

  return (
    <div>
      <h2 className="text-2xl p-16">4 derniers livres lus par le lecteur</h2>
      <ul className="flex flex-row flex-wrap space-x-4">
        {books.map((book) => (
          <Book book={book} />
        ))}
      </ul>
      <h2 className="text-2xl p-16">Les livres</h2>
      <ul className="flex flex-row flex-wrap space-x-4 space-y-16 ">
        {booksAll.map((book) => (
          <Book book={book} />
        ))}
      </ul>
    </div>
  );
}

export default MyHomePage;
