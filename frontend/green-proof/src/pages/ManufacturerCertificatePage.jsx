import { useEffect, useState } from "react";
import { Header } from "../components/Header";
import { connectToMetamask } from "../services/metamaskService";
import { produceProductFrom } from "../services/hedera";

export function ManufacturerCertificatePage() {


	const [currentAccount, setCurrentAccount] = useState(null);
	const retrieveWalletAddress = async () => {
		const addresses = await connectToMetamask();
		if (addresses) {
			// grab the first wallet address
			setCurrentAccount(addresses[0]);
			console.log(addresses[0]);
		}
	};

	const searchParams = new URLSearchParams(location.search);
	const the_id = searchParams.get("the_id");
	const [productCertificate, setProductCertificate] = useState(null);

	useEffect(() => {
		const fetchProductCertificate = async () => {
			try {
				const response = await fetch(
					`http://localhost:4000/api/manufacturer_certificates/${the_id}`
				);
				const data = await response.json();
				setProductCertificate(data);
			} catch (error) {
				console.error(error);
			}
		};

		fetchProductCertificate();
	}, [the_id]);


	const [value, setValue] = useState("");

	const handleChange = (event) => {
		setValue(event.target.value);
	};

	const handleSubmit = (event) => {
		event.preventDefault();
		produceProductFrom(produceProductFrom.the_id);
	};

	return (
		<div className="mb-20">
			<Header />

			<div className="w-full pl-28 py-20 space-y-16">
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
					<>
						<div className="">
							<div className="flex flex-row justify-start items-start space-x-20">
								<div className="text-2xl font-semibold px-4 py-3 rounded-md bg-green-100 text-green-950">
									Supplier
								</div>
								<div className="">
									<h1 className="text-xl mb-4">
										{
											productCertificate
												.supplier
										}
									</h1>
									<ul>
										<li>
											{productCertificate
												.isRegenerative && (
												<p>
													Uses
													regenerative
													agriculture
												</p>
											)}
										</li>
										<li>
											{productCertificate
												.isLocallyOwned && (
												<p>
													is
													locally
													owned
												</p>
											)}
										</li>
										<li>
											{productCertificate
												.isFairTrade && (
												<p>
													fairtrade
													policies
													present
												</p>
											)}
										</li>
									</ul>
								</div>
							</div>
						</div>

						<div className="">
							<div className="flex flex-row justify-start items-start space-x-20">
								<div className="text-2xl font-semibold px-4 py-3 rounded-md bg-cyan-100 text-cyan-950">
									Producer
								</div>
								<div className="">
									<h1 className="text-xl mb-4">
										{
											productCertificate
												.manufacturer
										}
									</h1>
								</div>
							</div>
						</div>

						<form
							onSubmit={handleSubmit}
							className="max-w-md mx-auto mt-4"
						>
							<div className="flex flex-wrap -mx-3 mb-6">
								<div className="w-full px-3">
									<label
										htmlFor="number"
										className="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
									>
										Number
									</label>
									<input
										id="number"
										type="number"
										className="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
										value={
											value
										}
										onChange={
											handleChange
										}
									/>
								</div>
							</div>
							<button
								type="submit"
								className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
							>
								Submit
							</button>
						</form>
					</>
				)}
			</div>
		</div>
	);
}
