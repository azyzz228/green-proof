import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
import { Routes, Route, BrowserRouter } from "react-router-dom";
import { HomePage } from "./pages/HomePage.jsx";
import { ManufacturerCertificatePage } from "./pages/ManufacturerCertificatePage";
import { CreateSupplierCertificatePage } from "./pages/CreateSupplierCertificatePage";
import { ProductPage } from "./pages/ProductPage";

ReactDOM.createRoot(document.getElementById("root")).render(
	<React.StrictMode>
		<BrowserRouter>
			<Routes>
				<Route path="/" element={<HomePage />}></Route>
				<Route path="/create_certificate" element={<CreateSupplierCertificatePage />}></Route>
				<Route path="/create_product" element={<ManufacturerCertificatePage />}></Route>
				<Route path="/product" element={<ProductPage />}></Route>
			</Routes>
		</BrowserRouter>
	</React.StrictMode>
);
