import React, { useEffect, useState } from "react";
import defaultImage from './livre.png';

function MyHomePage({ readerId }) {
  const [books, setBooks] = useState([]);
 

  useEffect(() => {
    fetch(`http://localhost:8000/api/readers/${readerId}/books`, {
      mode: "cors",
    })
      .then((response) => response.json())
      .then((data) => {
        // Trier les livres en fonction de la date de retour
        console.log(data);
        const sortedBooks = data.sort((a, b) => new Date(b.dateBorrow) - new Date(a.dateBorrow));
        setBooks(sortedBooks.slice(0, 4));
      });
  }, [readerId]);

  return (
    <div>
      <h2>4 derniers livres lus par le lecteur</h2>
      <ul>
        {books.map((book) => (
          <li key={book[0].id}>
            {book[0].picture ? ( // Si book.picture existe
              <img src={`${book[0].picture}`} alt={book[0].title} />
            ) : (
              <img
                src={defaultImage}
                alt="default"
                style={{ width: "128px"}}
              />
            )}
            {book[0].title} - {book[0].author} - {book[0].year}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default MyHomePage;