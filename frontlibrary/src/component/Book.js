import React from "react";
import defaultImage from "./livre.png";
import { Link } from "react-router-dom";

function Book(props) {
  const book = props.book;
  const titleLimit = 20;
  const resumeLimit = 50;
  console.log("book", book);
  console.log("book[0].id", book[0].id);

  return (
    <Link to={`/books/${book[0].id}`} className="bg-white p-3 drop-shadow-lg ease-out duration-150 hover:scale-110 hover:z-10 md:w-[18vw] mx-4 mt-4">
      <li key={book[0].id} className=" flex flex-col md:flex-row text-left ">
        {book[0].picture ? (
          <img src={`${book[0].picture}`} alt={book[0].title} className="object-cover h-[24vh] w-[100%] md:object-contain drop-shadow-md"/>
        ) : (
          <img src={defaultImage} alt="default" style={{ width: "128px" }} />
        )}
        <div className="ml-4 flex flex-col justify-between">
          <h3 className="text-lg font-medium">
            {book[0].title.length > titleLimit
              ? book[0].title.substring(0, titleLimit) + "..."
              : book[0].title}
          </h3>
          <p className="text-gray-300 text-sm">
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
