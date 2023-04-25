import { Link } from "react-router-dom";
import logo from "../assets/logo.png";

export function Header() {
	return (
		<header className="text-gray-600 body-font">
			<div className="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
				<Link to={"/"}>
					<img src={logo} alt="" width={100} />
				</Link>
				<nav className="md:ml-auto md:mr-auto flex flex-wrap items-center text-base justify-center">
					<a className="mr-5 hover:text-gray-900">
						Suppliers (Farmers)
					</a>
					<a className="mr-5 hover:text-gray-900">
						Manufacturers
					</a>
					<a className="mr-5 hover:text-gray-900">
						Certified products
					</a>
				</nav>
				<button className="inline-flex items-center bg-gray-100 border-0 py-1 px-3 focus:outline-none hover:bg-gray-200 rounded text-base mt-4 md:mt-0">
					Contact us
					<svg
						fill="none"
						stroke="currentColor"
						strokeLinecap="round"
						strokeLinejoin="round"
						strokeWidth="2"
						className="w-4 h-4 ml-1"
						viewBox="0 0 24 24"
					>
						<path d="M5 12h14M12 5l7 7-7 7"></path>
					</svg>
				</button>
			</div>
		</header>
	);
}
