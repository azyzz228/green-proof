import {
	AccountId,
	Client,
	ContractCallQuery,
	ContractExecuteTransaction,
	ContractFunctionParameters,
	PrivateKey,
} from "@hashgraph/sdk";
import { config } from "dotenv";

const contractId = process.env.CONTRACT_ID;

const operatorId = AccountId.fromString(process.env.ACCOUNT_ID);
const operatorKey = PrivateKey.fromString(process.env.PRIVATE_KEY);
const client = Client.forTestnet().setOperator(operatorId, operatorKey);

export async function test() {
	const contractQueryTx = new ContractCallQuery()
		.setContractId(contractId)
		.setGas(100000)
		.setFunction("test");

	const contractQuerySubmit = await contractQueryTx.execute(client);
	const res = contractQuerySubmit.getAddress(0);
	console.log(res);
	console.log(`function Test result -- ${res}`);
}

export async function getChair() {
	const query = new ContractCallQuery()
		.setContractId(contractId)
		.setGas(100000)
		.setFunction("chair");

	const res = await query.execute(client);
	console.log(res.getAddress(0));
	console.log(`res - ${res}`);
}

export async function grantSupplierIssuingRights(_supplier) {
	//Contract call query
	const query = new ContractExecuteTransaction()
		.setContractId(contractId)
		.setGas(60000)
		.setFunction(
			"grantSupplierIssuingRights",
			new ContractFunctionParameters().addAddress(
				_supplier	
			) // supplier address from MM
		);

	//Sign with the client operator private key to pay for the query and submit the query to a Hedera network
	const txResponse = await query.execute(client);
	const receipt = await txResponse.getReceipt(client);
	console.log(receipt);
	console.log(receipt.status);
	// Get the function value
}

// export async function grantSupplierIssuingRights(_to) {
// 	//Contract call query
// 	const query = new ContractExecuteTransaction()
// 		.setContractId(contractId)
// 		.setGas(60000)
// 		.setFunction(
// 			"grantSupplierIssuingRights",
// 			new ContractFunctionParameters().addAddress(
//                 _to
// 			) // supplier address from MM
// 		);

// 	//Sign with the client operator private key to pay for the query and submit the query to a Hedera network
// 	const txResponse = await query.execute(client);
//     const receipt = await txResponse.getReceipt(client);
//     console.log(receipt.status);
// 	// Get the function value
// }

export async function addCertificate(
	supplier,
	manufacturer,
	isLocallyOwned,
	isRegenerative,
	isFairTrade,
	quantity,
	productName,
	id
) {
	//Contract call query
	console.log("Calling addCertificate function");
	const query = new ContractExecuteTransaction()
		.setContractId(contractId)
		.setGas(9000000)
		.setFunction(
			"addCertificate",
			new ContractFunctionParameters()
				.addAddress(supplier)
				.addAddress(manufacturer)
				.addBool(isLocallyOwned)
				.addBool(isRegenerative)
				.addBool(isFairTrade)
				.addUint256(quantity)
				.addString(productName)
				.addUint128(id) // supplier address from MM
		);

	//Sign with the client operator private key to pay for the query and submit the query to a Hedera network
	const txResponse = await query.execute(client);
	const receipt = await txResponse.getReceipt(client);
	return receipt;
	console.log(receipt);
}

export async function issueCertificateToManufacturer() {
	console.log("Calling issueCertificateToManufacturer function");
	const query = new ContractExecuteTransaction()
		.setContractId(contractId)
		.setGas(9000000)
		.setFunction(
			"issueCertificateToManufacturer",
			new ContractFunctionParameters()
				.addAddress(
					"0x0000000000000000000000000000000000415471"
				)
				.addUint128(1) // supplier address from MM
		);
	//Sign with the client operator private key to pay for the query and submit the query to a Hedera network
	const txResponse = await query.execute(client);
	const receipt = await txResponse.getReceipt(client);
	console.log(receipt);
}

export async function produceProductFrom(_certificateId) {
	console.log("Calling produceProductFrom function");
	const query = new ContractExecuteTransaction()
		.setContractId(contractId)
		.setGas(9000000)
		.setFunction(
			"produceProductFrom",
			new ContractFunctionParameters().addUint128(
				_certificateId
			) // supplier address from MM
		);
	//Sign with the client operator private key to pay for the query and submit the query to a Hedera network
	const txResponse = await query.execute(client);
	const res = txResponse.transactionHash;
	const receipt = await txResponse.getReceipt(client);
	console.log(res);
	console.log(receipt);
}

// main();
// test();
// getChair();
// grantSupplierIssuingRights();
// addCertificate();
// issueCertificateToManufacturer();
// produceProductFrom();
