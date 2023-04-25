import { Header } from "../components/Header";
import bigCertificate from "../assets/bigCertificate.png";
import { useState } from "react";
import { connectToMetamask } from "../services/metamaskService";
import { LoadingModal } from "../components/LoadingModal";
import { redirect } from "react-router-dom";
import {
	addCertificate,
	issueCertificateToManufacturer,
} from "../services/hedera";
export function CreateSupplierCertificatePage() {
	const [selectedOption, setSelectedOption] = useState(true);

	const [selectedOptionRegen, setSelectedOptionRegen] = useState(true);
	const [selectedOptionFair, setSelectedOptionFair] = useState(true);

	const [manufacturer, setManufacturer] = useState();
	const [quantity, setQuantity] = useState();
	const [productName, setProductName] = useState();

	const handleOptionChange = (event) => {
		const value = event.target.value === "true";
		setSelectedOption(value);
	};

	const handleOptionChange2 = (event) => {
		const value = event.target.value === "true";
		setSelectedOptionRegen(value);
	};

	const handleOptionChange3 = (event) => {
		const value = event.target.value === "true";
		setSelectedOptionFair(value);
	};
	const [currentAccount, setCurrentAccount] = useState(null);
	const retrieveWalletAddress = async () => {
		const addresses = await connectToMetamask();
		if (addresses) {
			// grab the first wallet address
			setCurrentAccount(addresses[0]);
			console.log(addresses[0]);
		}
	};

	const [loading, setLoading] = useState(false);

	const handleClick = async () => {
		setLoading(true);
		const dateNow = Date.now();
		const data = {
			supplier: currentAccount,
			manufacturer,
			isLocallyOwned: selectedOption,
			isRegenerative: selectedOptionRegen,
			isFairTrade: selectedOptionFair,
			quantity: quantity,
			productName: productName,
			id: dateNow,
		};
		const url = "https://localhost:4000/api/supplier_certificates";

		const { status } = await addCertificate(
			currentAccount,
			manufacturer,
			selectedOption,
			selectedOptionRegen,
			selectedOptionFair,
			quantity,
			productName,
			dateNow
		);

		if (status._code !== 22) {
			setLoading(false);
			alert("Could not create certificate");
		}

		const status_2 = await issueCertificateToManufacturer(
			currentAccount,
			dateNow
		);

		if (status_2.status._code !== 22) {
			setLoading(false);
			alert("Could not create certificate to manufacturer");
		}

		fetch(url, {
			method: "POST",
			headers: {
				"Content-Type": "application/json", // Replace with the content type of your request body
			},
			body: JSON.stringify(data), // Convert data to a JSON string
		})
			.then((response) => response.json()) // Parse the response as JSON
			.then((data) => console.log(data)) // Log the response data to the console
			.catch((error) => console.error(error)); // Handle any errors

		setLoading(false);
		return redirect("/");
	};

	return (
		<>
			<Header />
			{loading && <LoadingModal />}
			<div className="flex flex-row space-x-8 justify-evenly container mx-auto">
				<img src={bigCertificate} alt="" />
				<div className="p-8 lg:w-1/2 mx-auto rounded-md shadow-lg">
					<div className="bg-zinc-100 rounded-b-lg py-12 px-4 lg:px-24">
						<p className="text-center text-sm text-zinc-500 font-light">
							Fill in the form
						</p>
						{!currentAccount && (
							<button
								onClick={() =>
									retrieveWalletAddress()
								}
								className="px-4 py-3 rounded-sm ring-1 ring-sky-500 hover:bg-sky-300"
							>
								Connect Wallet
							</button>
						)}
						{currentAccount && (
							<p>{currentAccount}</p>
						)}

						<form className="mt-6">
							<div className="relative">
								<input
									className="appearance-none border pl-4 border-zinc-100 shadow-sm focus:shadow-md focus:placeholder-zinc-600  transition  rounded-md w-full py-3 text-zinc-600 leading-tight focus:outline-none focus:ring-zinc-600 focus:shadow-outline"
									id="username"
									type="text"
									placeholder="manufacturer_address"
									onChange={(
										e
									) =>
										setManufacturer(
											e
												.target
												.value
										)
									}
								/>
							</div>
							<div className="relative mt-3 flex flex-row justify-between items-center gap-8">
								<p>
									Regenerative
									farming
								</p>
								<select
									value={
										selectedOption
									}
									onChange={
										handleOptionChange
									}
									className="p-3 rounded-sm"
								>
									<option
										value={
											true
										}
									>
										True
									</option>
									<option
										value={
											false
										}
									>
										False
									</option>
								</select>
							</div>

							<div className="relative mt-3 flex flex-row justify-between items-center gap-8">
								<p>
									Locally
									owned
								</p>
								<select
									value={
										selectedOptionRegen
									}
									onChange={
										handleOptionChange2
									}
									className="p-3 rounded-sm"
								>
									<option
										value={
											true
										}
									>
										True
									</option>
									<option
										value={
											false
										}
									>
										False
									</option>
								</select>
							</div>

							<div className="relative mt-3 flex flex-row justify-between items-center gap-8">
								<p>
									Uses
									fairtrade
									policies
								</p>
								<select
									value={
										selectedOptionFair
									}
									onChange={
										handleOptionChange3
									}
									className="p-3 rounded-sm"
								>
									<option
										value={
											true
										}
									>
										True
									</option>
									<option
										value={
											false
										}
									>
										False
									</option>
								</select>
							</div>
							<div className="relative my-4">
								<input
									className="appearance-none border pl-4 border-zinc-100 shadow-sm focus:shadow-md focus:placeholder-zinc-600  transition  rounded-md w-full py-3 text-zinc-600 leading-tight focus:outline-none focus:ring-zinc-600 focus:shadow-outline"
									id="username"
									type="text"
									placeholder="product name"
									onChange={(
										e
									) =>
										setProductName(
											e
												.target
												.value
										)
									}
								/>
							</div>
							<div className="relative my-4">
								<input
									className="appearance-none border pl-4 border-zinc-100 shadow-sm focus:shadow-md focus:placeholder-zinc-600  transition  rounded-md w-full py-3 text-zinc-600 leading-tight focus:outline-none focus:ring-gray-600 focus:shadow-outline"
									id="username"
									type="number"
									placeholder="quantity"
									onChange={(
										e
									) =>
										setQuantity(
											e
												.target
												.value
										)
									}
								/>
							</div>
							<div className="flex items-center justify-center mt-8">
								<button
									onClick={
										handleClick
									}
									className="text-white py-2 px-4 uppercase rounded bg-green-500 hover:bg-green-600 shadow hover:shadow-lg font-medium transition transform hover:-translate-y-0.5"
								>
									Submit
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</>
	);
}
