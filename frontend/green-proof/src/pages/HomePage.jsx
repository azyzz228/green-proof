import { Header } from "../components/Header";

import heroPicture from "../assets/herobg.png"
import bigCertificate from "../assets/bigCertificate.png"
import partitionedCertificate from "../assets/partitionedCertificate.png"
import graphic from "../assets/graphic.png"
import { Feature } from "../components/Feature";
import { Content } from "../components/Content";

export function HomePage() {
	return (
        <>
        <Header />
		<div className="">
			{/* HERO */}
			<div className="relative text-center">
                <h1 className="absolute text-center text-5xl font-medium top-[50px] left-[260px]">Certification platform for agricultural products</h1>
                <img src={heroPicture} alt="" />
            </div>

            {/* Feature */}
            <Feature /> 

			{/* Two Certificates graphic */}
            <h1 className="p-16 mt-12 text-3xl font-bold text-green-950">We have 2 types of certificates</h1>
			<div className="flex flex-row py-10 px-32 justify-between items-center w-full container mx-auto">
				<div className="flex flex-col justify-start items-center">
					<img src={bigCertificate} alt="" />
				</div>

				<div className="flex flex-col justify-start items-center">
					<img src={partitionedCertificate} alt="" />
					<p></p>
				</div>
			</div>

            {/* Explanation graphic */}
            <div className="mx-auto container">
                <img src={graphic} alt="" />
            </div>


			<Content />
		</div>
        </>
	);
}
