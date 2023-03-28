import React from "react";
import defaultImage from "./livre.png";
import { Link } from "react-router-dom";

function Book(props) {
  const book = props.book;
  const titleLimit = 20;
  const resumeLimit = 50;

  return (
    <Link to={`/books/${book[0].id}`}>
      <li key={book[0].id} className="w-[18vw] flex flex-row text-left">
        {book[0].picture ? (
          <img src={`${book[0].picture}`} alt={book[0].title} />
        ) : (
          <img src={defaultImage} alt="default" style={{ width: "128px" }} />
        )}
        <div className="ml-4">
          <h3 className="text-lg font-medium">
            {book[0].title.length > titleLimit
              ? book[0].title.substring(0, titleLimit) + "..."
              : book[0].title}
          </h3>
          <p className="text-gray-500 text-sm">
            {book.nameAuthor ? book.nameAuthor : "auteur inconnu"} -{" "}
            {book[0].year}
          </p>
          <p className="text-gray-600 mt-2">
            {book[0].resume.length > resumeLimit
              ? book[0].resume.substring(0, resumeLimit) + "..."
              : book[0].resume}
          </p>
        </div>
      </li>
    </Link>
  );
}

export default Book;
