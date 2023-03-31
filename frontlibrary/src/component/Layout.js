import MyMenu from "./MyMenu";
import MyFooter from "./MyFooter";

/**
 * Layout component
 * It displays the menu and the footer.
 * It displays the children.
 * @param {*} param0  the children
 * @returns
 */
function Layout({ children }) {
  return (
    <>
      <MyMenu />
      {children}
      <MyFooter />
    </>
  );
}
export default Layout;
