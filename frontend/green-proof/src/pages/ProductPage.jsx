import { useEffect, useState } from "react";
import { Header } from "../components/Header";
import QRCode from "react-qr-code";

export const ProductPage = () => {
	const searchParams = new URLSearchParams(location.search);
	const hash = searchParams.get("hash");
	const [productCertificate, setProductCertificate] = useState(null);

	const [qr, setQr] = useState(null);
	useEffect(() => {
		const fetchProductCertificate = async () => {
			try {
				const response = await fetch(
					`http://localhost:4000/api/product_certificates/${hash}`
				);
				const data = await response.json();
				setProductCertificate(data);
				setQr(productCertificate.hash);
			} catch (error) {
				console.error(error);
			}
		};

		fetchProductCertificate();
	}, [hash]);

	return (
		<>
			<Header />
			<div className="flex flex-row justify-evenly items-start container mx-auto">
				<QRCode value={qr}/>

				<div className="flex flex-col gap-12">
					<div className="flex flex-row justify-start items-start space-x-20">
						<div className="text-2xl font-semibold px-4 py-3 rounded-md bg-green-100 text-green-950">
							Supplier
						</div>
						<div className="">
							<h1 className="text-xl mb-4">
								{
									productCertificate
										.manufacturer
										.supplier
								}
							</h1>
							<ul>
								<li>
									{productCertificate
										.manufacturer
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
										.manufacturer
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
										.manufacturer
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
											.manufacturer
									}
								</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
		</>
	);
};
