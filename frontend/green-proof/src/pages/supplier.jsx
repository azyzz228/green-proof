import { useState } from "react";
import { connectToMetamask } from "../services/metamaskService";

function Supplier() {
	const [currentAccount, setCurrentAccount] = useState(null);

	const retrieveWalletAddress = async () => {
		const addresses = await connectToMetamask();
		if (addresses) {
			// grab the first wallet address
			setCurrentAccount(addresses[0]);
			console.log(addresses[0]);
		}
	};

	return (
		<>
            <h1 className='text-slate-800 font-bold text-base mb-2'>Salom <span className='text-base font-mono font-normal text-sky-500'>{`${currentAccount ? currentAccount + '!' : '!'}`}</span></h1>
        
			{!currentAccount && (
				<button
					onClick={() => retrieveWalletAddress()}
					className="px-4 py-3 rounded-sm ring-1 ring-sky-500 hover:bg-sky-300"
				>
					Connect Wallet
				</button>
			)}
		</>
	);
}

export default Supplier;
