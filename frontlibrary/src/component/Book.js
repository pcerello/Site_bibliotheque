import React from "react";
import defaultImage from "./livre.png";
import { Link } from "react-router-dom";

function Book(props) {
  const book = props.book;
  console.log(book);
  return (
    <Link to={`/books/${book[0].id}`}>
      <li key={book[0].id} className="w-[20vw] flex flex-row text-left">
        {book[0].picture ? ( // Si book.picture existe
          <img src={`${book[0].picture}`} alt={book[0].title} />
        ) : (
          <img src={defaultImage} alt="default" style={{ width: "128px" }} />
        )}
        {book[0].title} - {book.nameAuthor} - {book[0].year}
      </li>
    </Link>
  );
}

export default Book;
